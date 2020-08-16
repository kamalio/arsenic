dat<-read.csv('./data/combined_data.csv',header = T)
TRICH <- read.csv('./data/TRICH.csv',header = T)
CHLMDA <- read.csv('./data/CHLMDA.csv',header = T)
dat<-merge(dat,TRICH,by = 'SEQN')
dat<-merge(dat,CHLMDA, by = 'SEQN')



dat_TRICH = dat[,-which(names(dat)%in%c('SEQN', 'DMQADFC', 'DMDYRSUS', 'DMDEDUC3', 'DMDEDUC3','URXUCL'))]
lmod_TRICH <- glm(URXUTRI-1 ~ . , data = dat_new, family = binomial())

dat_CHLMDA = dat[,-which(names(dat)%in%c('SEQN', 'DMQADFC', 'DMDYRSUS', 'DMDEDUC3', 'DMDEDUC3','URXUTRI'))]
lmod_CHLMDA <- glm(URXUCL -1 ~ . , data = dat_CHLMDA, family = binomial())
