# Week 3

## Summary

- Database Normal Forms
- 1NF Rules
- What is a Composite Key?
- 2NF Rules
- Database - Foreign Key
- What are transitive functional dependencies?
- 3NF Rules

### Database without Normalization

<img src="./image/NormalizationTable1.png" width="600px"/><br>

### 1NF (First Normal Form) Rules

- Each table cell should contain a single value
- Each record needs to be unique

#### 1NF Example

<img src="./image/1NF.png" width="600px"/><br>

#### What is a Composite Key?

A composite key is a primary key composed of multiple columns used to identify a record uniquely

In our database, we have two people with the same name Robert Phil, but they live in different places.

<img src="./image/CompositeKey.png" width="600px"/><br>

 We require both Full Name and Address to identify a record uniquely. That is a composite key.

 ### 2NF (Second Normal Form) Rules

 - Rule 1 - Be in 1NF
 - Rule 2 - Single Column Primary Key

 It is clear that we can't move forward to make our simple database in 2nd Normalization form unless we partition the table above.

<img src="./image/Table1.png" width="600px"/><br>

<img src="./image/Table2.png" width="600px"/><br>

We have divided our 1NF table into two tables viz. Table 1 and Table2. Table 1 contains member information. Table 2 contains information on movies rented.

We have introduced a new column called Membership_id which is the primary key for table 1. Records can be uniquely identified in Table 1 using membership id

#### Database - Forgein Key

In Table 2, Membership_ID is the Foreign Key

<img src="./image/Table1.png" width="600px"/><br>

<img src="./image/ForeignKeyRelationWithPrimary.png" width="600px"/><br>

 ### 3NF (Third Normal Form) Rules

- Rule 1- Be in 2NF
- Rule 2- Has no transitive functional dependencies

#### 3NF Example

<img src="./image/2NFTable1.png" width="600px"/><br>

<img src="./image/2NFTable2.png" width="600px"/><br>

<img src="./image/2NFTable3.png" width="600px"/><br>
  
Create table Salutation

```sql
CREATE TABLE Salutation(
    SalutationID int NOT NULL PRIMARY KEY,
    Salutation varchar(255) NOT NULL
);
```

Create Table Membership

```sql
CREATE TABLE Membership (
    MembershipID int IDENTITY(1, 1) PRIMARY KEY,
    FullName varchar(255),
    PhysicalAddress varchar(255),
    SalutationID int ,
    CONSTRAINT fk_salutation_membership
        FOREIGN KEY (SalutationID)
        REFERENCES Salutation (SalutationID)
);
```

Create Table Movie Rented

```sql
CREATE TABLE Movie(
    MembershipID int,
    MoviesRented varchar(255),
    CONSTRAINT PK_Movie    
        PRIMARY KEY (MembershipID, MoviesRented),
    CONSTRAINT FK_movie
        FOREIGN KEY (MembershipID)
        REFERENCES Membership (MembershipID)
);
```