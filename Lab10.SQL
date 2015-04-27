-- STORED PROCEDURE 1 --

CREATE OR REPLACE FUNCTION PreReqsFor(int, REFCURSOR) RETURNS refcursor AS 
	$BODY$
	DECLARE
	course      int       := $1;
	resultset   REFCURSOR := $2;
BEGIN
	open resultset FOR
		SELECT prereqnum
		FROM   prerequisites
		WHERE  courseNum = course;
	RETURN resultset;
END;
$BODY$ 
LANGUAGE plpgsql;

--TEST QUERY --

SELECT PreReqsFor(499, 'results');
FETCH ALL FROM results;


-- STORED PROCEDURE 2--

CREATE OR REPLACE FUNCTION IsPreReqFor(int, REFCURSOR) RETURNS refcursor AS 
$BODY$
  DECLARE
		prereq      int       := $1;
		resultset   REFCURSOR := $2;
	BEGIN

			open resultset FOR 
			SELECT coursenum
			FROM   prerequisites
			WHERE  prereqnum = prereq;
		RETURN resultset;
	END;
$BODY$ 
LANGUAGE plpgsql;


--TEST QUERY --

SELECT IsPreReqFor(120, 'results');
FETCH ALL FROM results;