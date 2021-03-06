% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/native_roles.R
\name{get_role}
\alias{get_role}
\alias{delete_role}
\alias{list_roles}
\alias{create_role}
\title{Roles}
\usage{
get_role(role, key = Sys.getenv("DATAVERSE_KEY"),
  server = Sys.getenv("DATAVERSE_SERVER"), ...)

delete_role(role, key = Sys.getenv("DATAVERSE_KEY"),
  server = Sys.getenv("DATAVERSE_SERVER"), ...)

list_roles(dataverse, key = Sys.getenv("DATAVERSE_KEY"),
  server = Sys.getenv("DATAVERSE_SERVER"), ...)

create_role(dataverse, alias, name, description, permissions,
  key = Sys.getenv("DATAVERSE_KEY"),
  server = Sys.getenv("DATAVERSE_SERVER"), ...)
}
\arguments{
\item{role}{A character string specifying a role, or an object of class \dQuote{dataverse_role}.}

\item{key}{A character string specifying a Dataverse server API key. If one is not specified, functions calling authenticated API endpoints will fail. Keys can be specified atomically or globally using \code{Sys.setenv("DATAVERSE_KEY" = "examplekey")}.}

\item{server}{A character string specifying a Dataverse server. There are multiple Dataverse installations, but the defaults is to use the Harvard Dataverse. This can be modified atomically or globally using \code{Sys.setenv("DATAVERSE_SERVER" = "dataverse.example.com")}.}

\item{...}{Additional arguments passed to an HTTP request function, such as \code{\link[httr]{GET}}, \code{\link[httr]{POST}}, or \code{\link[httr]{DELETE}}.}

\item{dataverse}{A character string specifying a Dataverse name or an object of class \dQuote{dataverse}.}

\item{alias}{\dots}

\item{name}{\dots}

\item{description}{\dots}

\item{permissions}{\dots}
}
\value{
A list.
}
\description{
Get, create, update, and delete a Dataverse role
}
\details{
In Dataverse, roles provide one or more users with permissions. Rather than granting several permissions to each user, you can create a role that carries specific permissions and then freely change the roles to which each user is assigned. See \href{http://guides.dataverse.org/en/latest/user/dataverse-management.html#dataverse-permissions}{the Dataverse User Guide} for more details.

Once created using \code{\link{create_role}}, \code{\link{delete_role}} can delete a role.
}
\examples{
\dontrun{
# create a new role
r <- create_role("mydataverse", "exampleRole", "role name", "description here")
}
}
