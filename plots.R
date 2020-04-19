library(ggplot2)
library(reshape2)
box_dat<-dat[,c("URXUAS3", "URXUAS5","URXUAB", "URXUAC", "URXUDMA","URXUMMA","URXUCL")]
box_dat<-melt(box_dat,id.vars = 'URXUCL')

ggplot(data = na.omit(box_dat),aes(x = factor(URXUCL), y=value,fill=factor(URXUCL)))+
  geom_boxplot()+
  facet_wrap(~variable,scales = 'free')+
  labs(x='Chlamydia - Urine',y = expression(mu * g/L))+
  theme(legend.position = "none")

box_dat<-dat[,c("URXUAS3", "URXUAS5","URXUAB", "URXUAC", "URXUDMA","URXUMMA","URXUTRI")]
box_dat<-melt(box_dat,id.vars = 'URXUTRI')

ggplot(data = na.omit(box_dat),aes(x = factor(URXUTRI), y=value,fill=factor(URXUTRI)))+
  geom_boxplot()+
  facet_wrap(~variable,scales = 'free')+
  labs(x='Trichomonas - Urine',y = expression(mu * g/L))+
  theme(legend.position = "none")

