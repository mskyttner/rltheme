library(devtools)
library(usethis)
library(pkgdown)
#use_readme_rmd()


document()
check()

# first revert the .gitignore if it has been changed by below
build_vignettes()
pkgdown::build_site()



