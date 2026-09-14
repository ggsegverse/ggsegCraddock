# ggsegCraddock 1.0.4

- Rebuilt all six atlases against the fixed ggseg.extra pipeline: cortical holes
  are filled, the medial wall is kept as grey context, snapshot masks are read
  with an explicit y direction, subcortical labels no longer collide with the
  brain-outline indices, and subcortical slabs are framed on the label bounding
  box.
- Fixed the frontal-cortex blob in `craddock200_subcortical()`. `Parcel_083`,
  `Parcel_091`, `Parcel_139`, `Parcel_169` and `Parcel_196` are cortical parcels
  that the vertex-count heuristic misclassified as subcortical, because at 4 mm
  small medial parcels project to fewer than 50 surface vertices. The build now
  resamples FreeSurfer's `aparc+aseg` onto the parcellation grid and forces any
  parcel that overlaps cortical ribbon substantially, and subcortical grey
  hardly at all, to be cortical.
- The ADHD-200 subcortical atlases now show discrete structures. Their largest
  mesh drops from 3388 (CC200) and 3613 (CC400) vertices - single blobs spanning
  the whole brain - to 156 and 106.
- Every atlas now has evenly spaced, distinct hues. The generated lookup tables
  carry `0 0 0` for every parcel, so the atlases used to render solid black.
- `data-raw/make_atlas.R` now passes `decimate` through `subcortical_opts` and
  uses `registration = "header"`; the retired `tolerance`/`smoothness`
  arguments are gone.
- `data-raw/make_adhd200.R` no longer crashes on `sysdata_env[...] <- ...`
  (single-bracket assignment on an environment). Both build scripts now stash
  their atlases in `data-raw/atlases/` and rebuild the whole of `R/sysdata.rda`
  from that stash, so running one script no longer drops the other's atlases.

# ggsegCraddock 1.0.3

- Atlas 2D geometry migrated to the sf-optional `brain_polygons` format
  (`ggseg.formats` 0.0.3). The atlases now render without `sf` and its
  GDAL/GEOS/PROJ system libraries, enabling wasm and air-gapped installs.
  Plots are unchanged.

# ggsegCraddock 1.0.0

* Initial release with `craddock200_cortical` and `craddock200_subcortical`
  atlases as unified `ggseg_atlas` objects for the ggseg 2.0 ecosystem.
