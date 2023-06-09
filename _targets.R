## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

## tar_plan supports drake-style targets and also tar_target()
tar_plan(

  use_values = rnorm(100),
  na_values = c(NA, use_values),
  sd_2part_v1 = safe_twopart_v1(use_values),
  sd_2part_v2 = safe_twopart_v2(use_values),

  sd_1part_v1 = safe_singlepart_v1(use_values),
  sd_1part_v2 = safe_singlepart_v2(use_values),

  sd_other_v1 = safe_sd_v1(use_values),
  sd_other_v2 = safe_sd_v2(use_values),

  sd_1part_v1_na = safe_singlepart_v1(na_values),

  sd_dependent = safe_sd_depends(use_values)
)
