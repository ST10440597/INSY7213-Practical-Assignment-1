/* =========================================================
   INSY7213 PRACTICAL ASSIGNMENT 1
   QUESTION 6
   CHEETAH DELIVERIES

   STUDENT NUMBER: St10440597
   ========================================================= */
   /* =========================================================
   QUESTION 6.1 - IMPLICIT CURSOR ATTRIBUTE

   Oracle automatically creates an implicit cursor for
   the UPDATE statement below.

   SQL%ROWCOUNT is used to determine how many records
   were affected by the operation.
   ========================================================= */

SET SERVEROUTPUT ON;

BEGIN

    /* This UPDATE does not change the actual description.
       It is used safely to demonstrate SQL%ROWCOUNT. */

    UPDATE DELIVERY_ITEMS
    SET DESCRIPTION = DESCRIPTION
    WHERE DELIVERY_ITEM = 71011;

    /* SQL%ROWCOUNT reports how many rows were processed
       by the previous UPDATE statement. */

    DBMS_OUTPUT.PUT_LINE(
        'Number of delivery records processed: ' ||
        SQL%ROWCOUNT
    );

END;
/
/* =========================================================
   QUESTION 6.1 - EXPLICIT CURSOR ATTRIBUTE

   An explicit cursor is manually declared and controlled
   by the programmer.

   This cursor retrieves the delivery item records one
   at a time.

   %NOTFOUND determines when no more rows are available.
   %ROWCOUNT reports how many records have been fetched.
   ========================================================= */

SET SERVEROUTPUT ON;

DECLARE

    /* Declare the explicit cursor. */
    CURSOR delivery_cursor IS
        SELECT
            DELIVERY_ITEM,
            DESCRIPTION
        FROM DELIVERY_ITEMS
        ORDER BY DELIVERY_ITEM;

    /* Variables used to hold each fetched record. */
    v_delivery_item DELIVERY_ITEMS.DELIVERY_ITEM%TYPE;
    v_description DELIVERY_ITEMS.DESCRIPTION%TYPE;

BEGIN

    /* Open the cursor. */
    OPEN delivery_cursor;

    LOOP

        /* Retrieve one row from the cursor. */
        FETCH delivery_cursor
        INTO
            v_delivery_item,
            v_description;

        /* Exit when there are no more records. */
        EXIT WHEN delivery_cursor%NOTFOUND;

        /* Display the current delivery item. */
        DBMS_OUTPUT.PUT_LINE(
            'Delivery Item: ' ||
            v_delivery_item ||
            ' - ' ||
            v_description
        );

    END LOOP;

    /* Display how many records were fetched. */
    DBMS_OUTPUT.PUT_LINE(
        'Total delivery records processed: ' ||
        delivery_cursor%ROWCOUNT
    );

    /* Close the cursor after processing. */
    CLOSE delivery_cursor;

END;
/
/* =========================================================
   QUESTION 6.2 - SEQUENCE

   A sequence is used to automatically generate unique
   numeric values.

   The existing DRIVER_DELIVERY_ID values end at 91015,
   therefore the sequence starts at 91016.
   ========================================================= */

CREATE SEQUENCE DRIVER_DELIVERY_SEQ
START WITH 91016
INCREMENT BY 1
NOCACHE;

SELECT DRIVER_DELIVERY_SEQ.NEXTVAL AS NEXT_DRIVER_DELIVERY_ID
FROM DUAL;