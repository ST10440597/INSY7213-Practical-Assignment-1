/* =========================================================
   INSY7213 PRACTICAL ASSIGNMENT 1
   QUESTION 2
   CHEETAH DELIVERIES DATABASE

   STUDENT NUMBER: ST10440597
   ========================================================= */


/* =========================================================
   ASSUMPTION

   The DRIVER_DELIVERIES table uses the attribute
   DELIVERY_ITEM_ID, while the DELIVERY_ITEMS table uses
   DELIVERY_ITEM as its primary key.

   It is therefore assumed that
   DRIVER_DELIVERIES.DELIVERY_ITEM_ID references
   DELIVERY_ITEMS.DELIVERY_ITEM because both fields
   represent the same delivery item identifier.
   ========================================================= */
   /* =========================================================
   CREATE CUSTOMERS TABLE

   CUSTOMER_ID is the primary key and uniquely identifies
   each customer.
   ========================================================= */

CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    ADDRESS VARCHAR2(100),
    PHONE_NUM VARCHAR2(20),
    EMAIL VARCHAR2(100)
);
/* =========================================================
   CREATE STAFF TABLE

   STAFF_ID is the primary key and uniquely identifies
   each staff member.
   ========================================================= */

CREATE TABLE STAFF (
    STAFF_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    POSITION VARCHAR2(50),
    PHONE_NUM VARCHAR2(20),
    ADDRESS VARCHAR2(100),
    EMAIL VARCHAR2(100)
);
/* =========================================================
   CREATE DRIVER TABLE

   DRIVER_ID is the primary key and uniquely identifies
   each Cheetah Deliveries driver.
   ========================================================= */

CREATE TABLE DRIVER (
    DRIVER_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    DRIVER_CODE VARCHAR2(10),
    PHONE_NUM VARCHAR2(20),
    ADDRESS VARCHAR2(100)
);
/* =========================================================
   CREATE VEHICLE TABLE

   VIN_NUMBER is used as the primary key because every
   vehicle has a unique Vehicle Identification Number.
   ========================================================= */

CREATE TABLE VEHICLE (
    VIN_NUMBER VARCHAR2(20) PRIMARY KEY,
    VEHICLE_TYPE VARCHAR2(50),
    MILEAGE NUMBER,
    COLOUR VARCHAR2(20),
    MANUFACTURER VARCHAR2(30)
);
/* =========================================================
   CREATE DELIVERY_ITEMS TABLE

   DELIVERY_ITEM uniquely identifies each delivery item.

   STAFF_ID is a foreign key linking the delivery item
   to the staff member who processed it.
   ========================================================= */

CREATE TABLE DELIVERY_ITEMS (
    DELIVERY_ITEM NUMBER PRIMARY KEY,
    DESCRIPTION VARCHAR2(100),
    STAFF_ID NUMBER,

    CONSTRAINT FK_DELIVERY_STAFF
        FOREIGN KEY (STAFF_ID)
        REFERENCES STAFF(STAFF_ID)
);
/* =========================================================
   CREATE BILLING TABLE

   BILL_ID uniquely identifies each billing record.

   CUSTOMER_ID links the billing record to CUSTOMERS.

   STAFF_ID links the billing record to STAFF.
   ========================================================= */

CREATE TABLE BILLING (
    BILL_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER,
    STAFF_ID NUMBER,
    BILL_DATE DATE,

    CONSTRAINT FK_BILL_CUSTOMER
        FOREIGN KEY (CUSTOMER_ID)
        REFERENCES CUSTOMERS(CUSTOMER_ID),

    CONSTRAINT FK_BILL_STAFF
        FOREIGN KEY (STAFF_ID)
        REFERENCES STAFF(STAFF_ID)
);
/* =========================================================
   CREATE DRIVER_DELIVERIES TABLE

   This table connects a driver, vehicle and delivery item.

   VIN_NUMBER references VEHICLE.
   DRIVER_ID references DRIVER.
   DELIVERY_ITEM_ID references DELIVERY_ITEMS.
   ========================================================= */

CREATE TABLE DRIVER_DELIVERIES (
    DRIVER_DELIVERY_ID NUMBER PRIMARY KEY,
    VIN_NUMBER VARCHAR2(20),
    DRIVER_ID NUMBER,
    DELIVERY_ITEM_ID NUMBER,

    CONSTRAINT FK_DD_VEHICLE
        FOREIGN KEY (VIN_NUMBER)
        REFERENCES VEHICLE(VIN_NUMBER),

    CONSTRAINT FK_DD_DRIVER
        FOREIGN KEY (DRIVER_ID)
        REFERENCES DRIVER(DRIVER_ID),

    CONSTRAINT FK_DD_ITEM
        FOREIGN KEY (DELIVERY_ITEM_ID)
        REFERENCES DELIVERY_ITEMS(DELIVERY_ITEM)
);
/* =========================================================
   INSERT CUSTOMER DATA

   The supplied customer flat-file records are imported
   into the CUSTOMERS relational table.
   ========================================================= */

INSERT INTO CUSTOMERS VALUES
(11011, 'Bob', 'Smith', '18 Water rd',
 '0877277521', 'bobs@isat.com');

INSERT INTO CUSTOMERS VALUES
(11012, 'Sam', 'Hendricks', '22 Water rd',
 '0863257857', 'shen@mcom.co.za');

INSERT INTO CUSTOMERS VALUES
(11013, 'Larry', 'Clark', '101 Summer lane',
 '0834567891', 'larc@mcom.co.za');

INSERT INTO CUSTOMERS VALUES
(11014, 'Jeff', 'Jones', '55 Mountain way',
 '0612547895', 'jj@isat.co.za');

INSERT INTO CUSTOMERS VALUES
(11015, 'Andre', 'Kerk', '5 Main rd',
 '0827238521', 'akerk@mcal.co.za');

INSERT INTO CUSTOMERS VALUES
(11016, 'Wayne', 'Smith', '13 Water rd',
 '0877277522', 'ws@isat.com');

INSERT INTO CUSTOMERS VALUES
(11017, 'John', 'Hendricks', '29 Water rd',
 '0863257851', 'jhen@mcom.co.za');

INSERT INTO CUSTOMERS VALUES
(11018, 'Sally', 'Clark', '111 Summer lane',
 '0834567892', 'sallyc@mcom.co.za');

INSERT INTO CUSTOMERS VALUES
(11019, 'Bridget', 'Bitterhour', '125 Mountain way',
 '0612547896', 'bb@isat.co.za');

INSERT INTO CUSTOMERS VALUES
(11111, 'Nicole', 'Kerk', '175 Main rd',
 '0827238529', 'nk@mcal.co.za');

INSERT INTO CUSTOMERS VALUES
(11112, 'Catherine', 'Smith', '19 Water rd',
 '0877277523', 'cath@isat.com');

INSERT INTO CUSTOMERS VALUES
(11113, 'Mel', 'Hendricks', '5 Water rd',
 '0863257852', 'melh@mcom.co.za');

INSERT INTO CUSTOMERS VALUES
(11114, 'Lucy', 'Du Plessis', '221 Summer lane',
 '0834567892', 'ldup@mcom.co.za');

INSERT INTO CUSTOMERS VALUES
(11116, 'Josh', 'Maverick', '155 Mountain way',
 '0612547897', 'joshm@isat.com');

INSERT INTO CUSTOMERS VALUES
(11117, 'Stuart', 'Jones', '35 Main rd',
 '0827238521', 'sjones@mcal.co.za');

COMMIT;


/* =========================================================
   INSERT STAFF DATA

   All ten supplied staff members are inserted into
   the STAFF table.
   ========================================================= */

INSERT INTO STAFF VALUES
(51011, 'Sally', 'Du Toit', 'Logistics',
 '0825698547', '18 Main rd', 'sdut@isat.com');

INSERT INTO STAFF VALUES
(51012, 'Mark', 'Wright', 'CRM',
 '0836984178', '12 Cape Way', 'mwright@isat.com');

INSERT INTO STAFF VALUES
(51013, 'Harry', 'Sheen', 'Logistics',
 '0725648965', '15 Water Street', 'hsheen@isat.com');

INSERT INTO STAFF VALUES
(51014, 'Jabu', 'Xolani', 'Logistics',
 '0823116598', '18 White Lane', 'jxo@isat.com');

INSERT INTO STAFF VALUES
(51015, 'Roberto', 'Henry', 'Packaging',
 '0783521451', '55 Cape Street', 'rhenry@isat.com');

INSERT INTO STAFF VALUES
(51016, 'Pat', 'Durant', 'Logistics',
 '0825698542', '1 Main rd', 'pd@isat.com');

INSERT INTO STAFF VALUES
(51017, 'Steve', 'Maritz', 'CRM',
 '0836984173', '2 Cape Way', 'sm@isat.com');

INSERT INTO STAFF VALUES
(51018, 'Maxwell', 'Dube', 'Logistics',
 '0725648964', '5 Water Street', 'max@isat.com');

INSERT INTO STAFF VALUES
(51019, 'Shane', 'Mane', 'Logistics',
 '0823116595', '8 White Lane', 'smane@isat.com');

INSERT INTO STAFF VALUES
(51111, 'Bob', 'Truth', 'Packaging',
 '0783521456', '35 Cape Street', 'btruth@isat.com');

COMMIT;
/* =========================================================
   INSERT DRIVER DATA
   ========================================================= */

INSERT INTO DRIVER VALUES
(81011, 'Buthelezi', 'Marshall', 'C1',
 '0725698547', '18 Leopard creek');

INSERT INTO DRIVER VALUES
(81012, 'Tina', 'Mtati', 'C',
 '0636984178', '12 Cape rd');

INSERT INTO DRIVER VALUES
(81013, 'Jono', 'Mvuyisi', 'EC1',
 '0725648965', '15 Circle lane');

INSERT INTO DRIVER VALUES
(81014, 'Richard', 'Smith', 'C1',
 '0623116598', '18 Beach rd');

INSERT INTO DRIVER VALUES
(81015, 'Brett', 'Smith', 'EB',
 '0883521457', '55 Summer lane');

COMMIT;
/* =========================================================
   INSERT VEHICLE DATA

   All twenty supplied vehicle records are imported.
   ========================================================= */

INSERT INTO VEHICLE VALUES
('1ZA55858541', 'Cutaway van chassis', 115352,
 'RED', 'MAN');

INSERT INTO VEHICLE VALUES
('1ZA51858542', 'Flatbed truck', 315856,
 'BLUE', 'ISUZU');

INSERT INTO VEHICLE VALUES
('1ZA35858543', 'Medium Standard Truck', 789587,
 'SILVER', 'MAN');

INSERT INTO VEHICLE VALUES
('1ZA15851545', 'Flatbed truck', 555050,
 'WHITE', 'TATA');

INSERT INTO VEHICLE VALUES
('1ZA35868540', 'Cutaway van chassis', 79058,
 'WHITE', 'ISUZU');

INSERT INTO VEHICLE VALUES
('1ZA65858541', 'Cutaway van chassis', 215352,
 'RED', 'MAN');

INSERT INTO VEHICLE VALUES
('1ZA61858542', 'Flatbed truck', 215856,
 'BLUE', 'ISUZU');

INSERT INTO VEHICLE VALUES
('1ZA65858543', 'Medium Standard Truck', 889587,
 'SILVER', 'MERC');

INSERT INTO VEHICLE VALUES
('1ZA65851545', 'Flatbed truck', 155050,
 'WHITE', 'MAN');

INSERT INTO VEHICLE VALUES
('1ZA65868540', 'Cutaway van chassis', 19058,
 'WHITE', 'ISUZU');

INSERT INTO VEHICLE VALUES
('1ZA75858541', 'Cutaway van chassis', 315352,
 'RED', 'MAN');

INSERT INTO VEHICLE VALUES
('1ZA71858542', 'Flatbed truck', 115856,
 'BLUE', 'ISUZU');

INSERT INTO VEHICLE VALUES
('1ZA75858543', 'Medium Standard Truck', 989587,
 'SILVER', 'MAN');

INSERT INTO VEHICLE VALUES
('1ZA17851545', 'Flatbed truck', 755050,
 'WHITE', 'TATA');

INSERT INTO VEHICLE VALUES
('1ZA75868540', 'Cutaway van chassis', 29058,
 'WHITE', 'ISUZU');

INSERT INTO VEHICLE VALUES
('1ZA85858541', 'Cutaway van chassis', 515352,
 'RED', 'MERC');

INSERT INTO VEHICLE VALUES
('1ZA81858542', 'Flatbed truck', 715856,
 'BLUE', 'ISUZU');

INSERT INTO VEHICLE VALUES
('1ZA85858543', 'Medium Standard Truck', 789587,
 'SILVER', 'MAN');

INSERT INTO VEHICLE VALUES
('1ZA85851545', 'Flatbed truck', 955050,
 'WHITE', 'TATA');

INSERT INTO VEHICLE VALUES
('1ZA85868540', 'Cutaway van chassis', 39058,
 'WHITE', 'MERC');

COMMIT;
/* =========================================================
   INSERT DELIVERY ITEM DATA
   ========================================================= */

INSERT INTO DELIVERY_ITEMS VALUES
(71011, 'House relocation', 51011);

INSERT INTO DELIVERY_ITEMS VALUES
(71012, 'Delivery of specialized consignments', 51017);

INSERT INTO DELIVERY_ITEMS VALUES
(71013, 'Delivery of specialized consignments', 51015);

INSERT INTO DELIVERY_ITEMS VALUES
(71014, 'Office relocation', 51012);

INSERT INTO DELIVERY_ITEMS VALUES
(71015, 'Delivery of specialized consignments', 51014);

COMMIT;
/* =========================================================
   INSERT BILLING DATA

   TO_DATE is used to explicitly convert the supplied
   text dates into Oracle DATE values.
   ========================================================= */

INSERT INTO BILLING VALUES
(800, 11011, 51011,
 TO_DATE('06-Sep-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(801, 11012, 51013,
 TO_DATE('07-Sep-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(802, 11014, 51015,
 TO_DATE('10-Nov-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(803, 11015, 51012,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(804, 11013, 51014,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(805, 11111, 51011,
 TO_DATE('06-Sep-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(806, 11012, 51013,
 TO_DATE('07-Sep-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(807, 11014, 51015,
 TO_DATE('10-Nov-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(808, 11015, 51012,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(809, 11113, 51018,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(810, 11011, 51011,
 TO_DATE('06-Sep-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(811, 11012, 51013,
 TO_DATE('07-Sep-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(812, 11014, 51016,
 TO_DATE('10-Nov-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(813, 11117, 51012,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(814, 11013, 51014,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(815, 11012, 51111,
 TO_DATE('06-Sep-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(816, 11012, 51019,
 TO_DATE('07-Sep-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(817, 11014, 51015,
 TO_DATE('10-Nov-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(818, 11112, 51012,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(819, 11013, 51014,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

INSERT INTO BILLING VALUES
(820, 11116, 51019,
 TO_DATE('09-Dec-22', 'DD-MON-RR'));

COMMIT;
/* =========================================================
   INSERT DRIVER DELIVERY DATA

   These records link the drivers, vehicles and delivery
   items that were used for each delivery.
   ========================================================= */

INSERT INTO DRIVER_DELIVERIES VALUES
(91011, '1ZA55858541', 81011, 71011);

INSERT INTO DRIVER_DELIVERIES VALUES
(91012, '1ZA35858543', 81012, 71013);

INSERT INTO DRIVER_DELIVERIES VALUES
(91013, '1ZA17851545', 81011, 71015);

INSERT INTO DRIVER_DELIVERIES VALUES
(91014, '1ZA35868540', 81013, 71015);

INSERT INTO DRIVER_DELIVERIES VALUES
(91015, '1ZA15851545', 81014, 71012);

COMMIT;
/* =========================================================
   VERIFY NUMBER OF RECORDS

   This query counts the records in every table to prove
   that the supplied flat-file values were successfully
   imported into the relational database.
   ========================================================= */

SELECT 'CUSTOMERS' AS TABLE_NAME,
       COUNT(*) AS TOTAL_RECORDS
FROM CUSTOMERS

UNION ALL

SELECT 'STAFF',
       COUNT(*)
FROM STAFF

UNION ALL

SELECT 'DRIVER',
       COUNT(*)
FROM DRIVER

UNION ALL

SELECT 'VEHICLE',
       COUNT(*)
FROM VEHICLE

UNION ALL

SELECT 'DELIVERY_ITEMS',
       COUNT(*)
FROM DELIVERY_ITEMS

UNION ALL

SELECT 'BILLING',
       COUNT(*)
FROM BILLING

UNION ALL

SELECT 'DRIVER_DELIVERIES',
       COUNT(*)
FROM DRIVER_DELIVERIES;



