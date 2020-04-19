# Download data
year <-'2015-2016'
data_names<-c('UASS_I', 'TRICH_I','CHLMDA_I','DEMO_I','DIQ_I','HIV_I','ALQ_I')
system(paste(paste('wget https://wwwn.cdc.gov/Nchs/Nhanes/',year,'/',data_names,'.XPT ',sep=''),collapse  = ' \ '))

# Read all data
library(SASxport)
UASS<-read.xport('./data/UASS_I.XPT')
TRICH<-read.xport('./data/TRICH_I.XPT')
CHLMDA<-read.xport('./data/CHLMDA_I.XPT')
DEMO<-read.xport('./data/DEMO_I.XPT')
DIQ<-read.xport('./data/DIQ_I.XPT')
HIV<-read.xport('./data/HIV_I.XPT')
ALQ<-read.xport('./data/ALQ_I.XPT')

write.csv(UASS,'./data/UASS.csv',row.names = F)
write.csv(TRICH,'./data/TRICH.csv',row.names = F)
write.csv(CHLMDA,'./data/CHLMDA.csv',row.names = F)
write.csv(DEMO,'./data/DEMO.csv',row.names = F)
write.csv(DIQ,'./data/DIQ.csv',row.names = F)
write.csv(HIV,'./data/HIV.csv',row.names = F)
write.csv(ALQ,'./data/ALQ.csv',row.names = F)

dat<-merge(UASS[,- grep('LC',names(UASS))],CHLMDA)
dat<-merge(dat,TRICH)
dat<-merge(dat,DEMO[,c('SEQN','RIAGENDR','RIDAGEYR','RIDRETH1','RIDRETH3','DMQADFC','DMDBORN4','DMDYRSUS','DMDEDUC2','DMDEDUC3','INDHHIN2', 'INDFMPIR')])
dat<-merge(dat,DIQ[,c('SEQN','DIQ010')])
dat<-merge(dat,HIV[,c('SEQN','LBXHIVC')])
dat<-merge(dat,ALQ[,c('SEQN','ALQ101')])

write.csv(dat,'./data/combined_data.csv',row.names = F)
