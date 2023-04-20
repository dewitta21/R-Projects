library(lme4)
library(tidyr)

TLCdata <- read.table('C:/Users/annad/OneDrive/Documents/R_projects/tlc-data.txt', header = F)

#plot trajectories of subjects. Color each line according to the group variable 
colnames(TLCdata) <- c("ID", "Group", "W0", "W1", "W4", "W6")
head(TLCdata)
time <- c(0,1,4,6)
n <- dim(TLCdata)[1]
         
plot(time, TLCdata[1,3:6], ylim = c(5, 65), col = "blue", xlab = 'week', ylab = 'BLL')
  
  for (i in 2:nrow(TLCdata)) {
    if(TLCdata[i,2] == "P"){
      lines(time, TLCdata[i, 3:6], col = "blue")
    }
    else{
      lines(time, TLCdata[i, 3:6], col = "red")
    }
  }


#fit a mixed effect model with a random intercept to examine whether the new agent is effective in reducing blood lead level
TLCdf <- TLCdata %>% gather(Week, BLL, W0, W1, W4, W6)
head(TLCdf)
TLCdf <- separate(TLCdf, Week, sep = 'W', into = c("No use", "Time"))


modelb = lmer(as.numeric(BLL) ~ Group + as.numeric(Time) + (1 | ID), data = TLCdf)

summary(modelb)
confint(modelb)

#Fit a mixed effect model with a random intercept and a random time variable to examine whether the new agent is effective in reducing the blood lead level.
modelc = lmer(as.numeric(BLL) ~ Group + as.numeric(Time) + (1 - as.numeric(Time) | ID), data = TLCdf)
                                                              
          
summary(modelc)
confint(modelc)          
        
        
