use atm;
CREATE TABLE transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY, 
    AccountNumber VARCHAR(20) NOT NULL,           
    TransactionType VARCHAR(50) NOT NULL,         
    TransactionAmount DECIMAL(18, 2) NOT NULL,   
    TransactionDate DATETIME NOT NULL,           
    BalanceAfterTransaction DECIMAL(18, 2) NOT NULL, 
    Description VARCHAR(255) NULL,               
    FOREIGN KEY (AccountNumber) REFERENCES user_info(account_number) 
);
