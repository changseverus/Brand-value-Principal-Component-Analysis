# 手機 保險業品牌力調查

library(haven)
library(stats)

# load data
data<-read_sav("cellphone_brand.sav")
file<-read_sav("insurance_brand.sav")

# remove all rows containing NA value
data<-data[complete.cases(data),]

# view the data, run basic EDA
str(data)
head(data)
summary(data)

str(file)
head(file)
summary(file)

#rename the variable since it will confuse R with function argument
names(file)[11]<-"nex"    

# run principal component analysis
cell_pca<-prcomp(data,center=TRUE,scale.=FALSE)
risk_pca<-prcomp(file,center=TRUE,scale.=FALSE)

summary(cell_pca)
summary(risk_pca)

# see how each variables affect the PCs
cell_pca$rotation
risk_pca$rotation

# plot the screeplot of PCs and cumulative variance plot
screeplot(cell_pca, type="1", npcs=8, main="陡坡圖")
screeplot(risk_pca, type="1", npcs=10, main="陡坡圖")

