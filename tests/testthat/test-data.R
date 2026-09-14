describe("craddock200_cortical", {
  it("is a valid cortical ggseg_atlas", {
    expect_s3_class(craddock200_cortical(), "ggseg_atlas")
    expect_s3_class(craddock200_cortical(), "cortical_atlas")
    expect_true(ggseg.formats::is_ggseg_atlas(craddock200_cortical()))
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("ggplot2")
    skip_if_not_installed("vdiffr")
    p <- ggplot2::ggplot() +
      ggseg::geom_brain(
        atlas = craddock200_cortical(),
        mapping = ggplot2::aes(fill = label),
        position = ggseg::position_brain(hemi ~ view),
        show.legend = FALSE
      ) +
      ggplot2::scale_fill_manual(
        values = craddock200_cortical()$palette,
        na.value = "grey"
      ) +
      ggplot2::theme_void()
    vdiffr::expect_doppelganger("craddock200-cortical-2d", p)
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg3d")
    skip_if_not_installed("ggseg.meshes")
    p <- ggseg3d::ggseg3d(atlas = craddock200_cortical())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})

describe("craddock200_subcortical", {
  it("is a valid subcortical ggseg_atlas", {
    expect_s3_class(craddock200_subcortical(), "ggseg_atlas")
    expect_s3_class(craddock200_subcortical(), "subcortical_atlas")
    expect_true(ggseg.formats::is_ggseg_atlas(craddock200_subcortical()))
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg3d")
    skip_if_not_installed("ggseg.meshes")
    p <- ggseg3d::ggseg3d(atlas = craddock200_subcortical())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})

describe("adhd200 atlases", {
  atlases <- list(
    adhd200_200_cortical = adhd200_200_cortical,
    adhd200_400_cortical = adhd200_400_cortical,
    adhd200_200_subcortical = adhd200_200_subcortical,
    adhd200_400_subcortical = adhd200_400_subcortical
  )

  for (nm in names(atlases)) {
    local({
      name <- nm
      atlas <- atlases[[nm]]
      type <- if (grepl("subcortical", name)) {
        "subcortical_atlas"
      } else {
        "cortical_atlas"
      }

      it(paste(name, "is a valid ggseg_atlas"), {
        expect_s3_class(atlas(), "ggseg_atlas")
        expect_s3_class(atlas(), type)
        expect_true(ggseg.formats::is_ggseg_atlas(atlas()))
      })

      it(paste(name, "has a colour per region"), {
        labels <- ggseg.formats::atlas_labels(atlas())
        palette <- ggseg.formats::atlas_palette(atlas())
        expect_setequal(names(palette), labels)
        expect_length(unique(palette), length(labels))
      })

      it(paste(name, "has 2D geometry for every region"), {
        labels <- ggseg.formats::atlas_labels(atlas())
        geom <- ggseg.formats::atlas_geom(atlas())
        expect_true(all(labels %in% geom$label))
      })

      it(paste(name, "renders with ggseg3d"), {
        skip_if_not_installed("ggseg3d")
        skip_if_not_installed("ggseg.meshes")
        expect_s3_class(
          ggseg3d::ggseg3d(atlas = atlas()),
          c("ggseg3d", "htmlwidget")
        )
      })
    })
  }
})

describe("craddock200_subcortical geometry", {
  it("holds no cortical parcels that belong on the surface", {
    misclassified <- c(
      "Parcel_083",
      "Parcel_091",
      "Parcel_139",
      "Parcel_169",
      "Parcel_196"
    )
    subcortical <- ggseg.formats::atlas_labels(craddock200_subcortical())
    cortical <- ggseg.formats::atlas_labels(craddock200_cortical())
    expect_length(intersect(misclassified, subcortical), 0)
    expect_true(all(
      vapply(misclassified, function(p) any(grepl(p, cortical)), logical(1))
    ))
  })

  it("has structures in every view", {
    atlas <- craddock200_subcortical()
    labels <- ggseg.formats::atlas_labels(atlas)
    geom <- ggseg.formats::atlas_geom(atlas)
    points <- do.call(
      rbind,
      lapply(seq_len(nrow(geom)), function(i) {
        polygon <- geom$geometry[[i]]
        polygon$label <- geom$label[i]
        polygon
      })
    )
    labelled <- points[points$label %in% labels, ]
    expect_setequal(unique(labelled$view), unique(points$view))
  })
})
