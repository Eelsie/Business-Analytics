# Analyzing Black Friday Sales Data   

## Exploring the dataset:    
The dataset has 537577 observations and 12 features listed below. 
```
> colnames(black_friday)#name of the columns
 [1] "User_ID"                    "Product_ID"                 "Gender"                     "Age"                       
 [5] "Occupation"                 "City_Category"              "Stay_In_Current_City_Years" "Marital_Status"            
 [9] "Product_Category_1"         "Product_Category_2"         "Product_Category_3"         "Purchase"                  

```
This dataset reflects the shopping details of 5891 shoppers on black friday, what products did they buy? what products did customers buy more frequently and so on. So as to find their buying behavior and trends lets dig more into the data.

**Information on products and shoppers**

```
> for (f in 1:ncol(black_friday)) {
+   print(paste(colnames(black_friday[f]),":",length(unique(black_friday[,f])) ))
+ }
[1] "User_ID : 5891"
[1] "Product_ID : 3623"
[1] "Gender : 2"
[1] "Age : 7"
[1] "Occupation : 21"
[1] "City_Category : 3"
[1] "Stay_In_Current_City_Years : 5"
[1] "Marital_Status : 2"
[1] "Product_Category_1 : 18"
[1] "Product_Category_2 : 18"
[1] "Product_Category_3 : 16"
[1] "Purchase : 17959"
> 
```
3263 types of products were sold, and they were categorized in 18 product categories.The products were bought by customers from 7 age groups. Maximum price with which the products were purchased were: $23961 and minimum product price was $185. Among 5891 shoppers 1666 are females and 4225 are male. 
``` 
#####################Purchase########################
> max(black_friday$Purchase)
[1] 23961
> min(black_friday$Purchase)
[1] 185


###########################Age########################
> unique(black_friday$Age)
[1] 0-17  55+   26-35 46-50 51-55 36-45 18-25


##########################Gender######################
> gender=unique(black_friday[,c(1,3)])
> nrow(gender[gender$Gender=='F',])
[1] 1666
> nrow(gender[gender$Gender=='M',])
[1] 4225

```
**Purchase analysis by Gender**
