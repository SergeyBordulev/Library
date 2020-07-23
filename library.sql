CREATE DATABASE library; -- Создаем базу данных с именем library
USE library; -- выбираем базу данных для работы

CREATE TABLE author -- создаем таблицу author для хранения имени автора книги
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- поле id, целочисленный тип данных INT, уникальный номер ставится автоматически, является первичным ключем
	authorName VARCHAR(20) NOT NULL -- поле для хранения имени автора, строковый тип данных VARCHAR количество символов 20
);

INSERT INTO author(authorName) -- заполняем таблицу author для примера 
VALUES ('Александр Пушкин'), -- добавляем тестовые значения
('Михаил Булгаков'),
('Николай Гоголь'),
('Лев Толстой');

CREATE TABLE publisher -- создаем таблицу publisher для хранения названий издателей
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- поле индификатор id, целочисленный тип данных INT, уникальный номер ставится автоматически, является первичным ключем
	publisherName VARCHAR(100) NOT NULL -- поле для хранения названия издателя, строковый тип данных VARCHAR количество символов 100
);

INSERT INTO publisher(publisherName) -- заполняем таблицу издателей 
VALUES ('Эксмо'), -- добавляем тестовые значения
('Издательский дом Мещерякова'),
('Речь'),
('Просвещение'),
('Азбука');

CREATE TABLE book -- создаем таблицу book для хранения наименований книг
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- поле id идентификатор книг, целочисленный тип данных INT, уникальный номер ставится автоматически, является первичным ключем
	bookName VARCHAR(100) NOT NULL, -- поле bookName название книги, строковый тип данных VARCHAR количество символов 100
	bookYear INT NOT NULL, -- поле bookYear год выпука книги, целочисленный тип данных INT
	bookCount INT NOT NULL, -- поле bookCount счетчик количества книг в наличии, целочисленный тип данных INT
	bookPublisherId INT NOT NULL, -- поле bookPublisherId для издателя, здесь записывается id издателя, целочисленный тип данных INT
	FOREIGN KEY (bookPublisherId) REFERENCES publisher(id) -- поле bookPublisherId является внешним ключем к таблице publisher к полю id
);

INSERT INTO book (bookName, bookYear, bookCount, bookPublisherId) -- заполняем таблицу книг
VALUES ('Евгений Онегин', 2017, 2, 1), -- добавляем тестовые значения
('Мастер и Маргарита', 2012, 2, 1),
('Мертвые души', 2020, 2, 5),
('Война и мир', 1981, 2, 4),
('Капитанская дочка', 2017, 2, 1),
('Записки юного врача', 2019, 2, 1),
('Анна Каренина', 2019, 2, 1),
('Ревизор', 2018, 2, 3),
('Собачье сердце', 2015, 2, 1),
('Пиковая дама', 2017, 2, 2),
('Тарас Бульба', 2019, 2, 1),
('Дубровский', 2017, 2, 2);

CREATE TABLE students -- создаем таблицу students для хранения имен студентов
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- поле id идентификатор студентов, целочисленный тип данных INT, уникальный номер ставится автоматически, является первичным ключем
	studentsFirstName VARCHAR(20) NOT NULL, -- поле studentsFirstName имя студента, строковый тип данных VARCHAR количество символов 20
	studentsLastName VARCHAR(20) NOT NULL -- поле studentsFirstName фамилия студента, строковый тип данных VARCHAR количество символов 20
);

INSERT INTO students(studentsFirstName, studentsLastName) -- заполняем таблицу студентов
VALUES ('Иван', 'Иванов'), -- добавляем тестовые значения
('Ирина', 'Петрова'),
('Петр', 'Кулаков'),
('Александр', 'Логинов'),
('Иван', 'Иванов'),
('Семен', 'Тучин'),
('Ольга', 'Беседина'),
('Елисей', 'Умнов'),
('Анисья', 'Семенова'),
('Сергей', 'Манеев'),
('Екатерина', 'Королева'),
('Владимир', 'Титов'),
('Елена', 'Полякова'),
('Александр', 'Иванов'),
('Данил', 'Кусков'),
('Антон', 'Лебедев'),
('Оксана', 'Вавилина');

CREATE TABLE bookAuthor -- создаем таблицу bookAuthor для соединения имен авторов и книг
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- поле id идентификатор, целочисленный тип данных INT, уникальный номер ставится автоматически, является первичным ключем
	bookId INT NOT NULL, -- поле bookId для книги, здесь записывается id книги, целочисленный тип данных INT
	authorId INT NOT NULL, -- поле authorId для имени автора, здесь записывается id имени автора, целочисленный тип данных INT
    FOREIGN KEY (bookId) REFERENCES book(id), -- поле bookId является внешним ключем к таблице book к полю id
	FOREIGN KEY (authorId) REFERENCES author(id) -- поле authorId является внешним ключем к таблице author к полю id
);

INSERT INTO bookAuthor (bookId, authorId) -- заполняем таблицу соединения имен авторов и книг
VALUES (1, 1), -- добавляем тестовые значения
(2, 2),
(3, 3),
(4, 4),
(5, 1),
(6, 2),
(7, 4),
(8, 3),
(9, 2),
(10, 1),
(11, 3),
(12, 1);

CREATE TABLE ordersTable -- создаем таблицу ordersTable для учета выдачи и сдачи книг 
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- поле id идентификатор записи, целочисленный тип данных INT, уникальный номер ставится автоматически, является первичным ключем
	bookId INT NOT NULL, -- поле bookId для книги, здесь записывается id книги которая выдана, целочисленный тип данных INT
	studentId INT NOT NULL, -- поле studentId, здесь записывается id студента которому выдана книга, целочисленный тип данных INT
    dateStart DATE NOT NULL, -- поле dateStart для хранения даты выдачи книги, с типом данных DATE (формат ГГГГ-ММ-ДД), не может быть пустым, так как каждая запись подразумевает выдачу книги
    dateEnd DATE, -- поле dateEnd для хранения даты возврата книги, с типом данных DATE (формат ГГГГ-ММ-ДД), может быть пустым, когда книга не возвращена
    FOREIGN KEY (bookId) REFERENCES book(id), -- поле bookId является внешним ключем к таблице book к полю id
	FOREIGN KEY (studentId) REFERENCES students(id) -- поле studentId является внешним ключем к таблице students к полю id
);

INSERT INTO ordersTable (bookId, studentId, dateStart, dateEnd) -- заполняем таблицу ordersTable примерными значениями
VALUES (1, 1, '2017-06-19', '2017-06-25'), -- добавляем тестовые значения
(2, 2, '2017-07-01', '2017-07-10'),
(3, 3, '2017-07-13', '2017-07-20'),
(3, 2, '2017-08-22', '2017-09-22'),
(3, 1, '2017-09-22', '2017-09-25'),
(4, 4, '2017-10-19', '2017-10-25');
