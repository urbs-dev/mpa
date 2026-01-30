# install.packages(c('pkgdown', 'covr', 'testthat', 'remotes'))
# replace with check installed for each package and install if not already installed

if (!requireNamespace("pkgdown", quietly = TRUE)) {
  install.packages("pkgdown")
}

if (!requireNamespace("covr", quietly = TRUE)) {
  install.packages("covr")
}

if (!requireNamespace("testthat", quietly = TRUE)) {
  install.packages("testthat")
}

if (!requireNamespace("badger", quietly = TRUE)) {
  install.packages("badger")
}

remotes::install_deps(dependencies = TRUE)

cov <- covr::package_coverage()

print(cov)

percent <- covr::percent_coverage(cov)

percentstr <- paste0(format(percent, nsmall = 1), "%25")

covbadge <- badger::badge_custom(
  x = "coverage",
  y = percentstr,
  alt = "Code Coverage",
  color = ifelse(test = percent < 30, 
                 yes = "red",
                 no = ifelse(test = percent < 70, 
                              yes = "yellow", 
                              "brightgreen")
  )
)

cat(covbadge, "\n", file = "covbadge.txt")

devtools::build_readme()
devtools::build_site(preview = FALSE)