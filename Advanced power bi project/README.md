## Advanced Power bi dashboard

## Description :
 So as to Practice some advanced skills and learn more about power bi , I used a database , made by chatgpt , and built a dashboard around that.
---
## Objective:  
Practice and showcase power bi skills. 

---
## Skills Shown:  
- Advanced DAX 
- Tooltips
- Making seperate date tables 
- Button and bookmarks to make the dashboard interactive 
- KPI cards 
- Dashboard making 

---
## Example of Dax work 
- In total I had to make 9 measures , 2 of them are as follows :
- Task : Find Net Promoter score
```Dax
Net Promoter Score = // %Promoters−%Detractors ,promoters = 4-5 detractors =1-2 
// declaring variables 
VAR promoters_count = 
    CALCULATE(
        COUNT(feedback[Rating]),
        feedback[Rating] IN{4,5})

VAR detractors_count = 
    CALCULATE(
        COUNT(feedback[Rating]),
        feedback[Rating] IN{1,2})

VAR total_ratings = 
    COUNT(feedback[Rating])
RETURN
// Finding percentages and subtracting them 
(DIVIDE(promoters_count,total_ratings)*100)-(DIVIDE(detractors_count,total_ratings)*100)
```
- Another one being 
``` DAX
Number of inactive customers after 90 days = 
-- making virtual table , made of customer_ids
VAR customer_list = ALL(customers[CustomerID])
VAR churn_date = 90 
RETURN
-- Filtering and counting the customers who didn't buy anything for last 90 days 
COUNTROWS(
    FILTER(customer_list ,
           CALCULATE(COUNTROWS(purchases),
           FILTER(ALLSELECTED(purchases[PurchaseDate]),
                  purchases[PurchaseDate] > (MIN(purchases[PurchaseDate]) - churn_date) 
                  &&
                  purchases[PurchaseDate] < MIN(purchases[PurchaseDate]))) = 0))
```
---
## Screenshot of dashboard 
- In the second screenshot you are able to see the tooltip in action 