

# clean workspace
remove(list_dir,pkg_load,current,ALL)

# set path of saved package names
list_dir <- paste0(Sys.getenv("USERPROFILE"), "/Dropbox/Software/R/Packages")
setwd(list_dir)

#****************************************************************************************
# Check current packages ----
# Find previously saved RData file with package names
pkg_load <- dir(path = list_dir, pattern = "installed.Rdata")
# Load it
load(file.path(list_dir, pkg_load[length(pkg_load)]))
# Get list of currently installed packages
current <- unique(dir(.libPaths()))
# See which packages aren't in current library
ALL[which(!ALL %in% current)]
# See which packages aren't in saved file
current[which(!current %in% ALL)]

#****************************************************************************************
# Saving current packages ----
# Delete previous list (MAKE SURE CURRENT LIBRARY IS MOST RECENT)
file.remove(paste0(list_dir, "/", dir(path = list_dir, pattern = "installed.Rdata")))
# Get the list of currently installed packages
ALL <- unique(c(current, ALL))
# Save the list for later use
save(ALL, file = file.path(list_dir, paste0(Sys.Date(), "-installed.Rdata")))

#****************************************************************************************
# Loading saved packages ----
# Find previously saved RData file with package names
pkg_load <- dir(path = list_dir, pattern = "installed.Rdata")
# Load it
load(file.path(list_dir, pkg_load[length(pkg_load)]))
# Get list of currently installed packages
current <- unique(dir(.libPaths()))
# Load installer & install
install.packages("BiocManager")
BiocManager::install(ALL[!ALL %in% current])
# old version
#source("https://bioconductor.org/biocLite.R")
#BiocInstaller::biocLite(ALL[!ALL %in% current])

