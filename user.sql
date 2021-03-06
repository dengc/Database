Author: Chufan Deng
//gcloud beta sql connect sql-db-1 --user=root

Q1.
SELECT USER_ID, NAME
FROM USERS
WHERE USER_ID NOT IN (SELECT USER_ID FROM POSTS)
AND USER_ID IN (SELECT COMMENTER_USER_ID FROM COMMENTS WHERE POST_ID = 5);

Q2.
SELECT USER_ID
FROM USERS
WHERE GENDER = 'F' AND USER_ID IN
(SELECT FRIEND_ID
FROM FRIENDSHIPS
WHERE USER_ID = 1) 
AND USER_ID IN
(SELECT FRIEND_ID
FROM FRIENDSHIPS
WHERE USER_ID = 2);

Q3.
SELECT USER_ID
FROM FRIENDSHIPS
WHERE FRIEND_ID IN
(SELECT USER_ID
FROM POSTS)
GROUP BY USER_ID
HAVING COUNT(FRIEND_ID) > 2;

Q4.
SELECT DISTINCT USER_ID, COUNT(FRIEND_ID)
FROM FRIENDSHIPS
WHERE USER_ID IN
(SELECT USER_ID
FROM USERS
WHERE GENDER = 'F' AND DATE_OF_BIRTH > date '1990-12-20') AND USER_ID IN
(SELECT c.COMMENTER_USER_ID
FROM POSTS p
INNER JOIN COMMENTS c ON p.POST_ID = c.POST_ID
WHERE p.USER_ID = 10)
GROUP BY USER_ID;

Q5.
SELECT USER_ID
FROM FRIENDSHIPS
WHERE FRIEND_ID IN
(SELECT USER_ID
FROM POSTS
WHERE POST_ID = 7) AND USER_ID IN
(SELECT COMMENTER_USER_ID
FROM COMMENTS
WHERE POST_ID = 7);

Q6.
SELECT c.COMMENTER_USER_ID, u.NAME, COUNT(DISTINCT c.COMMENT_ID) as 'ACC', tot.TOTAL
FROM POSTS p
INNER JOIN COMMENTS c ON p.POST_ID = c.POST_ID
INNER JOIN USERS u ON c.COMMENTER_USER_ID = u.USER_ID
INNER JOIN FRIENDSHIPS f ON f.USER_ID = u.USER_ID
INNER JOIN 
(SELECT c.COMMENTER_USER_ID as 'uid', COUNT(DISTINCT c.COMMENT_ID) as 'TOTAL'
FROM POSTS p
INNER JOIN COMMENTS c ON p.POST_ID = c.POST_ID
INNER JOIN USERS u ON c.COMMENTER_USER_ID = u.USER_ID
INNER JOIN FRIENDSHIPS f ON f.USER_ID = u.USER_ID
WHERE u.GENDER = 'F' AND c.COMMENTER_USER_ID IN
(SELECT FRIEND_ID
FROM FRIENDSHIPS
WHERE USER_ID = 20)
GROUP BY c.COMMENTER_USER_ID) tot ON c.COMMENTER_USER_ID = tot.uid
WHERE p.USER_ID <> 10 AND u.GENDER = 'F' AND p.USER_ID <> c.COMMENTER_USER_ID AND c.COMMENTER_USER_ID IN
(SELECT FRIEND_ID
FROM FRIENDSHIPS
WHERE USER_ID = 20)
GROUP BY c.COMMENTER_USER_ID
HAVING ACC > 3
ORDER BY ACC DESC
LIMIT 3;

//
CREATE DATABASE test;

USE test;
CREATE TABLE USERS (USER_ID VARCHAR(255), NAME VARCHAR(255), GENDER VARCHAR(2), DATE_OF_BIRTH date, PRIMARY KEY(USER_ID));
INSERT intO USERS (USER_ID, NAME, GENDER) values ("1", "AA", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("2", "BB", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("3", "CC", "M");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("4", "DD", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("5", "EE", "M");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("6", "FF", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("7", "GG", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("8", "HH", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("9", "II", "M");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("10", "JJ", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("11", "KK", "M");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("12", "LL", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("13", "MM", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("14", "NN", "M");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("15", "OO", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("16", "PP", "F");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("17", "QQ", "M");
INSERT intO USERS (USER_ID, NAME, GENDER) values ("18", "RR", "F");
//
SELECT * FROM USERS;
//

CREATE TABLE POSTS (POST_ID VARCHAR(255), USER_ID VARCHAR(255), PRIMARY KEY(POST_ID), FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID));
INSERT intO POSTS values ("1000", "1");
INSERT intO POSTS values ("1001", "1");
INSERT intO POSTS values ("1002", "2");
INSERT intO POSTS values ("1003", "2");
INSERT intO POSTS values ("1004", "2");
INSERT intO POSTS values ("1005", "3");
INSERT intO POSTS values ("1006", "3");
INSERT intO POSTS values ("1007", "4");
INSERT intO POSTS values ("1008", "4");
INSERT intO POSTS values ("1009", "5");
INSERT intO POSTS values ("1010", "5");
INSERT intO POSTS values ("1011", "6");
INSERT intO POSTS values ("1012", "6");
INSERT intO POSTS values ("1013", "7");
INSERT intO POSTS values ("1014", "7");
INSERT intO POSTS values ("1015", "8");
INSERT intO POSTS values ("1016", "8");
INSERT intO POSTS values ("1017", "9");
INSERT intO POSTS values ("1018", "9");
INSERT intO POSTS values ("1019", "10");
INSERT intO POSTS values ("1020", "10");
INSERT intO POSTS values ("1021", "11");
INSERT intO POSTS values ("1022", "11");
INSERT intO POSTS values ("1023", "12");
INSERT intO POSTS values ("1024", "12");
INSERT intO POSTS values ("1025", "13");
INSERT intO POSTS values ("1026", "13");
INSERT intO POSTS values ("1027", "14");
INSERT intO POSTS values ("1028", "14");
INSERT intO POSTS values ("1029", "15");
//
SELECT * FROM POSTS;
//

CREATE TABLE COMMENTS (COMMENT_ID VARCHAR(255), POST_ID VARCHAR(255), COMMENTER_USER_ID VARCHAR(255), PRIMARY KEY(COMMENT_ID), FOREIGN KEY (POST_ID) REFERENCES POSTS(POST_ID), FOREIGN KEY (COMMENTER_USER_ID) REFERENCES USERS(USER_ID));
INSERT intO COMMENTS values ("50000", "1000", "2");
INSERT intO COMMENTS values ("50001", "1000", "2");
INSERT intO COMMENTS values ("50002", "1000", "3");
INSERT intO COMMENTS values ("50003", "1001", "4");
INSERT intO COMMENTS values ("50004", "1001", "1");
INSERT intO COMMENTS values ("50005", "1001", "5");
INSERT intO COMMENTS values ("50006", "1001", "3");
INSERT intO COMMENTS values ("50007", "1002", "2");
INSERT intO COMMENTS values ("50008", "1002", "2");
INSERT intO COMMENTS values ("50009", "1002", "7");
INSERT intO COMMENTS values ("50010", "1003", "9");
INSERT intO COMMENTS values ("50011", "1003", "6");
INSERT intO COMMENTS values ("50012", "1003", "6");
INSERT intO COMMENTS values ("50013", "1004", "8");
INSERT intO COMMENTS values ("50014", "1004", "15");
INSERT intO COMMENTS values ("50015", "1004", "7");
INSERT intO COMMENTS values ("50016", "1005", "9");
INSERT intO COMMENTS values ("50017", "1005", "9");
INSERT intO COMMENTS values ("50018", "1005", "4");
INSERT intO COMMENTS values ("50019", "1005", "7");
INSERT intO COMMENTS values ("50020", "1006", "13");
INSERT intO COMMENTS values ("50021", "1006", "16");
INSERT intO COMMENTS values ("50022", "1006", "7");
INSERT intO COMMENTS values ("50023", "1007", "6");
INSERT intO COMMENTS values ("50024", "1007", "8");
INSERT intO COMMENTS values ("50025", "1007", "15");
INSERT intO COMMENTS values ("50026", "1008", "10");
INSERT intO COMMENTS values ("50027", "1008", "5");
INSERT intO COMMENTS values ("50028", "1008", "9");
INSERT intO COMMENTS values ("50029", "1009", "8");
INSERT intO COMMENTS values ("50030", "1009", "12");
INSERT intO COMMENTS values ("50031", "1009", "16");
INSERT intO COMMENTS values ("50032", "1010", "17");
INSERT intO COMMENTS values ("50033", "1010", "14");
INSERT intO COMMENTS values ("50034", "1010", "8");
INSERT intO COMMENTS values ("50035", "1010", "13");
INSERT intO COMMENTS values ("50036", "1005", "16");
INSERT intO COMMENTS values ("50037", "1005", "17");
INSERT intO COMMENTS values ("50038", "1019", "4");
INSERT intO COMMENTS values ("50039", "1020", "1");
INSERT intO COMMENTS values ("50040", "1020", "5");
INSERT intO COMMENTS values ("50041", "1020", "2");
INSERT intO COMMENTS values ("50042", "1007", "1");
INSERT intO COMMENTS values ("50043", "1013", "10");
INSERT intO COMMENTS values ("50044", "1013", "7");
INSERT intO COMMENTS values ("50045", "1014", "10");
INSERT intO COMMENTS values ("50046", "1014", "13");
INSERT intO COMMENTS values ("50047", "1023", "1");
INSERT intO COMMENTS values ("50048", "1024", "1");
INSERT intO COMMENTS values ("50049", "1000", "12");

//
SELECT * FROM COMMENTS;
//

CREATE TABLE FRIENDSHIPS (USER_ID VARCHAR(255), FRIEND_ID VARCHAR(255), PRIMARY KEY(USER_ID, FRIEND_ID), FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID));
INSERT intO FRIENDSHIPS values ("1", "2");
INSERT intO FRIENDSHIPS values ("2", "1");
INSERT intO FRIENDSHIPS values ("1", "3");
INSERT intO FRIENDSHIPS values ("3", "1");
INSERT intO FRIENDSHIPS values ("2", "3");
INSERT intO FRIENDSHIPS values ("3", "2");
INSERT intO FRIENDSHIPS values ("1", "4");
INSERT intO FRIENDSHIPS values ("4", "1");
INSERT intO FRIENDSHIPS values ("4", "2");
INSERT intO FRIENDSHIPS values ("2", "4");
INSERT intO FRIENDSHIPS values ("5", "3");
INSERT intO FRIENDSHIPS values ("3", "5");
INSERT intO FRIENDSHIPS values ("7", "2");
INSERT intO FRIENDSHIPS values ("2", "7");
INSERT intO FRIENDSHIPS values ("1", "13");
INSERT intO FRIENDSHIPS values ("13", "1");
INSERT intO FRIENDSHIPS values ("13", "2");
INSERT intO FRIENDSHIPS values ("2", "13");
INSERT intO FRIENDSHIPS values ("13", "3");
INSERT intO FRIENDSHIPS values ("3", "13");
INSERT intO FRIENDSHIPS values ("16", "2");
INSERT intO FRIENDSHIPS values ("2", "16");
INSERT intO FRIENDSHIPS values ("11", "13");
INSERT intO FRIENDSHIPS values ("13", "11");
INSERT intO FRIENDSHIPS values ("11", "12");
INSERT intO FRIENDSHIPS values ("12", "11");
INSERT intO FRIENDSHIPS values ("1", "9");
INSERT intO FRIENDSHIPS values ("9", "1");
//
SELECT * FROM FRIENDSHIPS;
//
 
