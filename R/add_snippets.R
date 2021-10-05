#' add Shiny argonDash snippets to Rstudio snippets file
#'
#' @param rs path to rstudio snippets file default: "~/.R/snippets/r.snippets"
#' @return NULL
#' @examples
#' argonSnippets::add_snippets()
#' @export


add_snippets <- function(rs = "~/.R/snippets/r.snippets"){

  res <- FALSE

  if (! file.exists(rs)){
    message(paste(rs,"does not exist."))
    message("Create it?")
    x <- readline("Type Y/y to confirm. ")

    if (tolower(x) == "y"){
      dir.create(dirname(rs),recursive = TRUE,showWarnings = FALSE)
      file.create(rs)
    } else {
      message("Copy not done")
      return(invisible(res))
    }
  }

  message(paste("This command will write in",rs))
  message("Do you wish to continue?")
  x <- readline("Type Y/y to confirm. ")

  if (tolower(x) == "y"){
    res <- file.append(rs,
                       system.file("snippets.txt",
                                   package = "argonSnippets"))
  }
  if (res){
    message("Done!")
    message("Restart RStudio to have access to the snippets.")
  } else {
    message("Copy not done")
    return(invisible(res))
  }
}
