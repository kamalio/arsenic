library(selectiveInference)
library(glmnet)
UASS = read.csv('./data/UASS.csv',header = T)
UASS = UASS[,c('SEQN','WTFSM','URXUAS3','URXUAS5','URXUAB','URXUAC','URXUDMA','URXUMMA')]
TRICH = read.csv('./data/TRICH.csv',header = T)
CHLMDA = read.csv('./data/CHLMDA.csv',header = T)
DEMO = read.csv('./data/DEMO.csv',header = T)
DEMO = DEMO[,c('SEQN','RIAGENDR','RIDAGEYR','RIDRETH1','RIDRETH3','DMQADFC','DMDBORN4','DMDYRSUS','DMDEDUC2','DMDEDUC3','INDHHIN2','INDFMPIR')]
UTASS = read.csv('./data/UTASS.csv',header = T)


DIQ = read.csv('./data/DIQ.csv',header = T)
DIQ = DIQ[,c('SEQN','DIQ010')]
HIV = read.csv('./data/HIV.csv',header = T)
HIV = HIV[,c('SEQN','LBXHIVC')]
ALQ = read.csv('./data/ALQ.csv',header=T)
ALQ = ALQ[,c('SEQN','ALQ101')]



UASS13 = read.csv('./data/UASS13.csv',header = T)
UASS13 = UASS13[,c('SEQN','WTFSM','URXUAS3','URXUAS5','URXUAB','URXUAC','URXUDMA','URXUMMA')]
TRICH13 = read.csv('./data/TRICH13.csv',header = T)
CHLMDA13 = read.csv('./data/CHLMDA13.csv',header = T)
DEMO13 = read.csv('./data/DEMO13.csv',header = T)
DEMO13 = DEMO13[,c('SEQN','RIAGENDR','RIDAGEYR','RIDRETH1','RIDRETH3','DMQADFC','DMDBORN4','DMDYRSUS','DMDEDUC2','DMDEDUC3','INDHHIN2','INDFMPIR')]

DIQ13 = read.csv('./data/DIQ13.csv',header = T)
DIQ13 = DIQ13[,c('SEQN','DIQ010')]
HIV13 = read.csv('./data/HIV13.csv',header = T)
names(HIV13) = c('SEQN','LBXHIVC')
ALQ13 = read.csv('./data/ALQ13.csv',header=T)
ALQ13 = ALQ13[,c('SEQN','ALQ101')]

TRI_data = merge(merge(merge(merge(merge(merge(UASS, ALQ, by ='SEQN'),UTASS[,c('SEQN','URXUAS')],by='SEQN'),DEMO, by ='SEQN'), DIQ, by='SEQN'), HIV, by = 'SEQN'),TRICH, by = 'SEQN')
TRI_data$DMDEDUC2[is.na(TRI_data$DMDEDUC2)] = TRI_data$DMDEDUC3[is.na(TRI_data$DMDEDUC2)]
tri_names = c("SEQN", "Smoking_2years", "Arsenous", "Arsenic", "Arsenobetaine", "Arsenocholine", "Dimethylarsinic", "Monomethylarsonic",  "ALC", 'Arsenic_total',"Gender", "Age", "Race1", "Race3", "Serve_FC", "Country_Birth","Year_US","Education", "Education_child", "Income", "Income_over_proverty", "Diabetes",   "HIV", "URXUTRI")
names(TRI_data) = tri_names
colSums(is.na(TRI_data))
TRI_data = TRI_data[,!colSums(is.na(TRI_data)) > 1000]
summary(glm(URXUTRI-1 ~. -SEQN - Diabetes -HIV, data = TRI_data, family = 'binomial'))


TRI_data13 = merge(merge(merge(merge(merge(UASS13, ALQ13, by ='SEQN'),DEMO13, by ='SEQN'), DIQ13, by='SEQN'), HIV13, by = 'SEQN'),TRICH13, by = 'SEQN')
TRI_data13$DMDEDUC2[is.na(TRI_data13$DMDEDUC2)] = TRI_data13$DMDEDUC3[is.na(TRI_data13$DMDEDUC2)]
names(TRI_data13) = tri_names
colSums(is.na(TRI_data13))
TRI_data13 = TRI_data13[,!colSums(is.na(TRI_data13)) > 1000]
summary(glm(URXUTRI-1 ~. -SEQN, data = TRI_data13, family = 'binomial'))


TRI_data_all = rbind(TRI_data, TRI_data13)
summary(glm(URXUTRI-1 ~. -SEQN - Race1, data = TRI_data_all, family = 'binomial'))

##########
# CHLMDA
#########3

CH_data = merge(merge(merge(merge(merge(UASS, ALQ, by ='SEQN'),DEMO, by ='SEQN'), DIQ, by='SEQN'), HIV, by = 'SEQN'),CHLMDA, by = 'SEQN')
ch_names = c("SEQN", "Smoking_2years", "Arsenous", "Arsenic", "Arsenobetaine", "Arsenocholine", "Dimethylarsinic", "Monomethylarsonic",  "ALC", "Gender", "Age", "Race1", "Race3", "Serve_FC", "Country_Birth","Year_US","Education", "Education_child", "Income", "Income_over_proverty", "Diabetes",   "HIV", "CHLMDA")
#ch_names = c("SEQN", "Smoking_2years", "Arsenous", "Arsenic", "Arsenobetaine", "Arsenocholine", "Dimethylarsinic", "Monomethylarsonic",  "ALC", "Gender", "Age", "Race1", "Race3", "Country_Birth", "Education", "Income", "Income_over_proverty", "Diabetes",   "HIV", "CHLMDA")
names(CH_data) = ch_names
CH_data$DMDEDUC2[is.na(CH_data$DMDEDUC2)] = CH_data$DMDEDUC3[is.na(CH_data$DMDEDUC2)]
colSums(is.na(CH_data))
CH_data = CH_data[,!colSums(is.na(CH_data)) > 600]
summary(glm(CHLMDA-1 ~. -SEQN-Race1, data = CH_data, family = 'binomial'))

CH_data13 = merge(merge(merge(merge(merge(UASS13, ALQ13, by ='SEQN'),DEMO13, by ='SEQN'), DIQ13, by='SEQN'), HIV13, by = 'SEQN'),CHLMDA13, by = 'SEQN')
names(CH_data13) = ch_names
CH13_data$DMDEDUC2[is.na(CH13_data$DMDEDUC2)] = CH13_data$DMDEDUC3[is.na(CH13_data$DMDEDUC2)]
colSums(is.na(CH_data13))
CH_data13 = CH_data13[,!colSums(is.na(CH_data13)) > 600]
summary(glm(CHLMDA-1 ~. -SEQN-Race1, data = CH_data13, family = 'binomial'))

CH_data_all<-rbind(CH_data,CH_data13)
summary(glm(CHLMDA-1 ~. -SEQN-Race1-Diabetes-HIV- Arsenic - Arsenobetaine - Arsenocholine - Dimethylarsinic -Monomethylarsonic , data = CH_data_all, family = 'binomial'))
summary(glm(CHLMDA-1 ~. -SEQN-Race1-Diabetes-HIV- Arsenous - Arsenic - Arsenobetaine - Arsenocholine - Dimethylarsinic  , data = CH_data_all, family = 'binomial'))
summary(glm(CHLMDA-1 ~. -SEQN-Race1-Diabetes-HIV- Arsenous - Arsenic - Arsenobetaine - Arsenocholine - Dimethylarsinic -Monomethylarsonic , data = CH_data_all, family = 'binomial'))

CH_data_all$NEW = CH_data_all$Arsenic + CH_data_all$Arsenous + CH_data_all$Monomethylarsonic 
summary(glm(CHLMDA-1 ~. -SEQN-Race1-Diabetes-HIV- Arsenous - Arsenic - Arsenobetaine - Arsenocholine - Dimethylarsinic -Monomethylarsonic , data = CH_data_all, family = 'binomial'))
summary(glm(CHLMDA-1 ~. -SEQN-Race1-Diabetes-HIV- Arsenous - Arsenic - Arsenobetaine - Arsenocholine - Dimethylarsinic -Monomethylarsonic , data = CH_data_all, family = 'binomial'))
#############
#LASSO
##########
