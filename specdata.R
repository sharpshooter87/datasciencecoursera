
#Pollutant Mean Function
pollutantmean<-function(directory,pollutant,id=1:332){
        
        #Set Working Directory
        setwd(file.path(getwd(),directory))
        
        #Initialize an empty vector to store means
        polmean<-numeric(length(id))
        
        #Get all the names of the files in the directory into a list
        fileno<-list.files(getwd(),pattern = "*.csv")
        
        #Calculate Mean for each file
        i<-1
        while(i<=length(id)) {
                
                monitor<-read.csv(fileno[id[i]])
               
                polmean[i]<-round(mean(monitor[,pollutant],na.rm = TRUE),3)
               
                i<-i+1
        }
        
        #Calculate Final Mean
        finalmean<-mean(polmean)
        
        #Set to default Working Directory
        setwd("..")
        
        #Return Mean
        finalmean       
        
}