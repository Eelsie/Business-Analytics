# Analyzing Black Friday Sales Data   

## Exploring the dataset:    
The dataset has 537577 observations and 12 features listed below. 
```
> colnames(black_friday)#name of the columns
 [1] "User_ID"                    "Product_ID"                 "Gender"                     "Age"                       
 [5] "Occupation"                 "City_Category"              "Stay_In_Current_City_Years" "Marital_Status"            
 [9] "Product_Category_1"         "Product_Category_2"         "Product_Category_3"         "Purchase"                  

```
This dataset reflects the shopping details of 5891 unique customers on black friday, what products did they buy? what products did customers buy more frequently and so on. So as to find their buying behavior and trends lets dig more into the data.

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
3263 types of products were sold, and they were categoriezed in 18 product categories.
