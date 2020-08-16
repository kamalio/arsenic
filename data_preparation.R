# Download data
year <-'2013-2014'
data_names<-c('UTASS_I','UASS_I', 'TRICH_I','CHLMDA_I','DEMO_I','DIQ_I','HIV_I','ALQ_I')
data_names<-c('UTASS_H','UASS_H', 'TRICH_H','CHLMDA_H','DEMO_H','DIQ_H','HIV_H','ALQ_H')
system(paste(paste('wget https://wwwn.cdc.gov/Nchs/Nhanes/',year,'/',data_names,'.XPT ',sep=''),collapse  = ' \ '))

# Read all data
library(SASxport)
UTAS<-read.xport('./data/UTASS_I.XPT')
UASS<-read.xport('./data/UASS_I.XPT')
TRICH<-read.xport('./data/TRICH_I.XPT')
CHLMDA<-read.xport('./data/CHLMDA_I.XPT')
DEMO<-read.xport('./data/DEMO_I.XPT')
DIQ<-read.xport('./data/DIQ_I.XPT')
HIV<-read.xport('./data/HIV_I.XPT')
ALQ<-read.xport('./data/ALQ_I.XPT')

covar <- merge(DEMO[,c('SEQN','RIAGENDR','RIDAGEYR','RIDRETH1','RIDRETH3','DMQADFC','DMDBORN4','DMDYRSUS','DMDEDUC2','DMDEDUC3','INDHHIN2', 'INDFMPIR')], DIQ[,c('SEQN','DIQ010')], all.x = T)
covar <- merge(covar, HIV[,c('SEQN','LBXHIVC')], all.x = T)
covar <- merge(covar, ALQ[,c('SEQN','ALQ101')], all.x = T)
write.csv(covar, './data/covariates.csv', row.names = F)

write.csv(UTAS, './data/UTASS.csv',row.names = F)
write.csv(UASS,'./data/UASS.csv',row.names = F)
write.csv(TRICH,'./data/TRICH.csv',row.names = F)
write.csv(CHLMDA,'./data/CHLMDA.csv',row.names = F)
write.csv(DEMO,'./data/DEMO.csv',row.names = F)
write.csv(DIQ,'./data/DIQ.csv',row.names = F)
write.csv(HIV,'./data/HIV.csv',row.names = F)
write.csv(ALQ,'./data/ALQ.csv',row.names = F)


dat<-merge(UASS[,- grep('LC',names(UASS))],DEMO[,c('SEQN','RIAGENDR','RIDAGEYR','RIDRETH1','RIDRETH3','DMQADFC','DMDBORN4','DMDYRSUS','DMDEDUC2','DMDEDUC3','INDHHIN2', 'INDFMPIR')])
dat<-merge(dat,DIQ[,c('SEQN','DIQ010')])
dat<-merge(dat,HIV[,c('SEQN','LBXHIVC')])
dat<-merge(dat,ALQ[,c('SEQN','ALQ101')])



dat_tri<-merge(dat,TRICH)
dat_chl<-merge(dat,CHLMDA)
write.csv(dat,'./data/combined_data.csv',row.names = F)

dat_tot_chl<-merge(UTAS[,c(1,3)],CHLMDA)


### Prepare data for 2013-2014

library(SASxport)
UTAS<-read.xport('./data/UTASS_H.XPT')
UASS<-read.xport('./data/UASS_H.XPT')
TRICH<-read.xport('./data/TRICH_H.XPT')
CHLMDA<-read.xport('./data/CHLMDA_H.XPT')
DEMO<-read.xport('./data/DEMO_H.XPT')
DIQ<-read.xport('./data/DIQ_H.XPT')
HIV<-read.xport('./data/HIV_H.XPT')
ALQ<-read.xport('./data/ALQ_H.XPT')

write.csv(UASS,'./data/UASS13.csv',row.names = F)
write.csv(TRICH,'./data/TRICH13.csv',row.names = F)
write.csv(CHLMDA,'./data/CHLMDA13.csv',row.names = F)
write.csv(DEMO,'./data/DEMO13.csv',row.names = F)
write.csv(DIQ,'./data/DIQ13.csv',row.names = F)
write.csv(HIV,'./data/HIV13.csv',row.names = F)
write.csv(ALQ,'./data/ALQ13.csv',row.names = F)


dat13<-merge(UASS[,- grep('LC',names(UASS))],DEMO[,c('SEQN','RIAGENDR','RIDAGEYR','RIDRETH1','RIDRETH3','DMQADFC','DMDBORN4','DMDYRSUS','DMDEDUC2','DMDEDUC3','INDHHIN2', 'INDFMPIR')])
dat13<-merge(dat13,DIQ[,c('SEQN','DIQ010')])
dat13<-merge(dat13,HIV[,c('SEQN','LBDHI')])
dat13<-merge(dat13,ALQ[,c('SEQN','ALQ101')])

dat_tri13<-merge(dat13,TRICH)
dat_chl13<-merge(dat13,CHLMDA)
write.csv(dat13,'./data/combined_data13.csv',row.names = F)


### Combine 
