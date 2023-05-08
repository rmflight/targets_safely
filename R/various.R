safe_twopart_v1 = function(values)
{
  my_sd = function(values)
  {
    sd(values)
  }

  safe_sd = purrr::safely(my_sd)
  safe_sd(values)
}

safe_twopart_v2 = function(values)
{
  my_sd = function(values)
  {
    mn_vals = mean(values)
    diffs_mn = values - mn_vals
    sum_sq = sum(diffs_mn^2)
    sqrt(sum_sq / (length(values) - 1))
  }
  safe_sd = purrr::safely(my_sd)
  safe_sd(values)
}

safe_singlepart_v1 = function(values)
{
  safe_sd = purrr::safely(.f = function(values){
    sd(values)
  })
  safe_sd(values)
}

safe_singlepart_v2 = function(values)
{
  safe_sd = purrr::safely(.f = function(values){
    mn_vals = mean(values)
    diffs_mn = values - mn_vals
    sum_sq = sum(diffs_mn^2)
    sqrt(sum_sq / (length(values) - 1))
  })
  safe_sd(values)
}

sd_default = function(values)
{
  sd(values)
}

safe_sd_v1 = purrr::safely(sd_default)

sd_notdefault = function(values)
{
  sd(values)
}

safe_sd_v2 = purrr::safely(sd_notdefault)

safe_sd_depends = function(values){
  safe_version = purrr::safely(sd_notdefault)
  safe_version(values)
}