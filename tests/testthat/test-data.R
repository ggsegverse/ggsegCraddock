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
    p <- ggseg3d::ggseg3d(atlas = craddock200_subcortical())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})
