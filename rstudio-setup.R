#!/usr/bin/env Rscript

# Description: this script is to set up an RStudio environment
# This will include:
# 1. Installing `renv`, `usethis`, and `swirl` packages
# 2. Prompting the user to configure Git with `usethis::use_git_config()`
# 3. Installing the `Lessons` course from the `qtalr` organization on GitHub
# 5. Install tinytex from with a system command `quarto install tinytex`
# 4. Prompting the user to restore the project library with `renv::restore()`
# This script will be run from the Terminal

# Ask the user for their name and email
name <- readline(prompt = "What is your GitHub username? ")
email <- readline(prompt = "What is your GitHub email? ")

# check if renv is installed, if not install it
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

# check if usethis is installed, if not install it
if (!requireNamespace("usethis", quietly = TRUE)) {
  install.packages("usethis")
}

# check if swirl is installed, if not install it
if (!requireNamespace("swirl", quietly = TRUE)) {
  install.packages("swirl")
}

# Install the course
swirl::uninstall_all_courses(force = TRUE)
swirl::install_course_github("qtalr", "Lessons")

# Prompt the user to configure Git
usethis::use_git_config(user.name = name, user.email = email)

# Install tinytex
system("quarto install tinytex")

# Restore the project library, confirm with the user
options(renv.config.user.library = TRUE)
options(renv.config.activate.prompt = FALSE)
renv::restore()

# Message to the user
message("RStudio setup complete!")
