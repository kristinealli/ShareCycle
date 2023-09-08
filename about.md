User Registration, User Authentication: Users will need to register and sign in and create an account to access the application. 

Items: Users can list items they are willing to share, each item is associated with details such as it’s name, description, category, and availability status. 

Loan Management: Users can request to borrow items from other users. Loans are tracked 
with information, including loan date, due date, return date, and loan status.

Photo Upload: Users can upload photos of items both before and after a loan. Photos provide a visual record to ensure item condition and accountability.

Reminder System: Notify users about upcoming loan due dates. This helps users return borrowed items on time, improving the overall lending experience.

User Profiles: Users have profiles where they can manage their listed items and view their borrowing history. Profiles help users keep track of their lending and borrowing activities.

Search and Filter: Users can search for specific items based on various criteria, such as location or category. Filtering options make it easy to find items that match their needs.

 
API ENDPOINTS

User Registration: Register a new account. 
HTTP Verb: POST
Endpoint URL: /api/users/register

User Login: Authenticate and log-in a user. 
HTTP Verb: POST
Endpoint URL: /api/users/login

Item Listing: Add a new item to database. 
HTTP Verb: POST
Endpoint URL: /api/items

Loan Request: Request to borrow an item. 
HTTP Verb: POST
Endpoint URL: /api/loans/request

Loan Status: Retrieve status of loan. 
HTTP Verb: GET
Endpoint URL: /api/loans/{loan_id}

Photo Upload (Before and After):
HTTP Verb: POST
Endpoint URL: /api/items/{item_id}/photos

User Profile: Retrieve user profile information.
HTTP Verb: GET
Endpoint URL: /api/users/{user_id}

Search and Filter: Search and filter items based on user-defined criteria.
HTTP Verb: GET
Endpoint URL: /api/items/search

Reminder System: Automated system to send reminders via email or push notifications. 
DATABASE TABLES

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    item_name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(255),
    availability_status VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    borrower_id INT,
    loan_date DATETIME,
    due_date DATETIME,
    return_date DATETIME,
    status VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES Item(item_id),
    FOREIGN KEY (borrower_id) REFERENCES User(user_id)
);

CREATE TABLE Photo (
    photo_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    photo_url VARCHAR(255),
    is_before_photo BOOLEAN,
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);	

USER ||--o{ ITEM : owns:
This relationship indicates that each user can own zero or more items.
The "||--o{" notation denotes a one-to-many relationship, implying that each user can own multiple items.
Each item is owned by only one user.

USER ||--o{ LOAN : benefits from:
This relationship signifies that each user can benefit from multiple loans.
The "||--o{" notation indicates a one-to-many relationship, meaning each user can participate in multiple loans.

ITEM ||--o{ LOAN : is:
This relationship represents that each item can be associated with multiple loans.
The "||--o{" notation denotes a one-to-many relationship, implying that each item can be associated with multiple loans.

LOAN ||--o{ ITEM : active_loan:
This relationship signifies that each loan is associated with one item as its active loan.
The "||--o{" notation denotes a one-to-many relationship, indicating that each loan is linked to one item as its active loan.
The active_loan relationship indicates which loan is currently active for an item.

ITEM ||--o{ PHOTO : has:
This relationship indicates that each item can have multiple photos associated with it.
The "||--o{" notation denotes a one-to-many relationship, implying that each item can have multiple photos.
Each photo is associated with only one item.

