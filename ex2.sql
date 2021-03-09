--CREATING A FUNCTION WITH ARGUMENTS
CREATE OR REPLACE FUNCTION get_cust_info(IN l_bound int, IN u_bound int)
--WHICH RETURNS A SET OF ROW OF TYPE CUSTOMER
RETURNS SETOF customer AS $$

BEGIN 
--CHECK FOR RESTRICTIONS
IF l_bound > 600 or u_bound > 600 THEN
  RAISE EXCEPTION 'IDs have to be less or equal to 600';
ELSIF l_bound < 0 or u_bound < 0 THEN
  RAISE EXCEPTION 'IDs have greater or equal to 1';
END IF;

--RETURN TABLE WITH SELCETED ADDRESS_ID CUSTOMERS
RETURN QUERY SELECT * FROM customer WHERE customer.address_id>=l_bound AND customer.address_id<=u_bound;
--END FUCNTION
END; $$

LANGUAGE plpgsql;
--TEST
SELECT get_cust_info(100, 410);
