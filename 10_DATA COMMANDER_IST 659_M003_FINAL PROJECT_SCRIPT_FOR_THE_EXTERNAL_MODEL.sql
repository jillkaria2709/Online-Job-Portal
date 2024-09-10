-- This part of the code drops the procedure if it already exists to avoid conflicts
DROP PROCEDURE IF EXISTS access.validateLoginApplicant
GO

-- This section creates a stored procedure named 'validateLoginApplicant'
CREATE PROCEDURE access.validateLoginApplicant
    @LoginId VARCHAR(50), -- Input parameter for Login ID
    @Password VARCHAR(50) -- Input parameter for Password
AS
BEGIN
    SET NOCOUNT ON; -- Prevents the count of the number of rows affected by a Transact-SQL statement from being returned

    -- Declaration of a variable to store validity (1 for valid, 0 for invalid)
    DECLARE @IsValid BIT;

    -- Checking the validity of the login credentials
    SELECT @IsValid = CASE WHEN COUNT(*) = 1 THEN 1 ELSE 0 END
    FROM 
        access.login_details
    WHERE
        login_username = @LoginId -- Matches the provided login ID
        AND 
        CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('ENCRYPTION_101', login_password)) =  @Password -- Decrypts and matches the provided password
        AND
        login_usertype = 'Applicant'; -- Validates against the user type 'Applicant'

    -- Returns the validity status (1 for valid, 0 for invalid)
    SELECT @IsValid AS IsValid;
END;
GO
-- This part of the code drops the procedure if it already exists to avoid conflicts
DROP PROCEDURE IF EXISTS access.validateLoginEmployee
GO

-- This section creates a stored procedure named 'validateLoginEmployee'
CREATE PROCEDURE access.validateLoginEmployee
    @LoginId VARCHAR(50), -- Input parameter for Login ID
    @Password VARCHAR(50) -- Input parameter for Password
AS
BEGIN
    SET NOCOUNT ON; -- Prevents the count of the number of rows affected by a Transact-SQL statement from being returned

    -- Declaration of a variable to store validity (1 for valid, 0 for invalid)
    DECLARE @IsValid BIT;

    -- Checking the validity of the login credentials
    SELECT @IsValid = CASE WHEN COUNT(*) = 1 THEN 1 ELSE 0 END
    FROM 
        access.login_details
    WHERE
        login_username = @LoginId -- Matches the provided login ID
        AND 
        CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('ENCRYPTION_101', login_password)) =  @Password -- Decrypts and matches the provided password
        AND
        login_usertype = 'Employer'; -- Validates against the user type 'Employer'

    -- Returns the validity status (1 for valid, 0 for invalid)
    SELECT @IsValid AS IsValid;
END;
-- This part of the code drops the procedure if it already exists to avoid conflicts
DROP PROCEDURE IF EXISTS access.fetch_Id_Email_App
GO

-- This section creates a stored procedure named 'fetch_Id_Email_App'
CREATE PROCEDURE access.fetch_Id_Email_App
    @LoginId VARCHAR(50), -- Input parameter for Login ID
    @Password VARCHAR(50) -- Input parameter for Password
AS
BEGIN
    SET NOCOUNT ON; -- Prevents the count of the number of rows affected by a Transact-SQL statement from being returned

    -- Declaration of variables to store applicant ID and email
    DECLARE @app_id INT;
    DECLARE @app_email NVARCHAR(200);

    -- Fetching applicant ID and email based on login details
    SELECT
        @app_id = applicant_id, -- Assigning the retrieved applicant ID to @app_id
        @app_email = login_email -- Assigning the retrieved applicant email to @app_email
    FROM 
        access.login_details -- Accessing the login details table
    INNER JOIN 
        jobseeker.applicants ON login_email = applicant_email -- Joining with the applicants table based on matching email addresses
    WHERE
        login_username = @LoginId -- Matches the provided login ID
        AND 
        CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('ENCRYPTION_101', login_password)) =  @Password; -- Decrypts and matches the provided password

    -- Returning the fetched applicant ID as 'appId' and email as 'appEmail'
    SELECT @app_id AS appId, @app_email AS appEmail;
END;
-- This part of the code drops the procedure if it already exists to avoid conflicts
DROP PROCEDURE IF EXISTS access.fetch_Id_Email_Emp
GO

-- This section creates a stored procedure named 'fetch_Id_Email_Emp'
CREATE PROCEDURE access.fetch_Id_Email_Emp
    @LoginId VARCHAR(50), -- Input parameter for Login ID
    @Password VARCHAR(50) -- Input parameter for Password
AS
BEGIN
    SET NOCOUNT ON; -- Prevents the count of the number of rows affected by a Transact-SQL statement from being returned

    -- Declaration of variables to store employer ID and email
    DECLARE @app_id INT;
    DECLARE @app_email NVARCHAR(200);

    -- Fetching employer ID and email based on login details
    SELECT
        @app_id = employer_id, -- Assigning the retrieved employer ID to @app_id
        @app_email = login_email -- Assigning the retrieved employer email to @app_email
    FROM 
        access.login_details -- Accessing the login details table
    INNER JOIN 
        recruiter.employers ON login_email = employer_email -- Joining with the employers table based on matching email addresses
    WHERE
        login_username = @LoginId -- Matches the provided login ID
        AND 
        CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('ENCRYPTION_101', login_password)) =  @Password; -- Decrypts and matches the provided password

    -- Returning the fetched employer ID as 'appId' and email as 'appEmail'
    SELECT @app_id AS appId, @app_email AS appEmail;
END;
GO
-- Execute the stored procedure 'fetch_Id_Email_App' with provided credentials 'Vedant123' and 'Vedant123'
exec access.fetch_Id_Email_App 'Vedant123', 'Vedant123';

-- Execute the stored procedure 'fetch_Id_Email_Emp' with provided credentials 'John123' and 'John123'
exec access.fetch_Id_Email_Emp 'John123', 'John123';

-- Drop the schema 'jobviews' if it already exists to avoid conflicts
DROP SCHEMA IF EXISTS jobviews
GO

-- Create a new schema named 'jobviews'
CREATE SCHEMA jobviews
GO

-- Drop the view 'applicants_applications' if it already exists
DROP VIEW IF EXISTS jobviews.applicants_applications
GO

-- Create a view named 'applicants_applications' within the 'jobviews' schema
CREATE VIEW jobviews.applicants_applications AS
WITH CompanyNameCTE AS (
    -- Common Table Expression (CTE) to retrieve company names and associated job IDs
    SELECT
        employer_company_name as company_name,
        job_id
    FROM
        recruiter.employers r INNER JOIN jobapps.jobs a
        ON r.employer_id = a.job_id 
)
-- Selecting specific columns and joining multiple tables to create the view
SELECT 
    a.applicant_id,
    o.job_id,
    job_position,
    job_type,
    job_application_status,
    company_name
FROM 
    jobapps.job_applications j INNER JOIN jobseeker.applicants a
    ON j.applicant_id = a.applicant_id
    INNER JOIN jobapps.jobs o
    ON j.job_id = o.job_id
    INNER JOIN CompanyNameCTE c
    ON j.job_id = c.job_id
GO
-- Drop the view 'applicant_addresses_view' if it already exists under the 'jobviews' schema
DROP VIEW IF EXISTS jobviews.applicant_addresses_view
GO

-- Create a new view named 'applicant_addresses_view' within the 'jobviews' schema
CREATE VIEW jobviews.applicant_addresses_view AS
SELECT 
    applicant_id,
    applicant_street_name,
    applicant_apartment_no,
    state_name,
    city_name,
    pincode
FROM 
    jobseeker.applicant_address a INNER JOIN reference.states_lookup s -- Selecting columns from the 'applicant_address' table in the 'jobseeker' schema
    INNER JOIN reference.states_lookup s ON a.applicant_state_id = s.state_id -- Joining with the 'states_lookup' table using state IDs
    INNER JOIN reference.cities_lookup c ON a.applicant_city_id = c.city_id -- Joining with the 'cities_lookup' table using city IDs
    INNER JOIN reference.pincode_lookup p ON a.applicant_city_id = p.pincode_id -- Joining with the 'pincode_lookup' table using pincode IDs
GO
-- Drop the view 'applicant_skills_view' if it already exists under the 'jobviews' schema
DROP VIEW IF EXISTS jobviews.applicant_skills_view
GO

-- Create a new view named 'applicant_skills_view' within the 'jobviews' schema
CREATE VIEW jobviews.applicant_skills_view AS
SELECT 
    applicant_id,
    skill_name
FROM 
    jobseeker.applicant_skills s -- Selecting columns from the 'applicant_skills' table in the 'jobseeker' schema
    INNER JOIN reference.skills_lookup k ON s.skill_id = k.skill_id -- Joining with the 'skills_lookup' table using skill IDs
GO

-- Drop the view 'applicant_complete_education_view' if it already exists under the 'jobviews' schema
DROP VIEW IF EXISTS jobviews.applicant_complete_education_view
GO

-- Create a new view named 'applicant_complete_education_view' within the 'jobviews' schema
CREATE VIEW jobviews.applicant_complete_education_view AS
SELECT 
    degree_type,
    course_name,
    is_completed,
    joining_date,
    completion_date,
    applicant_id
FROM 
    jobseeker.applicant_education e -- Selecting columns from the 'applicant_education' table in the 'jobseeker' schema
    INNER JOIN reference.degree_type_lookup d ON e.degree_type_id = d.degree_type_id -- Joining with the 'degree_type_lookup' table using degree type IDs
    INNER JOIN reference.course_lookup c ON e.degree_type_id = c.course_id -- Joining with the 'course_lookup' table using course IDs
GO