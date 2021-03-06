# Code for downloading Chelssa V.2.1 time serie

Chelsa.TS<-function() {
  options(encoding = "UTF-8") 
  site<-"https://envidatrepo.wsl.ch/uploads/chelsa/chelsa_V2/GLOBAL/monthly/"
  variable<-readline(prompt="select a variable (tasmax, taasmin ou pr):")
  
  if(variable=="tasmax"){
    variable2<-"CHELSA_tmax_"}else{
      if(variable=="tasmin"){variable2<-"CHELSA_tmin_"}else{
        variable2<-"CHELSA_preccor_"
      }
    }
  first.year<- readline(prompt="select first year for the beginning of your TS (1980-2019):")
  last.year<-readline(prompt="select the last year:")
  if(last.year<first.year){stop(print("the last year must be >= first year"))
  } else {
    period<-rep(first.year:last.year, each=12)
    months<-rep(sprintf('%0.2d', 1:12), length(period)/12)
    last.month<-12
    site2<-paste0(site,variable,"/",variable2,months,"_",period,"_V.2.1.tif")
    site3<-as.list(site2)
    names<-paste0("Chelsa",variable,"_",months,"_",period,"_V.2.1.tif")
    names[12]
    for(i in 1:length(site2)){
      download.file((site2[i]), mode = "wb", c(names[i]))
    }}}
