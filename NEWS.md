# ggsegCraddock 1.0.3.9002

- The grey brain silhouette in the subcortical atlases is drawn as context
  again instead of as one big coloured region, which read as cortex leaking
  into an atlas of subcortical structures. The README figures now colour the
  parcels from the atlas palette and send everything the core does not name
  to grey; the medial wall in the cortical figures is grey for the same
  reason. Any plot mapping `fill = label` needs this until
  ggsegverse/ggseg#182 lands.
- Fixed the sagittal panel painting its silhouette over its own structures.
  In `adhd200_400_subcortical()` it was a blank grey silhouette with all
  twenty of its structures hidden behind it. Works around
  ggsegverse/ggseg.extra#161 and ggsegverse/ggseg#181.

# ggsegCraddock 1.0.3.9001

- The cerebellum is now an atlas of its own. `craddock200_cerebellar()`,
  `adhd200_200_cerebellar()` and `adhd200_400_cerebellar()` draw the 17, 22 and
  43 parcels that fall in the cerebellum on the SUIT flatmap, instead of
  leaving them in the subcortical atlas as blobs under the brain silhouette.
  Parcels are named by the side they sit on, as `left_Parcel_009`.
- Fixed the frontal and superior cortex still filed as subcortical in the
  ADHD-200 atlases. Those parcellations were clustered on EPI data and reach
  past the edge of FreeSurfer's brain, so a frontal-pole or vertex parcel can
  be two-thirds unlabelled in `aparc+aseg` and only a quarter cortical ribbon
  by volume, which fell through the absolute 0.25 threshold. The test now
  compares grey matter with grey matter, ignoring white matter and unlabelled
  voxels: measured that way the same parcels are 60-100% cortical.
  `adhd200_400_subcortical()` drops from 108 parcels to 36 and
  `adhd200_200_subcortical()` from 39 to 16; `craddock200_subcortical()` goes
  from 36 to 19. Nothing that was cortical stopped being cortical - the new
  rule forces a strict superset of the old one.
- The grey context silhouette in the subcortical atlases keeps its sulci,
  fissures and ventricles. It was being simplified and morphologically closed
  along with the structures, and a close fills every opening narrower than the
  smoothing distance, which turned the brain outline into a blob. The context
  is now polished in its own pass, with most of its vertices kept and Chaikin
  corner-cutting instead of a close; the structures are still simplified hard
  and closed.
- Rebuilt all nine atlases against the fixed ggseg.extra pipeline: cortical
  holes
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
