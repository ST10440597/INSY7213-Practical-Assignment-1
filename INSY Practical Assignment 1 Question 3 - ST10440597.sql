/* =========================================================
   CREATE USER JOHN

   John is given a password as specified in the case study.
   CREATE SESSION allows John to log into the database.
   ========================================================= */

CREATE USER John
IDENTIFIED BY Johnch2026;

/* Allow John to connect to the Oracle database. */

GRANT CREATE SESSION TO John;
/* John requires read access to database tables.
   SELECT ANY TABLE allows John to query tables
   throughout the database. */

GRANT SELECT ANY TABLE TO John;

/* =========================================================
   CREATE USER HANNAH

   Hannah is created with the password supplied in the
   Cheetah Deliveries case study.
   ========================================================= */

CREATE USER Hannah
IDENTIFIED BY Hannahch2026;

/* Allow Hannah to connect to the Oracle database. */

GRANT CREATE SESSION TO Hannah;
/* Hannah is responsible for inserting information.
   INSERT ANY TABLE allows Hannah to insert records
   into tables throughout the database. */

GRANT INSERT ANY TABLE TO Hannah;

/* =========================================================
   VERIFY USER CREATION
   ========================================================= */

SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS
WHERE USERNAME IN ('JOHN', 'HANNAH')
ORDER BY USERNAME;
/* =========================================================
   VERIFY USER PRIVILEGES

   This query confirms that each user has received the
   required Oracle system privileges.
   ========================================================= */

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE GRANTEE IN ('JOHN', 'HANNAH')
ORDER BY GRANTEE, PRIVILEGE;

