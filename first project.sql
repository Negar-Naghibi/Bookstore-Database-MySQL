
-- 2. ساخت دیتابیس جدید
CREATE DATABASE book_store;
USE book_store;

-- 3. ساخت جدول نویسندگان
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(50)
) ENGINE=InnoDB;

-- 4. ساخت جدول کتاب‌ها
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(200),
    author_id INT,
    price DECIMAL(10, 2),
    sales INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
) ENGINE=InnoDB;

-- 5. درج داده‌های نمونه
INSERT INTO authors VALUES
(1, 'Jalal Al-e-Ahmad', 'Iran'),
(2, 'George Orwell', 'UK'),
(3, 'Haruki Murakami', 'Japan');

INSERT INTO books VALUES
(1, 'The School Principal', 1, 25.99, 1500),
(2, '1984', 2, 30.50, 3000),
(3, 'Kafka on the Shore', 3, 28.75, 2500);

-- 6. کوئری‌های نمونه
SELECT * FROM books WHERE sales > 2000;

SELECT b.book_title, a.author_name, b.price
FROM books b
JOIN authors a ON b.author_id = a.author_id;

SELECT 
    a.country,
    SUM(b.sales) AS total_sales
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.country;