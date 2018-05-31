CREATE DATABASE unicentaopos;
GRANT ALL PRIVILEGES ON unicentaopos.* TO 'unicenta'@'127.0.0.1' IDENTIFIED BY 'test1';
USE unicentaopos;
CREATE TABLE
    retour
    (
        IDTICKET bigint
    )    