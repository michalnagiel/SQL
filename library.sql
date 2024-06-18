--stworzenie tabeli PEOPLE zawierającej atrybuty id (varchar(11))(klucz główny),  first_name (varchar(20)), last_name (varchar(20))
CREATE TABLE "people" (
  "id" varchar(11) PRIMARY KEY,
  "first_name" varchar(20),
  "last_name" varchar(20)
);

--stworzenie tabeli AUTHORS zawierającej atrybuty id (varchar(11))(klucz główny),  country_of_origin (varchar(20))
CREATE TABLE "authors" (
  "id" varchar(11) PRIMARY KEY,
  "country_of_origin" varchar(20)
);

--stworzenie tabeli AUTHORS zawierającej atrybuty isbn (varchar(13))(klucz główny),  author_id (varchar(11), title (varchar(100))
CREATE TABLE "books" (
  "isbn" varchar(13) PRIMARY KEY,
  "author_id" varchar(11),
  "title" varchar(100)
);

--stworzenie tabeli BOOK_COPIES zawierającej atrybuty id (varchar(11))(klucz główny), isbn (varchar(13)), library_branch_id (integer)
CREATE TABLE "book_copies" (
  "id" varchar(11) PRIMARY KEY,
  "isbn" varchar(13),
  "library_branch_id" integer
);

--stworzenie tabeli LIBRARY_BRANCHES zawierającej atrybuty id (integer)(klucz główny), address (varchar(50))
CREATE TABLE "library_branches" (
  "id" integer PRIMARY KEY,
  "address" varchar(50)
);

--stworzenie tabeli CLIENTS zawierającej atrybuty pesel (varchar(11))(klucz główny), date_of_registration (date), phone_number (varchar(9))
CREATE TABLE "clients" (
  "pesel" varchar(11) PRIMARY KEY,
  "date_of_registration" date,
  "phone_number" varchar(9),
  "address" varchar(50)
);

--stworzenie tabeli LOANS zawierającej atrybuty id (integer)(klucz główny), book_copy_id (varchar(11)), client_pesel (varchar(11)), date_of_loan (date), date_of_return (date)
CREATE TABLE "loans" (
  "id" integer PRIMARY KEY,
  "book_copy_id" varchar(11),
  "client_pesel" varchar(11),
  "date_of_loan" date,
  "date_of_return" date
);

--dodanie klucza zewnętrznego
ALTER TABLE "clients" ADD FOREIGN KEY ("pesel") REFERENCES "people" ("id");
ALTER TABLE "authors" ADD FOREIGN KEY ("id") REFERENCES "people" ("id");
ALTER TABLE "loans" ADD FOREIGN KEY ("client_pesel") REFERENCES "clients" ("pesel");
ALTER TABLE "books" ADD FOREIGN KEY ("author_id") REFERENCES "authors" ("id");
ALTER TABLE "book_copies" ADD FOREIGN KEY ("isbn") REFERENCES "books" ("isbn");
ALTER TABLE "loans" ADD FOREIGN KEY ("book_copy_id") REFERENCES "book_copies" ("id");
ALTER TABLE "book_copies" ADD FOREIGN KEY ("library_branch_id") REFERENCES "library_branches" ("id");

--dodanie encji do tabel
INSERT INTO PEOPLE
	VALUES
    	  ('00000000000', 'Albert', 'Camus'),
        ('11111111111', 'Bruno', 'Jasieński'),
        ('99101503122', 'Celina', 'Cebula'),
        ('39050311277', 'Damian', 'Dzięcioł'),
        ('67110301122', 'Eleonora', 'Emir'),
        ('55555555555', 'Fiodor', 'Dostojewski'),
        ('02222215133', 'Grzegorz', 'Gracz'),
        ('96010178117', 'Henryk', 'Harc'),
        ('88888888888', 'Zuzanna', 'Ginczanka'),
        ('99999999999', 'Julian', 'Tuwim'),
        ('10101010101', 'Miron', 'Białoszewski');
        
INSERT INTO AUTHORS
	VALUES
    	  ('00000000000', 'France'),
 		    ('11111111111', 'Poland'),
        ('55555555555', 'Russia'),
        ('88888888888', 'Poland'),
        ('99999999999', 'Poland'),
        ('10101010101', 'Poland');
        
INSERT INTO CLIENTS
  VALUES
    ('99101503122', '2023-01-15', '505506507', 'Gdańsk, Poziomkowa 15/1'),
    ('39050311277', '2023-02-02', '508514528', 'Gdańsk, Szeroka 33/7'),
    ('67110301122', '2022-12-30', '769851234', 'Gdańsk, Tadeusza Kościuszki 15/3'),
    ('02222215133', '2023-03-03', '815115315', 'Warszawa, Pamiętajcie o Ogrodach 12/2'),
    ('96010178117', '2023-02-13', '506444125', 'Poznań, Lodowa 20/20');
    
INSERT INTO BOOKS
  VALUES
    ('1587698453214', '00000000000', 'Obcy'),
    ('1589487241771', '00000000000', 'Dżuma'),
    ('9875465416188', '11111111111', 'Palę paryż'),
    ('8897345616587', '11111111111', 'Nogi Izoldy Morgan'),
    ('6846546886548', '55555555555', 'Idiota'),
    ('9875461848482', '55555555555', 'Gracz'),
    ('4874874889888', '88888888888', 'O centaurach'),
    ('8879879845232', '99999999999', 'Kwiaty polskie'),
    ('0854848484888', '99999999999', 'Żandarm'),
    ('0548484888844', '10101010101', 'Obroty rzeczy'),
    ('8796541324657', '10101010101', 'Chamowo');
    
INSERT INTO LIBRARY_BRANCHES
  VALUES
    (0, 'Jagiellońska 10'),
    (1, 'Grunwaldzka 452'),
    (2, 'Targ Rakowy 15');
    
INSERT INTO BOOK_COPIES
  VALUES
    (0, '1587698453214', 0),
    (1, '1587698453214', 0),
    (2, '1587698453214', 0),
    (3, '1587698453214', 1),
    (4, '1587698453214', 2),
    (5, '1589487241771', 0),
    (6, '1589487241771', 0),
    (7, '1589487241771', 1),
    (8, '1589487241771', 1),
    (9, '1589487241771', 2),
    (10, '9875465416188', 0),
    (11, '8897345616587', 0),
    (12, '6846546886548', 0),
    (13, '6846546886548', 0),
    (14, '6846546886548', 1),
    (15, '6846546886548', 2),
    (16, '9875461848482', 0),
    (17, '4874874889888', 1),
    (18, '8879879845232', 0),
    (19, '8879879845232', 1),
    (20, '0548484888844', 1),
    (21, '0548484888844', 1),
    (22, '0548484888844', 2),
    (23, '8796541324657', 0),
    (24, '8796541324657', 0),
    (25, '8796541324657', 1),
    (26, '8796541324657', 2);
    
INSERT INTO LOANS
  VALUES
    (0, 23, '99101503122', '2024-01-15', '2024-02-13'),
    (1, 15, '67110301122', '2024-01-16', '2024-02-13'),
    (2, 13, '39050311277', '2024-01-17', '2024-02-17'),
    (3, 11, '96010178117', '2024-01-18', '2024-02-15'),
    (4, 23, '96010178117', '2024-01-18', '2024-01-27'),
    (5, 17, '99101503122', '2024-01-23', '2024-02-02'),
    (6, 18, '67110301122', '2024-01-23', '2024-02-15'),
    (7, 1, '02222215133', '2024-01-24', '2024-02-14'),
    (8, 0, '02222215133', '2024-01-24', '2024-02-02'),
    (9, 5, '99101503122', '2024-01-26', '2024-02-01'),
    (10, 6, '39050311277', '2024-01-27', '2024-02-17');
INSERT INTO LOANS
  VALUES
    (11, 6, '99101503122', '2024-01-28'),
    (12, 18, '67110301122', '2024-01-29'),
    (13, 1, '02222215133', '2024-02-02'),
    (14, 0, '96010178117', '2024-02-13'),
    (15, 2, '67110301122', '2024-02-14'),
    (16, 7, '99101503122', '2024-02-15'),
    (17, 9, '96010178117', '2024-02-15'),
    (18, 15, '02222215133', '2024-02-15'),
    (19, 17, '96010178117', '2024-02-15'),
    (20, 26, '39050311277', '2024-02-15');
	
--wyświetlenie zawartości tabel
SELECT * FROM PEOPLE;
SELECT * FROM AUTHORS;
SELECT * FROM CLIENTS;
SELECT * FROM BOOKS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM LIBRARY_BRANCHES;
SELECT * FROM LOANS;

--wyświetlenie ludzi związanych z biblioteką w kolejności alfabetycznej rosnąco nazwiskami
SELECT first_name, last_name FROM PEOPLE ORDER BY last_name;
--wyświetlenie egzemplarzy książek w zbiorach filii nr 0
SELECT * FROM BOOK_COPIES WHERE library_branch_id=0;
--wyświetlenie liczby książek w filii nr 1
SELECT COUNT (*) FROM BOOK_COPIES WHERE library_branch_id=1;
--wyświetlenie wszystkie egzemplarze książek z ich id i tytułami
SELECT BOOK_COPIES.id, BOOKS.title FROM BOOK_COPIES INNER JOIN BOOKS ON BOOK_COPIES.isbn=BOOKS.isbn; 
--jakie egzemplarze książki o isbn='1587698453214' są dostępne w filii nr 1?
SELECT * FROM BOOK_COPIES WHERE isbn='1587698453214' AND library_branch_id=0;
--egzemplarze których książek autora są dostępne w konkretnej filii?
SELECT * FROM PEOPLE INNER JOIN BOOKS ON PEOPLE.id=BOOKS.author_id INNER JOIN BOOK_COPIES ON BOOK_COPIES.isbn = BOOKS.isbn WHERE first_name='Miron' AND last_name='Białoszewski' AND BOOK_COPIES.library_branch_id=2;
--ile egzemplarzy książki o isbn='1587698453214' znajduje się w konkretnych filiach?
SELECT library_branch_id, COUNT (*) FROM BOOK_COPIES WHERE isbn='1587698453214' GROUP BY library_branch_id;
--Kiedy mija termin zwrotu wypożyczonych przeze mnie książek?
SELECT PEOPLE.first_name, PEOPLE.last_name, BOOKS.title, LOANS.date_of_loan, LIBRARY_BRANCHES.address FROM LOANS INNER JOIN BOOK_COPIES ON LOANS.book_copy_id=BOOK_COPIES.id INNER JOIN BOOKS ON BOOK_COPIES.isbn=BOOKS.isbn INNER JOIN AUTHORS ON AUTHORS.id=BOOKS.author_id INNER JOIN PEOPLE ON PEOPLE.id=AUTHORS.id INNER JOIN LIBRARY_BRANCHES ON LIBRARY_BRANCHES.id = BOOK_COPIES.library_branch_id  WHERE client_pesel = '39050311277' AND date_of_return IS NULL;
--W których filiach wypożyczyłem książki?
SELECT LIBRARY_BRANCHES.address FROM LOANS INNER JOIN BOOK_COPIES ON LOANS.book_copy_id=BOOK_COPIES.id INNER JOIN LIBRARY_BRANCHES ON BOOK_COPIES.library_branch_id=LIBRARY_BRANCHES.id WHERE client_pesel = '39050311277' GROUP BY LIBRARY_BRANCHES.address;
--Ile razy w lutym 2024 były wypożyczone książki Alberta Camusa?
SELECT COUNT (*) FROM PEOPLE INNER JOIN AUTHORS ON PEOPLE.id=AUTHORS.id INNER JOIN BOOKS ON AUTHORS.id=BOOKS.author_id INNER JOIN BOOK_COPIES ON BOOKS.isbn=BOOK_COPIES.isbn INNER JOIN LOANS ON BOOK_COPIES.id = LOANS.book_copy_id WHERE first_name='Albert' AND last_name='Camus' AND LOANS.date_of_loan>= '2024-02-01' AND LOANS.date_of_loan<='2024-02-29';
--Ilu czytelników biblioteki ma zaległe wypożyczenia?
SELECT COUNT (DISTINCT client_pesel) FROM LOANS WHERE date_of_loan<'2024-02-01' AND date_of_return IS NULL;
--Które egzemplarze książek są przetrzymane?
SELECT * FROM BOOK_COPIES INNER JOIN LOANS ON LOANS.book_copy_id=BOOK_COPIES.id WHERE date_of_loan<'2024-02-01' AND date_of_return IS NULL;
--Ilu czytelników jest aktywnych (wypożyczyło książkę w przeciągu ostatniego roku)?
SELECT COUNT (DISTINCT client_pesel) FROM LOANS WHERE date_of_loan>='2024-01-01';
--Ile książek ma obecnie wypożyczonych czytelnik?
SELECT COUNT (*) FROM LOANS WHERE client_pesel='67110301122' AND date_of_return IS NULL;
--numery telefonów osób, do których należy wysłać powiadomienie sms o zbliżającym się terminie oddania książki
SELECT phone_number FROM CLIENTS JOIN LOANS ON CLIENTS.pesel = LOANS.client_pesel WHERE LOANS.date_of_loan<'2024-02-01' AND LOANS.date_of_return IS NULL;
--lista czytelników posortowana ze wzglęgu na liczbę wypożyczeń
SELECT PEOPLE.first_name, PEOPLE.last_name, COUNT(*) FROM PEOPLE INNER JOIN LOANS ON PEOPLE.id = LOANS.client_pesel GROUP BY PEOPLE.id ORDER BY count DESC;
--kto wypożyczył najwięcej książek?
SELECT PEOPLE.first_name, PEOPLE.last_name, COUNT(*) FROM PEOPLE INNER JOIN LOANS ON PEOPLE.id = LOANS.client_pesel GROUP BY PEOPLE.id ORDER BY count DESC LIMIT 1;
--ile egzemplarzy książek jest w poszczególnych filiach?
SELECT LIBRARY_BRANCHES.id, address, COUNT (*) FROM LIBRARY_BRANCHES INNER JOIN BOOK_COPIES ON LIBRARY_BRANCHES.id = BOOK_COPIES.library_branch_id GROUP BY LIBRARY_BRANCHES.id ORDER BY LIBRARY_BRANCHES.id;
--wypożyczenia w wybranym dniu
SELECT * FROM LOANS WHERE date_of_loan='2024-02-15';
--zwroty w wybranym dniu
SELECT * FROM LOANS WHERE date_of_return='2024-02-13';
