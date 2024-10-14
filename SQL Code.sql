Create Database Assg;

Use Assg;

--Member M
Create Table Member(
MemberID nvarchar(50) Primary Key,
Name nvarchar(50), 
Address nvarchar(50)
);

Insert into Member VALUES 
('M1','John','KL'),
('M2','Chirstine','JB'),
('M3','Tan','JB'),
('M4','Lee','KL'),
('M5','Jonathan','PJ');

Select * from member
--Cart C
Create Table Cart (
CartID nvarchar(50) Primary Key, 
MemberID nvarchar(50) Foreign Key References Member
);

Insert into Cart Values 
	('C1', 'M1'),
    ('C2', 'M2'),
    ('C3', 'M3'),
    ('C4', 'M4'),
    ('C5', 'M5');

--Orders (cant use order as it is function name) R
Create Table Orders (
OrderID nvarchar(50) Primary Key, 
OrderDate date, 
TotalCost decimal(10,2),  
MemberID nvarchar(50) Foreign Key References Member);

Insert into Orders Values
('R1','1 July 2022',100,'M2'),
('R2','1 November 2022',50,'M2'),
('R3','2 July 2023', 70, 'M4'),
('R4','10 July 2022',190,'M3'),
('R5','1 December 2022',40,'M2');

--Delivery D
Create Table Delivery (
DeliveryID nvarchar(50) Primary Key, Status nvarchar(50), 
OrderID nvarchar(50) Foreign Key references Orders);

insert into Delivery values
('D1','Done','R1'),
('D2','Done','R2'),
('D3','Done','R3'),
('D4','Done','R4'),
('D5','Done','R5');

--Book B
Create table Book (
BookID nvarchar(50) Primary Key, Name nvarchar(50), 
Price decimal(10,2), 
QuantityInStock integer, 
PublisherID nvarchar(50) foreign key references Publisher, 
CategoryID nvarchar(50) foreign key references Category);

Insert into Book values 
('B1','The History of China', 22.50, 109, 'Pu5','c1'), 
('B2','US stock',33.40,18,'Pu1','c2'),
('B3','Warren Buffet',55.01,22,'Pu3','c2'),
('B4','Malaysiaku',22.40,55,'Pu4','c3'),
('B5','Maths_',20.30,12,'Pu2','c4'), 
('B6','Tesla',26.30,13,'Pu2','c4'),
('B7','Computer Skills',34.50,33,'Pu2','c4');

UPDATE Book
SET BookID = REPLACE(BookID, 'B07', 'B7');
 
--Publisher Pu
Create Table Publisher (
PublisherID nvarchar(50) primary key, 
PublisherName nvarchar(50)
);

Insert into Publisher values 
('Pu1', 'Pearson'),
('Pu2','MPH'),
('Pu3','Popular'),
('Pu4','TheStar'),
('Pu5','ChineseStar');

--Category c
Create Table Category (
ID nvarchar(50) primary key, 
Name nvarchar(50)
);

Insert into Category values 
('c1','Chinese'),
('c2','Eng'),
('c3','Malay'),
('c4','Science'),
('c5','Maths');

--Feedback F
Create Table Feedback (
FeedbackID nvarchar(50) primary Key, 
Rating integer, Comment nvarchar(50), 
BookID nvarchar(50) foreign key references Book, 
MemberID nvarchar(50) references Member);

Insert into Feedback values 
('F1', 5,NULL,'B1','M1'),
('F2', 5,'Good','B1','M1'),
('F3', FLOOR(RAND() * 10) + 1, NULL, 'B2', 'M2'),
('F5', FLOOR(RAND() * 10), 'Excellent', 'B3', 'M3'),
('F6', FLOOR(RAND() * 10), 'Average', 'B4', 'M4'),
('F4', FLOOR(RAND() * 10), 'Poor', 'B5', 'M5');

Insert into Feedback values 
('F7',7,NULL,'B2','M3'),
('F8',5,NULL,'B3','M4'),
('F9',7,NULL,'B3','M1');

--Orderbook O
Create Table OrderBook_Bridge (
OrderBookID nvarchar(50) primary key,
QuantityOrdered integer, 
BookID nvarchar(50) foreign key references Book,
OrderID nvarchar(50) foreign key references Orders
);

insert into OrderBook_Bridge values 
('O1', 5, 'B1','R2'),
('O2', 4, 'B3','R4'),
('O3', 10, 'B2','R4'),
('O4', 5, 'B4','R2'),
('O5', 15, 'B5','R2');

--CartBook CA
CReate table CartBook_Bridge (
CartBookID nvarchar(50) primary key,
QuantityInCart integer,
BookID nvarchar(50) foreign key references Book,
CartID nvarchar(50) foreign key references Cart);

insert into CartBook_Bridge values 
('CA1', 3, 'B1', 'C2'),
('CA2', 7, 'B3', 'C4'),
('CA3', 6, 'B4', 'C3'),
('CA4', 10, 'B2', 'C3'),
('CA5', 2, 'B5', 'C2');

--Data Manipulation Questions 
--1. Total feedback per book (book id, book title, total number feedback/book)

SELECT B.BookID, B.Name, Count(F.FeedbackID) as Feedback_per_book
FROM Book B
INNER JOIN Feedback F ON B.BookID = F.BookID
GROUP BY B.BookID, B.Name;

--2. Total feedback per member (member id, member name, total number feedback/book) 
Select M.MemberID, M.name, count(F.feedbackID) as Feedback_per_person 
From Member M inner join Feedback F ON M.MemberID=F.MemberID 
Group By M.MemberID,M.Name;

--3. Total book each publisher. (publisher id, publisher name, total book published)
Select P.PublisherID, P.PublisherName, count(B.PublisherID) as Total_books_per_Publisher 
From Publisher P inner join Book B ON  P.PublisherID=B.PublisherID 
Group By P.PublisherID, P.PublisherName;

--4. Total book each category. (category id, category name, total book/category)
Select Category.ID, 
	Category.Name, 
	Sum(Book.QuantityInStock) as 'Total books per each category'
From Category inner join Book ON Category.ID=Book.CategoryID
Group By Category.ID, Category.Name;

--5. List book w/ quantity > avg quantity of all books
Select * from Book 
where QuantityinStock > (Select Avg(QuantityInStock) from Book);

--6. Total books from each genre.
Select Sum(QuantityInStock) as 'Total per Genre'
From Book inner Join Category on Book.CategoryID=Category.ID 
Group By Category.ID;

--7. Member who did not make any order.
select * from Member 
where MemberID not in (Select MemberID from Orders);

--8. Find the average rating for each book.
Select BookID,AVG(Rating) as Average_rating 
from Feedback 
group by BookID;

--9. Total num of books added to shopping cart.
Select SUM(QuantityInCart) as Total_Quantity_in_Cart 
from CartBook_Bridge;

--10 Members who made more than 2 orders.
Select  Name, Count(OrderID) as 'Num Of Order'
from Orders inner join Member on Member.MemberID=Orders.MemberID 
group by Name Having Count(OrderID)>2;

--Meethod 2
Select COunt(OrderID) as NumOfOrder, MemberID from Orders group by 
MemberID having Count(OrderID)>2;

--Method 3
SELECT * FROM Member WHERE MemberID IN
(SELECT MemberID FROM Orders GROUP BY MemberID HAVING COUNT(OrderID) >2);