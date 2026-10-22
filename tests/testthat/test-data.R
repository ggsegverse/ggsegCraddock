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
    adhd200_400_subcortical = adhd200_400_subcortical,
    adhd200_200_cerebellar = adhd200_200_cerebellar,
    adhd200_400_cerebellar = adhd200_400_cerebellar
  )

  for (nm in names(atlases)) {
    local({
      name <- nm
      atlas <- atlases[[nm]]
      type <- if (grepl("subcortical", name)) {
        "subcortical_atlas"
      } else if (grepl("cerebellar", name)) {
        "cerebellar_atlas"
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

      it(paste(name, "has geometry for every region"), {
        labels <- ggseg.formats::atlas_labels(atlas())
        geom <- ggseg.formats::atlas_geom(atlas())
        if (type == "cerebellar_atlas") {
          # A region sitting too deep to reach the SUIT surface has no
          # place on the flatmap, but still has its 3D vertices.
          expect_true(all(labels %in% atlas()$data$vertices$label))
        } else {
          expect_true(all(labels %in% geom$label))
        }
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

describe("craddock200_cerebellar", {
  it("is a valid cerebellar ggseg_atlas", {
    expect_s3_class(craddock200_cerebellar(), "ggseg_atlas")
    expect_s3_class(craddock200_cerebellar(), "cerebellar_atlas")
    expect_true(ggseg.formats::is_ggseg_atlas(craddock200_cerebellar()))
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg3d")
    skip_if_not_installed("ggseg.meshes")
    p <- ggseg3d::ggseg3d(atlas = craddock200_cerebellar())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})

describe("cerebellum is its own atlas", {
  # The Craddock parcellations cover the whole brain, and the cerebellar
  # parcels used to sit in the subcortical atlas as blobs under the
  # silhouette. Each parcel now belongs to exactly one of the three.
  families <- list(
    craddock200 = list(
      subcortical = craddock200_subcortical,
      cerebellar = craddock200_cerebellar,
      known = c("Parcel_009", "Parcel_118", "Parcel_176")
    ),
    adhd200_200 = list(
      subcortical = adhd200_200_subcortical,
      cerebellar = adhd200_200_cerebellar,
      known = c("region_0121", "region_0145", "region_0183")
    ),
    adhd200_400 = list(
      subcortical = adhd200_400_subcortical,
      cerebellar = adhd200_400_cerebellar,
      known = c("region_0036", "region_0138", "region_0278")
    )
  )

  for (nm in names(families)) {
    local({
      name <- nm
      family <- families[[nm]]
      parcel <- function(labels) sub("^(left|right|vermis)_", "", labels)

      it(paste(name, "keeps cerebellar parcels out of the subcortex"), {
        subcortical <- ggseg.formats::atlas_labels(family$subcortical())
        cerebellar <- parcel(ggseg.formats::atlas_labels(family$cerebellar()))
        expect_length(intersect(subcortical, cerebellar), 0)
        expect_true(all(family$known %in% cerebellar))
        expect_length(intersect(family$known, subcortical), 0)
      })

      it(paste(name, "names every cerebellar parcel by side"), {
        labels <- ggseg.formats::atlas_labels(family$cerebellar())
        expect_true(all(grepl("^(left|right|vermis)_", labels)))
      })
    })
  }
})

describe("adhd200 subcortical composition", {
  # The ADHD-200 parcellations were clustered on EPI data and reach past the
  # edge of FreeSurfer's brain, so superficial parcels are mostly unlabelled
  # in aparc+aseg and an absolute ribbon threshold filed them as subcortical.
  # These are the frontal and superior parcels that used to come through.
  it("puts frontal-pole and vertex parcels on the surface", {
    strays <- list(
      adhd200_200 = list(
        cortical = adhd200_200_cortical,
        subcortical = adhd200_200_subcortical,
        parcels = "region_0003"
      ),
      adhd200_400 = list(
        cortical = adhd200_400_cortical,
        subcortical = adhd200_400_subcortical,
        parcels = c(
          "region_0316",
          "region_0328",
          "region_0387",
          "region_0207",
          "region_0123"
        )
      )
    )
    for (stray in strays) {
      subcortical <- ggseg.formats::atlas_labels(stray$subcortical())
      cortical <- ggseg.formats::atlas_labels(stray$cortical())
      expect_length(intersect(stray$parcels, subcortical), 0)
      expect_true(all(vapply(
        stray$parcels,
        function(p) any(grepl(p, cortical, fixed = TRUE)),
        logical(1)
      )))
    }
  })
})

describe("subcortical context", {
  # The brain silhouette is context, not a parcel: the geometry carries it but
  # the core does not name it, which is how ggseg tells the two apart. It has
  # to sit under the structures and stay out of the colour scale.
  atlases <- list(
    craddock200 = craddock200_subcortical,
    adhd200_200 = adhd200_200_subcortical,
    adhd200_400 = adhd200_400_subcortical
  )

  context_rows <- function(atlas) {
    geom <- ggseg.formats::atlas_geom(atlas)
    !geom$label %in% ggseg.formats::atlas_labels(atlas)
  }

  for (nm in names(atlases)) {
    local({
      name <- nm
      atlas <- atlases[[nm]]

      it(paste(name, "draws the context under every structure"), {
        # ggseg paints the geometry table in order, so the silhouette has to
        # come first. The sagittal one, `cortex_left`, used to sort last and
        # cover its panel: on CC400 that hid all twenty of its structures.
        is_context <- context_rows(atlas())
        expect_gt(sum(is_context), 0)
        expect_equal(which(is_context), seq_len(sum(is_context)))
      })

      it(paste(name, "keeps the context out of the palette"), {
        geom <- ggseg.formats::atlas_geom(atlas())
        context <- geom$label[context_rows(atlas())]
        expect_length(
          intersect(context, names(ggseg.formats::atlas_palette(atlas()))),
          0
        )
      })

      it(paste(name, "keeps the holes a morphological close would fill"), {
        # The silhouette is corner-cut rather than closed, because a close
        # fills every sulcus and ventricle narrower than the smoothing
        # distance. Its openings are what make it read as a brain, not a blob.
        geom <- ggseg.formats::atlas_geom(atlas())
        silhouette <- geom$geometry[[which(context_rows(atlas()))[1]]]
        holes <- unique(silhouette[c("view", "group", "subgroup")])
        expect_gt(sum(holes$subgroup > 1), 0)
      })
    })
  }

  it("renders as the grey backdrop, not as a parcel", {
    # The context has no `region`, but it does have a `label`, and the figures
    # map `fill = label`. A plain discrete scale has no reason to treat a
    # context label differently from a parcel, so without a scale that sends
    # the unmatched labels to grey the whole brain is painted as if it were
    # parcellated. This is the panel the whole describe block is about, and
    # the only subcortical atlas with a visual snapshot.
    skip_if_not_installed("ggseg")
    skip_if_not_installed("ggplot2")
    skip_if_not_installed("vdiffr")
    atlas <- adhd200_200_subcortical()
    p <- ggplot2::ggplot() +
      ggseg::geom_brain(
        atlas = atlas,
        mapping = ggplot2::aes(fill = label),
        position = ggseg::position_brain(. ~ view),
        show.legend = FALSE
      ) +
      ggseg::scale_fill_brain_manual(ggseg.formats::atlas_palette(atlas)) +
      ggplot2::theme_void()
    vdiffr::expect_doppelganger("adhd200-200-subcortical-2d", p)
  })
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
