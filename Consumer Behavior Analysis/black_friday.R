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

#age group
unique(black_friday$Age)
#maximum amount spend to purchase a product
max(black_friday$Purchase)#23961
#minimum amount spend to purchase a product
min(black_friday$Purchase)#185


#Gender
gender=unique(black_friday[,c(1,3,4)])
nrow(gender[gender$Gender=='F',])#1666 females
nrow(gender[gender$Gender=='M',])#4225 males

table(gender$Age[gender$Gender=='M'])

table(gender$Age[gender$Gender=='F'])

######################how customer features have implication on purchases#############




#############################Distribution########################################

