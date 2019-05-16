


setwd('C:\\Users\\jmckinney2\\AppData\\Local\\Temp')
tempfiles <- list.files(getwd())
for (i in 1:length(tempfiles)) {
  if (substr(tempfiles[i],1,4)=='Rtmp' & paste0(getwd(),'/',tempfiles[i])!=tempdir()) {
    unlink(paste0(getwd(),'/',tempfiles[i]), force=T, recursive=T)
  }
}
