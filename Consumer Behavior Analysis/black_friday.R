#reading the file from dell
#black_friday=read.csv("/home/soumya/Desktop/gitrepo/Business-Analytics/business_datasets/BlackFriday.csv")
#reading the file from lenovo
black_friday=read.csv("C:/Users/sdas/Desktop/myprojects/Business-Analytics/business_datasets/BlackFriday.csv")

#######################data exploration#######################################
#Unique values
colnames(black_friday)#name of the columns
length(unique(black_friday$User_ID)) #number of unique UserID
print("Unique values for each feature:")

for (f in 1:ncol(black_friday)) {
  print(paste(colnames(black_friday[f]),":",length(unique(black_friday[,f])) ))
}

#Distribution

