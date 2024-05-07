#' Function to import user data
#'
#' @param file_path Path to user info data file.
#' @return a data frame/tibble.
#'
import_user_info <- function(file_path) {
  info_data <- readr::read_csv(
    file_path,
    col_select = -1,
    col_types = readr::cols(
      readr::col_skip(),
      gender = readr::col_character(),
      weight = readr::col_double(),
      height = readr::col_double(),
      age = readr::col_double()
    ),
    name_repair = snakecase::to_snake_case
  )
  return(info_data)
}


#' TFunction to import RR.file
#'
#' @param file_path
#'
#' @return
#' @export
#'
#' @examples
import_rr <- function(file_path){
  rr_data <- readr::read_csv(
    file_path,
    col_select = -1,
    col_types = readr::cols(
      readr::col_skip(),
      ibi_s = readr::col_double(),
      day = readr::col_integer(),
      time = readr::col_time(format = "")
    ),
    name_repair = snakecase::to_snake_case,
  )
  return(rr_data)
}

