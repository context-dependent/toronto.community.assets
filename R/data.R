#' Toronto Community Assets
#' 
#' Spatially linked data on community assets in Toronto, Ontario
#' @rdname toca24
#' @name toca24
#' @source 211 Community Assets Database
#' @description 
#' This package provides a version of the 211 Community Assets Database filtered to include only those located in Toronto, Ontario. 
#' Columns have been renamed, generated, and selected for clarity and consistency.
#' 
#' @format ## `toca24`
#' A tibble with 4,037 rows and 16 columns:
#' \itemize{
#'   \item{\code{object_id} \code{<dbl>} Row number in the original dataset}
#'   \item{\code{resource_agency_num} \code{<dbl>} Unique identifier for the agency}
#'   \item{\code{org_name} \code{<chr>} Name of the organization, derived from \code{public_name_modified}}
#'   \item{\code{public_name} \code{<chr>} Public name of the organization}
#'   \item{\code{public_name_modified} \code{<chr>} Modified public name of the organization}
#'   \item{\code{program_type} \code{<chr>} Type of program}
#'   \item{\code{program_taxonomy} \code{<chr>} Taxonomy terms for the program}
#'   \item{\code{info_email} \code{<chr>} Email address for the organization}
#'   \item{\code{contact_name} \code{<chr>} Name of the main contact person}
#'   \item{\code{contact_title} \code{<chr>} Title of the main contact person}
#'   \item{\code{contact_email} \code{<chr>} Email address of the main contact person}
#'   \item{\code{homepage_url} \code{<chr>} URL for the organization's homepage}
#'   \item{\code{neighbourhood_name} \code{<chr>} Name of the neighbourhood where the organization is located}
#'   \item{\code{neighbourhood_id} \code{<dbl>} Unique identifier for the neighbourhood}
#'   \item{\code{latitude} \code{<dbl>} Latitude of the organization}
#'   \item{\code{longitude} \code{<dbl>} Longitude of the organization}
#' }
"toca24"