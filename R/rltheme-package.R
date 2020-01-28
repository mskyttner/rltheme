#' Theme and Theme Components for 'ggplot2' for Redpill-Linpro's graphical profile
#'
#' The core theme: `theme_rl` uses Lato
#'
#' There is an option `rltheme.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @md
#' @name rltheme
#' @docType package
#' @keywords internal
#' @import ggplot2 grid scales extrafont grDevices
#' @importFrom magrittr %>%
#' @importFrom gdtools set_dummy_conf
#' @import rmarkdown knitr htmltools
#' @importFrom tools file_path_sans_ext
NULL

#' rltheme exported operators
#'
#' The following functions are imported and then re-exported
#' from the rltheme package to enable use of the magrittr
#' pipe operator with no additional library calls
#'
#' @name rltheme-exports
NULL

#' @name %>%
#' @export
#' @rdname rltheme-exports
NULL
