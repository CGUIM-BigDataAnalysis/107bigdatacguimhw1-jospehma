install.packages("readr")
install.packages("dplyr")
library(readr)
X103 <- read_csv("C:/Users/ma/Desktop/BigData/103.csv")
X104 <- read_csv("C:/Users/ma/Desktop/BigData/104.csv")
X105 <- read_csv("C:/Users/ma/Desktop/BigData/105.csv")
X106 <- read_csv("C:/Users/ma/Desktop/BigData/106.csv")

for(n in 1:14){
  X103[[n]]<-gsub("—|…","",X103[[n]])
}
for(n in 1:14){
  X104[[n]]<-gsub("—|…","",X104[[n]])
}
for(n in 1:14){
  X105[[n]]<-gsub("—|…","",X105[[n]])
}
for(n in 1:14){
  X106[[n]]<-gsub("—|…","",X106[[n]])
}
library(dplyr)   
X1036<-inner_join(X103,X106,by ="大職業別")
X1036$比例<-as.numeric(X106$`大學-薪資`) / as.numeric(X103$`大學-薪資`)
X1036<-arrange(X1036,desc(比例))

Y1036<-X1036[X1036$比例>1,]
Y1036<-na.omit(Y1036)
head(Y1036$大職業別,10)

Z1036<-X1036[X1036$比例>1.05,]
Z1036<-na.omit(Z1036)
Z1036$大職業別



work<-c(1)
for(i in c(1:41)){
  work<-c(work,strsplit(Z1036$大職業別,"-")[[i]] )
}
table(work)



X103$`經常性薪資-女/男`<-as.numeric(X103$`經常性薪資-女/男`)
X104$`經常性薪資-女/男`<-as.numeric(X104$`經常性薪資-女/男`)
X105$`經常性薪資-女/男`<-as.numeric(X105$`經常性薪資-女/男`)
X106$`經常性薪資-女/男`<-as.numeric(X106$`經常性薪資-女/男`)


B103<-arrange(X103,X103$`經常性薪資-女/男`)
B104<-arrange(X104,X104$`經常性薪資-女/男`)
B105<-arrange(X105,X105$`經常性薪資-女/男`)
B106<-arrange(X106,X106$`經常性薪資-女/男`)
head(B103,10)
head(B104,10)
head(B105,10)
head(B106,10)

G103<-arrange(X103,desc(X103$`經常性薪資-女/男`))
G104<-arrange(X104,desc(X104$`經常性薪資-女/男`))
G105<-arrange(X105,desc(X105$`經常性薪資-女/男`))
G106<-arrange(X106,desc(X106$`經常性薪資-女/男`))

head(G104,1)
head(G105,1)
head(G106,1)






X106$薪資差<-as.numeric(X106$`研究所及以上-薪資`) / as.numeric(X106$`大學-薪資`)
X106<-arrange(X106,desc(薪資差))
head(X106,10)
 





Y106<-X106
Y106[Y106$大職業別=="製造業",c(2,11,13)]




gap<-as.numeric(Y106[Y106$大職業別=="製造業",13])-as.numeric(Y106[Y106$大職業別=="製造業",11])

















                      
  