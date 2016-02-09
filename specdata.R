#Pollutant Mean Function
pollutantmean<-function(directory,pollutant,id=1:332){
        
        #Set Working Directory
        setwd(file.path(getwd(),directory))
        
        
        #Get all the names of the files in the directory into a list
        fileno<-list.files(getwd(),pattern = "*.csv")
        
        #Calculate Sum and no. of observations
        
        sumtotal<-0
        nobsv<-0
        i<-1
        
        while(i<=length(id)) {
                
                monitor<-read.csv(fileno[id[i]])
                a<-na.omit((monitor[,pollutant]))
                sumtotal<-sumtotal+sum(a)
                nobsv<-nobsv+length(a)
                i<-i+1
        }
        
        #Calculate Mean
        polmean<-round(sumtotal/nobsv,3)
        
        #Set to default Working Directory
        setwd("..")
        
        #Return Mean
        polmean       
        
}