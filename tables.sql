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
