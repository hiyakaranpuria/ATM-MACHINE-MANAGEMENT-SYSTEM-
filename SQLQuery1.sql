
use atm;
use atm;
CREATE TABLE user_info (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    dob DATE,
    gender NVARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    address NVARCHAR(MAX),
    phone_number NVARCHAR(15),
    email NVARCHAR(100),
    account_number NVARCHAR(20) UNIQUE NOT NULL,
    card_number NVARCHAR(16) UNIQUE NOT NULL,
    account_type NVARCHAR(20) CHECK (account_type IN ('savings', 'checking', 'business')),
    balance DECIMAL(10, 2) DEFAULT 0.00,
    pin NVARCHAR(4) NOT NULL,
    account_creation_date DATETIME DEFAULT GETDATE(),
    last_accessed DATETIME DEFAULT GETDATE(),
    status NVARCHAR(10) DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'suspended')),
    security_question_1 NVARCHAR(255),
    security_answer_1 NVARCHAR(255),
    security_question_2 NVARCHAR(255),
    security_answer_2 NVARCHAR(255),
    nationality NVARCHAR(50)
);
