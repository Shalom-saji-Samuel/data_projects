## Phase 2 dashboard

## Description :
- So as to Practice and learn more about power bi , I used a database , made by chatgpt , and built a dashboard around that.
---
## Objective:  
- Practice and showcase power bi skills. 

---
## What I did:
- Create measures 
- Built a dashboard , which is fully presentable

---
## Skills Shown:  
- DAX 
- Tooltips
- Time inteligence functions
- Making seperate date tables 

---
## Example of Dax work 
- In total I had to make 8 measures , one of them is as follows :
- Task : Find revenue per country 
- Answer : Rev per country 
  = CALCULATE(
      COUNT(Finance[Revenue]) ,
      Customers[Country])
- An example of Time inteligence functions would be :
- Task : Find revenue from last year
- Answer : Revenue LY = 
    CALCULATE(
        [Total Rev],
        SAMEPERIODLASTYEAR(Finance[Date])
    )
---
## Screenshot of dashboard 
- In the second screenshot you are able to see the tooltip in action 
<img width="1493" height="821" alt="image" src="https://github.com/user-attachments/assets/be1899b8-5148-4ab7-b48c-edcf29678988" />
<img width="1483" height="810" alt="image" src="https://github.com/user-attachments/assets/1cbf0482-112a-4189-b2cb-4f9bf88f52bd" />

