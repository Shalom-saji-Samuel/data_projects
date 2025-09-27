### Phase 3 HR dataset dashboard

## Description:
      So as to Practice and learn more about power bi , I used a database , made by chatgpt , and built a dashboard around that.
---

## Objective:  
Practice more advanced power bi dashboard making .  

--- 
## What I did:  
- Made dashboard , that is fully presentable .  

---
## Skills Shown:  
- Advanced DAX
- Use of If , inscope and rankx functions
- Dashboard building
- Explaination of data model (written down below)

---
## Explaination of Data model: 
The data model is a star schema ,with employees table as the fact table and
others as the dimension tables . Most of them are connected to the fact table by employee id,
which is common in those tables . The department table is connected via department name.

---
## Example of work:
- As with last time , I yet again have made 8 measures , two examples being :
- Task : Calculate average performance score in departments 
```DAX 
Avg performance by department = AVERAGEX(
  VALUES(employees[Department]), 
    CALCULATE( 
      AVERAGE(
          performance[Rating])))
```
- An example with the use of If , inscope and rankx function 
```DAX
Ranking by compensation = 
IF(
    ISINSCOPE(employees[EmployeeID]),
        RANKX(
            ALL(employees[EmployeeID]),
            [Total compensation given],
            ,
            DESC,
            DENSE
        ),
    IF(
        ISINSCOPE(departments[DepartmentName]),
        RANKX(
            ALL(departments[DepartmentName]),
            CALCULATE([Total compensation given], ALLEXCEPT(departments, departments[DepartmentName])),
            ,
            DESC,
            DENSE
        )
    )
)
```
- This code ranks the departments aswell as employees based on compensations they recieved.
--- 
## Screenshot of dashboard:
<img width="1462" height="857" alt="image" src="https://github.com/user-attachments/assets/57ec20d2-f783-4efe-987e-c1020312418f" />
