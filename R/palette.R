#' Redpill-Linpro color palette with 5 qualitative colors
#'
#' This function aligns its signature with RColorBrewer::color.pal()
#'
#' @param n number of colors to use (1..5), default is to return all five
#' @param name name of palette
#' @param type nature of data, default "qual" for qualitative or "seq" for
#' sequential or "div" for diverging
#' @return named vector with colors and hex codes
#' @importFrom grDevices rgb
#' @importFrom scales alpha show_col
#' @importFrom stats setNames
#' @export
#' @examples
#' palette_rl(1)  # return the primary color
#' library(scales)
#' alpha(palette_rl(), 0.4)  # return light signature colors (40 % alpha)
#' show_col(alpha(palette_rl(), 0.8))  # return medium light 80% alpha palette
palette_rl <- function(n = 7, name = "RL", type = c("qual", "seq", "div")) {
  
  if (name != "RL")
    stop("Please use RColorBrewer::brewer.pal() for non-RL palettes")
  
  p100 <- c(
    red = rgb(240, 50, 57, maxColorValue = 256),
    gray =  rgb(77, 77, 77, maxColorValue = 256),
    lightgray = rgb(240, 240, 240, maxColorValue = 256),
    blue = rgb(0, 153, 168, maxColorValue = 256),
    cyan = rgb(175, 226, 227, maxColorValue = 256),
    maroon = rgb(163, 32, 53, maxColorValue = 256),
    yellow = rgb(255, 181, 72, maxColorValue = 256)
  )    
    
  p80 <- alpha(p100, 0.8)
  p80 <- setNames(p80, paste0(names(p100), "80"))
  
  p40 <- alpha(p100, 0.4)
  p40 <- setNames(p40, paste0(names(p100), "40"))
  
  qual <- c(p100, p40, p80)
  
  seq <- c(qual["blue"], qual["blue80"], alpha(qual["blue"], 0.60),
           qual["blue40"], alpha(qual["blue40"], 0.20))
  seq <- setNames(seq, paste0("blue", 1:5))
  
  div <- c(seq[1:3], qual["gray40"],
           qual["maroon40"], qual["maroon80"], qual["maroon"])
  div <- setNames(div, c(paste0("H", 3:1), "M", paste0("L", 1:3)))
  
  switch(match.arg(type),
         qual = ifelse(n %in% 1:21, p <- qual[1:n], stop("max 21 qualitative colors are available")),
         seq = ifelse(n %in% 1:5, p <- seq[1:n], stop("max 5 sequential colors are available")),
         div = ifelse(n %in% 1:7, p <- div[1:n], stop("max 7 diverging colors are available"))
  )
  
  p
  
}

#' Redpill-Linpro color palette information
#'
#' This function aligns its signature with RColorBrewer::color.pal.info()
#'
#' @return data frame with information about the available palette(s)
#' @export
palette_rl_info <- function() {
  data.frame(
    palette_name = rep("RL", 3),
    maxcolors = c(21, 5, 7),
    type = c("qual", "seq", "div"),
    colorblind = FALSE
  )
}

#' A qualitative color palette with colors from Redpill-Linpro's graphical profile
#'
#' @export
#' @importFrom scales manual_pal
#' @examples
#' library(scales)
#' scales::show_col(rl_pal()(5))
rl_pal <- function() {
  pal <- palette_rl()
  names(pal) <- NULL
  manual_pal(pal)
}

#' Discrete color & fill scales
#'
#' See [rl_pal]().
#'
#' @md
#' @inheritDotParams ggplot2::discrete_scale -expand -position
#' @rdname scale_rl
#' @export
scale_colour_rl <- function(...) {
  discrete_scale("colour", "rl", rl_pal(), ...)
}

#' @export
#' @rdname scale_rl
scale_color_rl <- scale_colour_rl

#' @export
#' @rdname scale_rl
scale_fill_rl <- function(...) {
  discrete_scale("fill", "rl", rl_pal(), ...)
}
