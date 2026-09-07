/* =========================================================
   INSY7213 PRACTICAL ASSIGNMENT 1
   QUESTION 4
   CHEETAH DELIVERIES

   STUDENT NUMBER: ST10440597
   ========================================================= */


/* =========================================================
   QUESTION 4.1

   Management requires a report displaying:
   - Driver first name
   - Driver surname
   - Driver code
   - Vehicle VIN number
   - Vehicle mileage

   Only vehicles with mileage below 80,000 must be shown.
   ========================================================= */
   SET SERVEROUTPUT ON;

/* =========================================================
   QUESTION 4.1 - DRIVER VEHICLE REPORT

   An explicit cursor retrieves the driver and vehicle
   information required by management.

   Only vehicles with mileage below 80,000 are selected.
   ========================================================= */

DECLARE

    /* Cursor used to retrieve the required driver and
       vehicle information. */
    CURSOR driver_vehicle_cursor IS
        SELECT
            d.FIRST_NAME,
            d.SURNAME,
            d.DRIVER_CODE,
            v.VIN_NUMBER,
            v.MILEAGE
        FROM DRIVER d
        JOIN DRIVER_DELIVERIES dd
            ON d.DRIVER_ID = dd.DRIVER_ID
        JOIN VEHICLE v
            ON dd.VIN_NUMBER = v.VIN_NUMBER
        WHERE v.MILEAGE < 80000;

    /* Variables used to store each record retrieved
       from the cursor. */
    v_first_name DRIVER.FIRST_NAME%TYPE;
    v_surname DRIVER.SURNAME%TYPE;
    v_driver_code DRIVER.DRIVER_CODE%TYPE;
    v_vin_number VEHICLE.VIN_NUMBER%TYPE;
    v_mileage VEHICLE.MILEAGE%TYPE;

BEGIN

    /* Open the cursor so that the records can be read. */
    OPEN driver_vehicle_cursor;

    LOOP

        /* Retrieve one record from the cursor. */
        FETCH driver_vehicle_cursor
        INTO
            v_first_name,
            v_surname,
            v_driver_code,
            v_vin_number,
            v_mileage;

        /* Stop the loop when no more records exist. */
        EXIT WHEN driver_vehicle_cursor%NOTFOUND;

        /* Display the report in a readable format. */
        DBMS_OUTPUT.PUT_LINE(
            '----------------------------------------'
        );

        DBMS_OUTPUT.PUT_LINE(
            'DRIVER: ' || v_first_name || ', ' || v_surname
        );

        DBMS_OUTPUT.PUT_LINE(
            'CODE: ' || v_driver_code
        );

        DBMS_OUTPUT.PUT_LINE(
            'VIN NUMBER: ' || v_vin_number
        );

        DBMS_OUTPUT.PUT_LINE(
            'MILEAGE: ' || v_mileage
        );

    END LOOP;

    /* Close the cursor after all records are processed. */
    CLOSE driver_vehicle_cursor;

END;
/