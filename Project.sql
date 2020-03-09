CREATE TABLE Media_Categories  
( 
  MCAT_id  NUMBER NOT NULL,
  Media_type VARCHAR(30),
  CONSTRAINT MCAT_id_pk PRIMARY KEY (MCAT_id)
);

CREATE TABLE Projects     
( 
  proj_id  NUMBER NOT NULL,
  proj_title VARCHAR2(30),
  proj_Cost NUMBER,
  MCAT_id CONSTRAINT fk_MCAT_id REFERENCES Media_Categories(MCAT_id),
  CONSTRAINT proj_id_pk PRIMARY KEY (proj_id)
);

CREATE TABLE Sponsers  
( 
  Sponser_id  NUMBER NOT NULL,
  Sponser_Name VARCHAR(30),
  Sponser_Amount NUMBER,
  CONSTRAINT Sponser_id_pk PRIMARY KEY (Sponser_id)
);

CREATE TABLE Talent
(
  Talent_id NUMBER NOT NULL,
  Talent_Fname VARCHAR(30),
  Talent_Lname VARCHAR(30),
  MCAT_id CONSTRAINT fk_MCAT_idt REFERENCES Media_Categories(MCAT_id),
  CONSTRAINT Talent_id_pk PRIMARY KEY (Talent_id)
);

CREATE TABLE Agents
(
  Agent_id NUMBER NOT NULL,
  Agent_Name VARCHAR(30),
  Costs NUMBER,
  Agent_Contract_Start DATE,
  Agent_Contract_End DATE,
  CONSTRAINT Agent_id_pk PRIMARY KEY (Agent_id)
);

CREATE TABLE Contracts
(
  Contract_id NUMBER NOT NULL,
  Contract_Start DATE,
  Contract_End DATE,
  CONSTRAINT Contract_id_pk PRIMARY KEY (Contract_id),
  Agent_id CONSTRAINT fk_Agent_id REFERENCES Agents(Agent_id)
);

CREATE TABLE Clients
(
  Client_id NUMBER NOT NULL,
  Client_Name VARCHAR(30),
  CONSTRAINT Client_id_pk PRIMARY KEY (Client_id),
  proj_id CONSTRAINT fkc_proj_id REFERENCES Projects(proj_id)
);

CREATE TABLE Media
(
  Media_id NUMBER NOT NULL,
  Project_Cost NUMBER,
  Start_Date DATE,
  CONSTRAINT Media_id_pk PRIMARY KEY (Media_id),
  MCAT_id CONSTRAINT fkm_MCAT_id REFERENCES Media_Categories(MCAT_id),
  Sponser_id CONSTRAINT fk_Sponser_id REFERENCES Sponsers(Sponser_id)
);

drop table Media;
drop table Contracts;
drop table Clients;
drop table Agents;
drop table Sponsers;
drop table Projects;
drop table Media_Categories;
drop table Talent;

commit();

INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1001, 'Title 1', 10000, 1);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1002, 'Title 2', 34000, 2);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1003, 'Title 3', 67000, 3);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1004, 'Title 4', 70000, 4);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1005, 'Title 5', 92000, 5);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1006, 'Title 6', 15000, 1);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1007, 'Title 7', 46000, 2);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1008, 'Title 8', 55000, 3);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1009, 'Title 9', 80000, 4);
INSERT INTO Projects(proj_ID, proj_title, proj_cost, MCAT_id) VALUES (1010, 'Title 10', 20000, 6);

INSERT INTO Media_Categories(MCAT_ID,Media_Type) VALUES (1, 'TV Ad');
INSERT INTO Media_Categories(MCAT_ID,Media_Type) VALUES (2, 'Radio Ad');
INSERT INTO Media_Categories(MCAT_ID,Media_Type) VALUES (3, 'Posters');
INSERT INTO Media_Categories(MCAT_ID,Media_Type) VALUES (4, 'Newspaper Ad');
INSERT INTO Media_Categories(MCAT_ID,Media_Type) VALUES (5, 'Social Media Ad');
INSERT INTO Media_Categories(MCAT_ID,Media_Type) VALUES (6, 'Banners');

INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (201, 'Pepsico', 50000);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (202, 'Nokia', 75000);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (203, 'Coca Cola', 80000);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (204, 'Unilever', 35000);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (205, 'Deloitte', 76400);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (206, 'Accenture', 37900);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (207, 'Ford', 29900);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (208, 'Johnson and Johnson', 59900);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (209, 'Nestle', 70800);
INSERT INTO Sponsers(Sponser_id, sponser_name, sponser_amount) VALUES (200, 'Toyota', 80900);

INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (300, 'Harry','Potter', 6);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (301, 'Hermoine','Granger', 4);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (302, 'Ross','Geller', 2);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (303, 'Monica','Geller', 4);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (304, 'Joey','Tribbiani', 1);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (305, 'Pheobe','Buffay', 3);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (306, 'Rachel','Green', 4);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (307, 'Chandler','Bing', 5);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (308, 'Ted','Mosby', 2);
INSERT INTO Talent(Talent_id, Talent_Fname,Talent_Lname, MCAT_id) VALUES (309, 'Robin','Scherbatsky', 3);

INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (400, 'WPP Group',90000, TO_DATE('20/03/2018', 'DD/MM/YYYY'), TO_DATE('20/03/2019', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (401, 'ABB Group',80000, TO_DATE('07/10/2016', 'DD/MM/YYYY'), TO_DATE('07/10/2017', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (402, 'CN Group',55000, TO_DATE('15/05/2015', 'DD/MM/YYYY'), TO_DATE('15/05/2016', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (403, 'RT Group',85000, TO_DATE('26/06/2017', 'DD/MM/YYYY'), TO_DATE('26/06/2018', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (404, 'GT Group',47000, TO_DATE('23/05/2018', 'DD/MM/YYYY'), TO_DATE('23/05/2019', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (405, 'HM Group',89000, TO_DATE('12/10/2015', 'DD/MM/YYYY'), TO_DATE('12/10/2016', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (406, 'FL Group',67000, TO_DATE('11/05/2015', 'DD/MM/YYYY'), TO_DATE('11/05/2016', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (407, 'TLK Group',77000, TO_DATE('07/11/2014', 'DD/MM/YYYY'), TO_DATE('07/11/2015', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (408, 'OLL Group',99000, TO_DATE('17/01/2017', 'DD/MM/YYYY'), TO_DATE('17/01/2018', 'DD/MM/YYYY'));
INSERT INTO Agents(Agent_id, Agent_Name, Costs, Agent_Contract_Start, Agent_Contract_End) VALUES (409, 'PWW Group',46000, TO_DATE('14/02/2017', 'DD/MM/YYYY'), TO_DATE('14/02/2018', 'DD/MM/YYYY'));

INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1000, TO_DATE('02/14/2017', 'MM/DD/YYYY'), TO_DATE('02/14/2018', 'MM/DD/YYYY'), 403);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1001, TO_DATE('03/10/2018', 'MM/DD/YYYY'), TO_DATE('03/10/2019', 'MM/DD/YYYY'), 407);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1002, TO_DATE('04/25/2015', 'MM/DD/YYYY'), TO_DATE('04/25/2018', 'MM/DD/YYYY'), 404);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1003, TO_DATE('02/10/2016', 'MM/DD/YYYY'), TO_DATE('02/10/2018', 'MM/DD/YYYY'), 409);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1004, TO_DATE('05/14/2016', 'MM/DD/YYYY'), TO_DATE('05/14/2017', 'MM/DD/YYYY'), 401);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1005, TO_DATE('02/28/2016', 'MM/DD/YYYY'), TO_DATE('02/28/2018', 'MM/DD/YYYY'), 400);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1006, TO_DATE('09/28/2014', 'MM/DD/YYYY'), TO_DATE('09/28/2017', 'MM/DD/YYYY'), 405);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1007, TO_DATE('12/21/2015', 'MM/DD/YYYY'), TO_DATE('12/21/2017', 'MM/DD/YYYY'), 405);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1008, TO_DATE('11/26/2016', 'MM/DD/YYYY'), TO_DATE('11/26/2018', 'MM/DD/YYYY'), 403);
INSERT INTO Contracts(Contract_id, Contract_Start, Contract_End, Agent_id) VALUES (1009, TO_DATE('07/10/2015', 'MM/DD/YYYY'), TO_DATE('07/10/2017', 'MM/DD/YYYY'), 402);

INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2000, 'Nimpy', 1001);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2001, 'Sriof', 1003);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2002, 'Atdye', 1005);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2003, 'Hejow', 1004);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2004, 'Ecuhe', 1003);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2005, 'Zengvo', 1007);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2006, 'Rumpes', 1008);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2007, 'Gravmo', 1004);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2008, 'Pyrrhin', 1003);
INSERT INTO Clients(Client_id, Client_Name, Proj_id) VALUES (2009, 'Hemib', 1006);

INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4000, 76400, TO_DATE('02/10/2016', 'MM/DD/YYYY'), 4, 205);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4001, 80000, TO_DATE('03/16/2016', 'MM/DD/YYYY'), 6, 203);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4002, 80900, TO_DATE('04/14/2016', 'MM/DD/YYYY'), 2, 200);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4003, 75000, TO_DATE('05/12/2016', 'MM/DD/YYYY'), 3, 202);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4004, 29900, TO_DATE('06/17/2016', 'MM/DD/YYYY'), 1, 207);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4005, 59900, TO_DATE('07/04/2016', 'MM/DD/YYYY'), 2, 208);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4006, 59900, TO_DATE('08/06/2016', 'MM/DD/YYYY'), 2, 208);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4007, 37900, TO_DATE('09/06/2016', 'MM/DD/YYYY'), 6, 206);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4008, 76400, TO_DATE('10/03/2016', 'MM/DD/YYYY'), 3, 205);
INSERT INTO Media(Media_id, Project_Cost, Start_Date, MCAT_id, Sponser_id) VALUES (4009, 70800, TO_DATE('11/10/2016', 'MM/DD/YYYY'), 1, 209);

SELECT * FROM Agents;
--SQL Queries--

--Query 1--
--List Top 10 agents--
SELECT Agent_id, Agent_name, Costs FROM Agents WHERE ROWNUM <=10 ORDER BY Costs DESC;

--Query 2--
--List Agent ID and Agent Name with Contract start date after 01/01/2016--
SELECT Agent_id, Agent_name, Agent_Contract_Start FROM Agents WHERE CAST(Agent_Contract_Start as DATE) >= '01-JAN-16'; 

--Query 3--
--List Talents having Media type as Newspaper Ad --
SELECT Talent.Talent_fname, Talent.Talent_Lname, Talent.MCAT_ID, Media_Categories.Media_Type 
FROM Talent JOIN Media_Categories 
ON Talent.MCAT_ID = Media_Categories.MCAT_ID 
WHERE Talent.MCAT_Id = 4; 

--Query 4--
--List all contracts that are with agent id 405--
SELECT Agents.Agent_id,Agents.Agent_name, Contracts.CONTRACT_ID 
FROM Contracts JOIN Agents
ON Agents.Agent_id = Contracts.Agent_id
WHERE Agents.Agent_id = 405;

--Query 5--
--List all projects with cost more than 40000 and media type radio ad--
SELECT projects.proj_id, projects.proj_title,projects.proj_cost, media_categories.media_type 
FROM Projects Join MEDIA_CATEGORIES 
ON media_categories.MCAT_id = projects.MCAT_id
WHERE projects.proj_cost >= 40000 AND Media_Categories.media_type = 'Radio Ad';

--Query 6--
--Find maximum sponser amount--
SELECT MAX(Sponser_amount), sponser_name FROM sponsers GROUP BY sponser_name;

--Query 7--
-- Full outer joins for Agents and Clients--
SELECT * FROM Agents FULL OUTER JOIN Contracts ON Agents.agent_id = Contracts.Agent_id;

--Query 8--
--Find Average cost of all projects--
SELECT AVG(proj_cost) FROM Projects;

--Query 9--
--Find Most amount given by a sponsor
SELECT MAX(Sponser_amount) FROM Sponsers;

--Query 10--
--Find Projects from 01/06/2016 --
SELECT projects.proj_id, projects.proj_title, Media.Start_Date 
FROM Projects JOIN Media
ON (Projects.MCAT_ID = Media.MCAT_ID)
WHERE CAST(Media.Start_Date as DATE) > '01-JUN-2016';


--Find Variance cost of all projects--
SELECT VARIANCE(proj_cost) FROM Projects;

--Standard Deviation--
SELECT STDDEV(proj_cost) FROM Projects;

SELECT * FROM MEDIA_CATEGORIES;
INSERT INTO Media_Categories(MCAT_ID,Media_Type) VALUES (7, 'Youtube Advertise');
UPDATE Media_Categories SET Media_Type = 'Instagram Post' WHERE MCAT_ID = 7;
DELETE FROM Media_Categories WHERE MCAT_id = 7;