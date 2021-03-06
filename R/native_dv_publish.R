#' @title Create Dataverse
#' @description Create a new Dataverse
#' @details This function can create a new Dataverse. In the language of Dataverse, a user has a \dQuote{root} Dataverse into which they can create further nested Dataverses and/or \dQuote{datasets} that contain, for example, a set of files for a specific project. Creating a new Dataverse can therefore be a useful way to organize other related Dataverses or sets of related datasets. 
#' 
#' For example, if one were involved in an ongoing project that generated monthly data. One may want to store each month's data and related files in a separate \dQuote{dataset}, so that each has its own persistent identifier (e.g., DOI), but keep all of these datasets within a named Dataverse so that the project's files are kept separate the user's personal Dataverse records. The flexible nesting of Dataverses allows for a number of possible organizational approaches.
#' 
#' @param dataverse A character string specifying a Dataverse name or an object of class \dQuote{dataverse}. If missing, a top-level Dataverse is created.
#' @template envvars
#' @template dots
#' @return A list.
#' @seealso To manage Dataverses: \code{\link{delete_dataverse}}, \code{\link{publish_dataverse}}, \code{\link{dataverse_contents}}; to get datasets: \code{\link{get_dataset}}; to search for Dataverses, datasets, or files: \code{\link{dataverse_search}}
#' @examples
#' \dontrun{
#' (dv <- create_dataverse("mydataverse"))
#' 
#' # cleanup
#' delete_dataverse("mydataverse")
#' }
#' @export
create_dataverse <- function(dataverse, key = Sys.getenv("DATAVERSE_KEY"), server = Sys.getenv("DATAVERSE_SERVER"), ...) {
    if (missing(dataverse)) {
        u <- paste0(api_url(server), "dataverses")
    } else {
        u <- paste0(api_url(server), "dataverses/", dataverse)
    }
    r <- httr::POST(u, httr::add_headers("X-Dataverse-key" = key), ...)
    httr::stop_for_status(r)
    httr::content(r, as = "text", encoding = "UTF-8")
}

#' @title Delete Dataverse
#' @description Delete a dataverse
#' @details This function deletes a Dataverse.
#' @template dv
#' @template envvars
#' @template dots
#' @return A logical.
#' @seealso To manage Dataverses: \code{\link{create_dataverse}}, \code{\link{publish_dataverse}}, \code{\link{dataverse_contents}}; to get datasets: \code{\link{get_dataset}}; to search for Dataverses, datasets, or files: \code{\link{dataverse_search}}
#' @examples
#' \dontrun{
#' dv <- create_dataverse("mydataverse")
#' delete_dataverse(dv)
#' }
#' @export
delete_dataverse <- function(dataverse, key = Sys.getenv("DATAVERSE_KEY"), server = Sys.getenv("DATAVERSE_SERVER"), ...) {
    dataverse <- dataverse_id(dataverse)
    u <- paste0(api_url(server), "dataverses/", dataverse)
    r <- httr::DELETE(u, httr::add_headers("X-Dataverse-key" = key), ...)
    httr::stop_for_status(r)
    httr::content(r, as = "text", encoding = "UTF-8")
}

#' @title Set Dataverse metadata
#' @description Set Dataverse metadata
#' @details This function sets the value of metadata fields for a Dataverse. Use \code{\link{update_dataset}} to set the metadata fields for a dataset instead.
#' @template dv
#' @param body A list.
#' @param root A logical.
#' @template envvars
#' @template dots
#' @return A list
#' @seealso \code{\link{dataverse_metadata}}
#' @export
set_dataverse_metadata <- function(dataverse, body, root = TRUE, key = Sys.getenv("DATAVERSE_KEY"), server = Sys.getenv("DATAVERSE_SERVER"), ...) {
    dataverse <- dataverse_id(dataverse)
    u <- paste0(api_url(server), "dataverses/", dataverse, "/metadatablocks/", tolower(as.character(root)))
    r <- httr::POST(u, httr::add_headers("X-Dataverse-key" = key), ...)
    httr::stop_for_status(r)
    httr::content(r, as = "text", encoding = "UTF-8")$data
}
