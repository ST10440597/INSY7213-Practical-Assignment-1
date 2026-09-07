/* Hannah tests her INSERT ANY TABLE privilege.

   A temporary customer is inserted only to demonstrate
   that the privilege works. The transaction is rolled
   back afterwards so the assignment data is not changed.
*/

INSERT INTO STUDENT.CUSTOMERS
(
    CUSTOMER_ID,
    FIRST_NAME,
    SURNAME,
    ADDRESS,
    PHONE_NUM,
    EMAIL
)
VALUES
(
    99999,
    'Test',
    'Customer',
    'Test Address',
    '0000000000',
    'test@example.com'
);
/* Remove the temporary test transaction so that the
   original Cheetah Deliveries data remains unchanged. */

ROLLBACK;