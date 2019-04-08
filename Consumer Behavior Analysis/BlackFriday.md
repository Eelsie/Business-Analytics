# Analyzing Black Friday Sales Data   

## Exploring the dataset:    
The dataset has 537577 observations and 12 features listed below. 
```
> colnames(black_friday)#name of the columns
 [1] "User_ID"                    "Product_ID"                 "Gender"                     "Age"                       
 [5] "Occupation"                 "City_Category"              "Stay_In_Current_City_Years" "Marital_Status"            
 [9] "Product_Category_1"         "Product_Category_2"         "Product_Category_3"         "Purchase"                  

```
This dataset reflects the shopping details of 5891 shoppers on black friday, what products did they buy? what products did customers buy more frequently and so on. So as to find their buying behavior and trends lets dig more into the data with numbers as well as graphically.

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

##or we can also compute as below##
> summary(gender$Gender)
   F    M 
1666 4225 

```
The below age distribution shows the count of male and female customers in different age group.

```
> table(gender$Age[gender$Gender=='M'])

 0-17 18-25 26-35 36-45 46-50 51-55   55+ 
  140   782  1508   834   349   339   273 
  
> table(gender$Age[gender$Gender=='F'])

 0-17 18-25 26-35 36-45 46-50 51-55   55+ 
   78   287   545   333   182   142    99 


```


**How do different Age group and Gender shop?**
```
> aggregate(Purchase~Gender,black_friday[,c(3,12)],FUN = sum)
  Gender   Purchase
1      F 1164624021
2      M 3853044357

```
The above figure shows that Males , shopped 3 times more than the Females on Black Friday sales.

```
> aggregate(Purchase~Age+Gender,purchase,FUN = sum)
     Age Gender   Purchase
1   0-17      F   41826615
2  18-25      F  202209450
3  26-35      F  433857680
4  36-45      F  239010480
5  46-50      F  114796993
6  51-55      F   87972407
7    55+      F   44950396
8   0-17      M   90832391
9  18-25      M  699459830
10 26-35      M 1565891426
11 36-45      M  771639085
12 46-50      M  298621230
13 51-55      M  273935949
14   55+      M  152664446
> 

###Sorting the Age-groups and Gender according to increasing order of their purchase:

> df[order(df$Purchase),]
     Age Gender   Purchase
1   0-17      F   41826615
7    55+      F   44950396
6  51-55      F   87972407
8   0-17      M   90832391
5  46-50      F  114796993
14   55+      M  152664446
2  18-25      F  202209450
4  36-45      F  239010480
13 51-55      M  273935949
12 46-50      M  298621230
3  26-35      F  433857680
9  18-25      M  699459830
11 36-45      M  771639085
10 26-35      M 1565891426
```
And now to look into details, males between age group 18-35 are quite crazy about black friday sales and they do purchase as more than any other age group and females. Eventually the question comes to mind what product categories were heavily purchased by these age and gender group?

**Finding the "hot" Product Category**

Lets dig into the product categories, *Product Category 1* since the data-type of the column is integer, we convert it to character.
There are 18 different product categories in *Product Category 1*.

```
> class(black_friday$Product_Category_1)
[1] "integer"
> black_friday$Product_Category_1=as.character(black_friday$Product_Category_1)
> class(black_friday$Product_Category_1)
[1] "character"
> unique(black_friday$Product_Category_1)
 [1] "3"  "1"  "12" "8"  "5"  "4"  "2"  "6"  "14" "11" "13" "15" "7"  "16" "18" "10" "17" "9" 
> length(unique(black_friday$Product_Category_1))
[1] 18
```
