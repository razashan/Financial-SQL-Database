

SELECT COUNT(DISTINCT bank_id) AS total_banks
FROM Bank;


SELECT b.bank_name, COUNT(a.atm_id) AS atm_count
FROM Bank b
LEFT JOIN ATMs a ON b.bank_id = a.bank_id
GROUP BY b.bank_name;

SELECT u.user_id, u.first_name, u.last_name
FROM Users u
INNER JOIN Accounts a ON u.user_id = a.user_id
GROUP BY u.user_id, u.first_name, u.last_name
HAVING COUNT(DISTINCT a.bank_id) > 1;


SELECT c.card_num, b.bank_name
FROM Cards c
INNER JOIN Bank b ON c.bank_id = b.bank_id
INNER JOIN Users u ON c.user_id = u.user_id
WHERE u.phone_num = '3988964';


SELECT b.bank_name, AVG(a.balance) AS avg_balance
FROM Bank b
INNER JOIN Accounts a ON b.bank_id = a.bank_id
GROUP BY b.bank_name;


SELECT u.user_id, u.first_name, u.last_name, a.balance
FROM Users u
INNER JOIN Accounts a ON u.user_id = a.user_id
ORDER BY a.balance DESC
LIMIT 5;


SELECT a.account_num, SUM(d.trans_amount) AS total_deposit, SUM(w.trans_amount) AS total_withdrawal
FROM Accounts a
LEFT JOIN Deposit d ON a.account_num = d.account_num
LEFT JOIN Withdraw w ON a.account_num = w.account_num
GROUP BY a.account_num;


SELECT u.user_id, u.first_name, u.last_name
FROM Users u
INNER JOIN Deposit d ON u.user_id = d.user_id
INNER JOIN Withdraw w ON u.user_id = w.user_id;


SELECT account_num, balance
FROM Accounts
WHERE balance > 50000;


SELECT u.user_id, u.first_name, u.last_name
FROM Users u
INNER JOIN Accounts a ON u.user_id = a.user_id
INNER JOIN Bank b ON a.bank_id = b.bank_id
WHERE b.bank_name LIKE '%San Diego%';


SELECT SUM(cash_limit) AS total_cash_limit
FROM ATMs;


SELECT DISTINCT u.user_id, u.first_name, u.last_name
FROM Users u
INNER JOIN Deposit d ON u.user_id = d.user_id
WHERE d.trans_amount > 5000;

SELECT u.user_id, u.first_name, u.last_name, AVG(a.balance) AS avg_balance
FROM Users u
INNER JOIN Accounts a ON u.user_id = a.user_id
GROUP BY u.user_id, u.first_name, u.last_name;


SELECT b.bank_name, COUNT(a.account_num) AS total_accounts
FROM Bank b
LEFT JOIN Accounts a ON b.bank_id = a.bank_id
GROUP BY b.bank_name;


SELECT card_id, card_num
FROM Cards
WHERE card_num LIKE '4%';


SELECT u.user_id, u.first_name, u.last_name
FROM Users u
INNER JOIN Deposit d ON u.user_id = d.user_id
INNER JOIN Withdraw w ON u.user_id = w.user_id
WHERE d.account_num = w.account_num;


SELECT account_num, balance
FROM Accounts
WHERE balance > (SELECT AVG(balance) FROM Accounts);


DELETE FROM Withdraw
WHERE trans_amount < 100;


SELECT CONCAT(U.first_name, ' ', U.last_name) AS full_name, A.account_num, A.balance
FROM Accounts A
JOIN Users U ON A.user_id = U.user_id;
