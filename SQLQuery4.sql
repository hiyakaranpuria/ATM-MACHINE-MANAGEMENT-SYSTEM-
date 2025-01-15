CREATE TABLE transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,  -- Unique transaction ID
    AccountNumber NVARCHAR(20) NOT NULL,           -- Account number associated with the transaction
    TransactionType VARCHAR(50) NOT NULL,         -- Type of transaction (e.g., 'Withdraw', 'Deposit')
    TransactionAmount DECIMAL(18, 2) NOT NULL,    -- Amount involved in the transaction
    TransactionDate DATETIME NOT NULL,            -- Date and time of the transaction
    BalanceAfterTransaction DECIMAL(18, 2) NOT NULL, -- Balance after the transaction
    Description VARCHAR(255) NULL,                -- Description or details of the transaction
    FOREIGN KEY (AccountNumber) REFERENCES user_info(account_number) -- Assuming you have an 'Accounts' table
);
