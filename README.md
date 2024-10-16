<h1 align="center"> 📚 Case Study - Database Bookstore 📚 </h1>

## 📃 Table of Contents:
  - [About Project](#-about-project)
  - [Scenario](#-scenario)
  - [Business Rules](#-business-rules)
   - [Database Schema](#-database-schema)
<br>


## 🖋 About Project:
👉 A database built for e-bookstore case studies. <br>
👉 The database built using **SQL** in _Microsoft SQL Server. <br><br>


## 🧾 Scenario:
> A Bookstore located in Kuala Lumpur Malaysia has vast collection of books in its warehouse. The bookstore ordered books of various genres from different publishers and sell them to the customers. As their business grows, the bookstore would like to implement an online store to facilitate the purchase of books to more customers. You are assigned the project to design and implement a database system for online E-Bookstore Database System.  <br><br>

•	The bookstore purchases books from publisher which are then sell to its members. The bookstore manager compiles a list of needed books and sends an order to the publishers. The publisher supplies the ordered books to the university. The bookstore manager records the details of a new book, along with the number of the books that have arrived at the bookstore. An invoice is sent to the accounts department to be processed and payment made. <br><br>
•	Customers, who wish to purchase books online, need to initially register as members. Members will be able to view the book, read reviews and compare the online products with other similar articles. <br><br>
•	Members who wish to purchase can select their books into the website’s shopping cart. The cart will show the summary of the selection and total cost to be paid. Once the payment is made, the customer will be able to print or save the receipts. The bookstore will send the books to the customers within 7 working days. <br><br>
•	The system should manage information about books in the bookstore, inventory, (registered) customers and books they have ordered. It should also store information about user opinions and book ratings. <br><br>
•	Member can also provide 'feedback' for a book, as a score (1-10 which is 0= terrible, 10= masterpiece) along with optional short text. No changes are allowed; only one feedback per user per book is allowed.
<br><br>


## 📋 ERD Design:
👉 Based on the scenario above, the ERD designs defined as follows [here](https://github.com/Si-Xian/E-Bookstore-Database-System/blob/main/ERD.png).
<br><br>
[![](https://img.shields.io/badge/back%20to%20top-%E2%86%A9-blue)](#-table-of-contents)
<br><br>


## 📑 Business Rules:
1. A **member** can have **zero**, **one** or **many** orders, each order can be made by **1 member**.
2. Each **member** can only have **1 cart** and each **shopping cart** is owned by **1 member**.
3. A **member** can make at most **1 feedback** per book, with **rating (1-10)** compulsory and **comments**(optional).
4. Every **feedback** is made by only **1 member**.
5. Each **book** can have **many feedbacks** provided by different buyers, but each **feedback** can only be about **1 book**.
6. Each **book** can only be in a **unique category**.
7. The **Publisher** publishes **many books** and each **book** can only be published by **1 publisher**.
8. An **order** contains **many books**, and a **book** can be in **many orders**.
9. A **cart** can contain **many books** and a **book** can be in **many carts**.
10. An **order** can only represent a **delivery** and a **delivery** can only deal with **1 order**.

<br><br>
[![](https://img.shields.io/badge/back%20to%20top-%E2%86%A9-blue)](#-table-of-contents)
<br><br>

## 📝 Database Schema:
👉 Database schema generated by _Microsoft SQL Server 18_.
*   [Database Schema](link)
<br><br>
[![](https://img.shields.io/badge/back%20to%20top-%E2%86%A9-blue)](#-table-of-contents)
<br><br>

## 🙌 Support me!

👉 If you find this project useful, **please ⭐ this repository 😆**!
