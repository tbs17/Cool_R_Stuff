# =====new year's week issue 1/4/2017======


# ===========beer ingredients analysis=============
install.packages('ttbbeer')
library(ttbbeer)
data("beermaterials")
data("artificialcarbontax")
library(dplyr)
str(beermaterials)
# order by year from least to the most recent
beermaterials_change=arrange(beermaterials,Year)
# value=beermaterials_change[[colnames(beermaterials_change)[3]]] #that's how you get your value. by indexing your column names using df[[colname]]
# value[1]
# beermaterials_change[,3]#this will show the whole list value of that column 
for (i in 3:ncol(beermaterials_change)) {
  value=beermaterials_change[[colnames(beermaterials_change)[i]]]
  beermaterials_change[,i]=c(0,100*round((value[-1]-value[1:(length(value)-1)])/value[1:(length(value)-1)],2)) 
  
  #the above formula (value[-1]-value[1:(length(value)-1)])/value[1:(length(value)-1)] is trying to get the percentage of this month's increase rate from last month
  #this is to substitute the column value for the percentage
}

head(beermaterials_change)

beermaterials$sum=rowSums(beermaterials[,-c(1:2)])

library(tidyr)
# gather is great to change wide format to long format. 
beermaterials_gather=beermaterials %>%
  gather(Ingredients,Amount, Malt_and_malt_products:Other)
beermaterials_gather$Date=paste('01',beermaterials_gather$Month, beermaterials_gather$Year,sep = "-") %>%
  as.Date(format="%d-%B-%Y")
beermaterials_gather$Ingredients=gsub("_"," ",beermaterials_gather$Ingredients)

beermaterials_change_gather=beermaterials %>%
  gather(Ingredients,Amount, Malt_and_malt_products:Other)
beermaterials_change_gather$Date=paste('01',beermaterials_change_gather$Month, beermaterials_change_gather$Year,sep = "-") %>%
  as.Date(format="%d-%B-%Y")
beermaterials_change_gather$Ingredients=gsub("_"," ",beermaterials_change_gather$Ingredients)

install.packages('ggplot2')
library(ggplot2)

my_theme=function(base_size=12,base_family="sans"){
  theme_minimal(base_size=base_size,base_family=base_family)+
    theme(
      axis.text=element_text(size=12),
      axis.text.x=element_text(angle=90,vjust=0.5,hjust=1),
      axis.title=element_text(size=14),
      panel.grid.major=element_line(color='grey'),
      panel.grid.minor=element_blank(),
      panel.background=element_rect(fill="aliceblue"),
      strip.background=element_rect(fill="royalblue",color='grey',size=1),
      strip.text=element_text(face='bold',size=12,color='white'),
      legend.position='bottom',
      legend.justification='top',
      legend.box='horizontal',
      legend.box.background=element_rect(colour='grey50'),
      legend.background=element_blank(),
      panel.border=element_rect(color='grey',fill=NA,size=0.5)
      
  )
  
}

theme_set(my_theme())
install.packages('lattice')
library(lattice)
ggplot(beermaterials_gather,aes(x=Date,y=sum))+
  geom_point(size=1.5,alpha=0.6,color='navy')+
  geom_smooth(alpha=0.3,color='black',size=0.5,linetype='dashed')+
  geom_line(color='navy')+
  guides(color=FALSE)+
  labs(
    x="",
    y='Amount in pounds',
    title='Sum of Beer Ingredients by Month and Year',
    subtitle="Sum of monthly aggregates of all ingredients from 2006 to 2015"
  )+
  scale_x_date(date_breaks = '6 month',date_labels = "%B %Y")


m <- matrix(1:4, 2)
m
prop.table(m, 1)*100


beeraterials_percent=cbind(beermaterials[,1:2],prop.table(as.matrix(beermaterials[,-c(1:2)]),margin=1)*100) #prop.table is used to express table as a fraction of marginal table. if margin=1, then the matrix row sum will become 1.
# this is the same to get the ratio of different ingredients in one pie. 
beermaterials_percent_gather=beeraterials_percent %>%
  gather(Ingredients,Amount, Malt_and_malt_products:Other)
beermaterials_percent_gather$Ingredients=gsub("_"," ",beermaterials_percent_gather$Ingredients)

f=unique(beermaterials_percent_gather$Month)
beermaterials_percent_gather=within(beermaterials_percent_gather,{
  Month=factor(Month,levels = f)
  }
  )

str(beermaterials_change_gather)

install.packages('animation')
library(animation)
ani.options(ani.width=800,ani.height=500)
# ======
install.packages('ImageMagick')
library(installr)
install.ImageMagick()
# you can use the above code to download and install imagemagick into R. however, make sure you check the 'install legacy utility' option as an additional task. otherwise, you system won't recognize as an internal or external command, operable program or batch file.