#reading the file from dell
black_friday=read.csv("/home/soumya/Desktop/gitrepo/Business-Analytics/business_datasets/BlackFriday.csv")
#reading the file from lenovo


#data exploration
colnames(black_friday)#name of the columns
length(unique(black_friday$User_ID)) #number of unique UserID

#Distribution
