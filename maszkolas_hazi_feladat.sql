CREATE TABLE UgyfelMaszkolt (
  LOGIN NVARCHAR(50) MASKED WITH (Function = 'default()'),
  EMAIL NVARCHAR(100) MASKED WITH (Function = 'email()'),
  NEV NVARCHAR(50) MASKED WITH (Function = 'partial(1,"***",1)'),
  SZULEV INT MASKED WITH (Function = 'random(1900, 2020)'),
  NEM CHAR(1) MASKED WITH (Function = 'default()'),
  CIM NVARCHAR(150) MASKED WITH (Function = 'default()')
);

INSERT INTO UgyfelMaszkolt (Login, Email, Nev, Szulev, Nem, Cim)
Select LOGIN, EMAIL, NEV, SZULEV, NEM, CIM FROM Ugyfel 

CREATE USER MaskUser WITHOUT LOGIN;
GRANT SELECT ON UgyfelMaszkolt TO MaskUser;

EXECUTE AS User= 'MaskUser';
SELECT * FROM UgyfelMaszkolt
REVERT