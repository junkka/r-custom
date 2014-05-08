#' Spatial object to geojson
#'
#' Creates a geojson file of a \code{\link[sp]{SpatialPolygons}} or 
#'   \code{\link[sp]{SpatialPoints}} object.
#'
#' @param map Spatial object
#' @param name character string of the name of the object
#' @seealso \link[sp]{SpatialPolygons} \link[sp]{SpatialPoints}
#' @author Johan Junkka <johan.junkka@@gmail.com>
#' @export
#' @examples 
#' data(nor2k, package = "rgdal")
#' sp_to_json(nor2k, "nor2k")

sp_to_json <- function(map, name = 'map') {
  if (!inherits(map, c("SpatialPolygons", "SpatialPoints"))) stop('Map must be a SpatialPolygons object')
  # Transform projection to standard 
  map <- spTransform(map, CRS('+proj=longlat +ellps=WGS84'))
  # Write to json
  writeOGR(map, paste0(name, '.geojson'), name, driver='GeoJSON')
}
