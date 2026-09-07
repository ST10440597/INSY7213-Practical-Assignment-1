ALTER SESSION SET CONTAINER = FREEPDB1;
SHOW CON_NAME;

/* Grant the STUDENT schema permission to create Views
   required for Question 5.3.2. */

GRANT CREATE VIEW TO STUDENT;