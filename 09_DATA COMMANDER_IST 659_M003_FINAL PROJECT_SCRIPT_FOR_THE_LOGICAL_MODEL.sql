USE job_portal_mgmt
--------------------------------------------------------------------------------------------
/*DOWN SCRIPTS*/
--------------------------------------------------------------------------------------------
/*DOWN SCRIPTS FOR ALL THE CONSTRAINTS*/
--Down script for the cities lookup and state id constraint foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_cities_lookup_state_id')
	ALTER TABLE reference.cities_lookup
		DROP CONSTRAINT fk_cities_lookup_state_id
GO

--Down script for the pincode lookup and city id constraint foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_pincode_lookup_city_id')
	ALTER TABLE reference.pincode_lookup
		DROP CONSTRAINT fk_pincode_lookup_city_id
GO

--------------------------------------------------------------------------------------------
--Down script for the login details and usertype constraint foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_login_details_login_usertype')
	ALTER TABLE access.login_details
		DROP CONSTRAINT fk_login_details_login_usertype
GO

--Down script for the applicants and login details foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicants_applicant_email')
	ALTER TABLE jobseeker.applicants
		DROP CONSTRAINT fk_applicants_applicant_email
GO

--Down Script for applicant additional documents and applicants foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_additional_documents_applicant_id')
	ALTER TABLE jobseeker.applicant_additional_documents
		DROP CONSTRAINT fk_applicant_additional_documents_applicant_id
GO

--Down Script for applicant skills and applicants foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_skills_applicant_id')
	ALTER TABLE jobseeker.applicant_skills
		DROP CONSTRAINT fk_applicant_skills_applicant_id
GO

--Down Script for applicant skills and skills lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_skills_skill_id')
	ALTER TABLE jobseeker.applicant_skills
		DROP CONSTRAINT fk_applicant_skills_skill_id
GO

--Down Script for applicant cover letters and applicants foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_cover_letters_applicant_id')
	ALTER TABLE jobseeker.applicant_cover_letters
		DROP CONSTRAINT fk_applicant_cover_letters_applicant_id
GO

--Down Script for applicant resumes and applicants foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_resumes_applicant_id')
	ALTER TABLE jobseeker.applicant_resumes
		DROP CONSTRAINT fk_applicant_resumes_applicant_id
GO

--Down Script for applicant experiences and applicants foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_experiences_applicant_id')
	ALTER TABLE jobseeker.applicant_experiences
		DROP CONSTRAINT fk_applicant_experiences_applicant_id
GO

--Down Script for applicant education and applicants foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_education_applicant_id')
	ALTER TABLE jobseeker.applicant_education
		DROP CONSTRAINT fk_applicant_education_applicant_id
GO

--Down Script for applicant education and degree type lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_education_degree_type_id')
	ALTER TABLE jobseeker.applicant_education
		DROP CONSTRAINT fk_applicant_education_degree_type_id
GO

--Down Script for applicant education and course lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_education_course_id')
	ALTER TABLE jobseeker.applicant_education
		DROP CONSTRAINT fk_applicant_education_course_id
GO

--Down Script for applicant address and applicants foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_address_applicant_id')
	ALTER TABLE jobseeker.applicant_address
		DROP CONSTRAINT fk_applicant_address_applicant_id
GO

--Down Script for applicant address and state lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_address_applicant_state_id')
	ALTER TABLE jobseeker.applicant_address
		DROP CONSTRAINT fk_applicant_address_applicant_state_id
GO

--Down Script for applicant address and city lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_address_applicant_city_id')
	ALTER TABLE jobseeker.applicant_address
		DROP CONSTRAINT fk_applicant_address_applicant_city_id
GO

--Down Script for applicant address and pincode lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_applicant_address_applicant_pincode_id')
	ALTER TABLE jobseeker.applicant_address
		DROP CONSTRAINT fk_applicant_address_applicant_pincode_id
GO

--Down Script for employers and login details key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_employers_employer_email')
	ALTER TABLE recruiter.employers
		DROP CONSTRAINT fk_employers_employer_email
GO

--Down Script for employer address and employers foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_employer_address_employer_id')
	ALTER TABLE recruiter.employer_address
		DROP CONSTRAINT fk_employer_address_employer_id
GO

--Down Script for employer address and state lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_employer_address_company_state_id')
	ALTER TABLE recruiter.employer_address
		DROP CONSTRAINT fk_employer_address_company_state_id
GO

--Down Script for employer address and city lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_employer_address_company_city_id')
	ALTER TABLE recruiter.employer_address
		DROP CONSTRAINT fk_employer_address_company_city_id
GO

--Down Script for employer address and pincode lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_employer_address_company_pincode_id')
	ALTER TABLE recruiter.employer_address
		DROP CONSTRAINT fk_employer_address_company_pincode_id
GO

--Down Script for jobs and employers lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_jobs_employer_id')
	ALTER TABLE jobapps.jobs
		DROP CONSTRAINT fk_jobs_employer_id
GO

--Down Script for job skills and skills lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_job_skills_skill_id')
	ALTER TABLE jobapps.job_skills
		DROP CONSTRAINT fk_job_skills_skill_id
GO

--Down Script for job skills and jobs foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_job_skills_job_id')
	ALTER TABLE jobapps.job_skills
		DROP CONSTRAINT fk_job_skills_job_id
GO

--Down Script for job qualifications and degree type lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_job_qualifications_degree_type_id')
	ALTER TABLE jobapps.job_qualifications
		DROP CONSTRAINT fk_job_qualifications_degree_type_id
GO

--Down Script for job qualifications and course lookup foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_job_qualifications_course_id')
	ALTER TABLE jobapps.job_qualifications
		DROP CONSTRAINT fk_job_qualifications_course_id
GO

--Down Script for job qualifications and jobs foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_job_qualifications_job_id')
	ALTER TABLE jobapps.job_qualifications
		DROP CONSTRAINT fk_job_qualifications_job_id
GO

--Down Script for job applications and applicants foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_job_applications_applicant_id')
	ALTER TABLE jobapps.job_applications
		DROP CONSTRAINT fk_job_applications_applicant_id
GO

--Down Script for job applications and jobs foreign key constraint
IF EXISTS (SELECT *
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE
		CONSTRAINT_NAME = 'fk_job_applications_job_id')
	ALTER TABLE jobapps.job_applications
		DROP CONSTRAINT fk_job_applications_job_id
GO
--------------------------------------------------------------------------------------------
/*DOWN SCRIPTS FOR ALL THE LOOKUP TABLES*/
--Down script for usertype_lookup table
DROP TABLE IF EXISTS reference.usertype_lookup
GO

--Down script for skills_lookup table
DROP TABLE IF EXISTS reference.skills_lookup
GO

--Down script for skills_lookup table
DROP TABLE IF EXISTS reference.degree_type_lookup
GO

--Down script for course_lookup table
DROP TABLE IF EXISTS reference.course_lookup
GO

--Down script for states_lookup table
DROP TABLE IF EXISTS reference.states_lookup
GO

--Down script for cities_lookup table
DROP TABLE IF EXISTS reference.cities_lookup
GO

--Down script for pincode_lookup table
DROP TABLE IF EXISTS reference.pincode_lookup
GO
--------------------------------------------------------------------------------------------
/*DOWN SCRIPTS FOR ALL THE TABLES*/
--Down script for login_details table
DROP TABLE IF EXISTS access.login_details
GO

--Down script for applicants table
DROP TABLE IF EXISTS jobseeker.applicants
GO

--Down script for applicant additional documents table
DROP TABLE IF EXISTS jobseeker.applicant_additional_documents
GO

--Down script script for applicant skills table
DROP TABLE IF EXISTS jobseeker.applicant_skills
GO

--Down script script for applicant cover letters table
DROP TABLE IF EXISTS jobseeker.applicant_cover_letters
GO

--Down script script for applicant resumes table
DROP TABLE IF EXISTS jobseeker.applicant_resumes
GO

--Down script script for applicant experiences table
DROP TABLE IF EXISTS jobseeker.applicant_experiences
GO

--Down script script for applicant education table
DROP TABLE IF EXISTS jobseeker.applicant_education
GO

--Down script script for applicant education table
DROP TABLE IF EXISTS jobseeker.applicant_address
GO

--Down script script for employers table
DROP TABLE IF EXISTS recruiter.employers
GO

--Down script for employer address table
DROP TABLE IF EXISTS recruiter.employer_address
GO

--Down script for jobs table
DROP TABLE IF EXISTS jobapps.jobs
GO

--Down script for job skills table
DROP TABLE IF EXISTS jobapps.job_skills
GO

--Down script for job qualifications table
DROP TABLE IF EXISTS jobapps.job_qualifications
GO

--Down script for job applications table
DROP TABLE IF EXISTS jobapps.job_applications
GO
--------------------------------------------------------------------------------------------
/*DOWN SCRIPTS FOR ALL THE SCHEMAS*/
--Down script for schema access
DROP SCHEMA IF EXISTS access
GO

--Down script for jobseeker access
DROP SCHEMA IF EXISTS jobseeker
GO

--Down script for reference access
DROP SCHEMA IF EXISTS reference
GO

--Down script for recruiter access
DROP SCHEMA IF EXISTS recruiter
GO

--Down script for jobapps access
DROP SCHEMA IF EXISTS jobapps
GO
--------------------------------------------------------------------------------------------
/*CHANGING DATABASE, SO THAT JOB_PORTAL_MGMT CAN BE DROPPED*/
--De selecting the job_portal_mgmt database
--USE vbay;
GO
--------------------------------------------------------------------------------------------
/*DOWN SCRIPT FOR THE DATABASE*/
--Down script for job_portal_mgmt database
--DROP DATABASE IF EXISTS job_portal_mgmt
GO
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
/*UP SCRIPTS*/
--------------------------------------------------------------------------------------------
/*UP SCRIPT FOR THE DATABASE*/
--Up script for job_portal_mgmt database
--CREATE DATABASE job_portal_mgmt
GO
--------------------------------------------------------------------------------------------
/*SELECTING THE JOB_PORTAL MGMT DATABASE TO CREATE TABLE AND CONSTRAINTS IN IT*/
--Using the created job_portal_mgmt database
--USE job_portal_mgmt
GO
--------------------------------------------------------------------------------------------
/*UP SCRIPTS FOR ALL THE SCHEMAS*/
--Up script for schema access
CREATE SCHEMA access
GO

--Up script for jobseeker access
CREATE SCHEMA jobseeker
GO

--Up script for reference access
CREATE SCHEMA reference
GO

--Up script for recruiter access
CREATE SCHEMA recruiter
GO

--Up script for jobapps access
CREATE SCHEMA jobapps
GO
--------------------------------------------------------------------------------------------
/*UP SCRIPTS FOR ALL THE LOOKUP TABLES AND DATA INSERTION IN THESE TABLES*/
--Up Script for user type lookup table
CREATE TABLE reference.usertype_lookup(
	usertype_id INT IDENTITY NOT NULL,
	usertype_name NVARCHAR(10) NOT NULL,
	CONSTRAINT pk_usertype_lookup_usertype_id PRIMARY KEY(usertype_id),
	CONSTRAINT u_usertype_lookup_usertype_name UNIQUE(usertype_name)
)
GO

--Up Script for skills lookup table
CREATE TABLE reference.skills_lookup(
	skill_id INT IDENTITY NOT NULL,
	skill_name VARCHAR(60) NOT NULL,
	CONSTRAINT pk_skills_lookup_skill_id PRIMARY KEY(skill_id),
	CONSTRAINT u_skills_lookup_skill_name UNIQUE(skill_name)
)
GO

--Up Script for degree type lookup table
CREATE TABLE reference.degree_type_lookup(
	degree_type_id INT IDENTITY NOT NULL,
	degree_type VARCHAR(50) NOT NULL,
	CONSTRAINT pk_degree_type_lookup_degree_type_id PRIMARY KEY(degree_type_id),
	CONSTRAINT u_degree_type_lookup_degree_type UNIQUE(degree_type)
)
GO

--Up Script for course lookup table
CREATE TABLE reference.course_lookup(
	course_id INT IDENTITY NOT NULL,
	course_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_course_lookup_course_id PRIMARY KEY(course_id),
	CONSTRAINT u_course_lookup_course_name UNIQUE(course_name)
)
GO

--Up Script for states lookup table
CREATE TABLE reference.states_lookup(
	state_id INT IDENTITY NOT NULL,
	state_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_states_lookup_state_id PRIMARY KEY(state_id),
	CONSTRAINT u_states_lookup_state_name UNIQUE(state_name)
)
GO

--Up Script for cities lookup table
CREATE TABLE reference.cities_lookup(
	city_id INT IDENTITY NOT NULL,
	city_name VARCHAR(50) NOT NULL,
	state_id INT NOT NULL,
	CONSTRAINT pk_cities_lookup_city_id PRIMARY KEY(city_id),
	CONSTRAINT u_cities_lookup_city_name UNIQUE(city_name)
)
GO

--Up Script for cities lookup table
CREATE TABLE reference.pincode_lookup(
	pincode_id INT IDENTITY NOT NULL,
	pincode INT NOT NULL,
	city_id INT NOT NULL,
	CONSTRAINT pk_pincode_lookup_pincode_id PRIMARY KEY(pincode_id),
	CONSTRAINT u_pincode_lookup_pincode UNIQUE(pincode)
)
GO

--------------------------------------------------------------------------------------------
/*UP SCRIPTS FOR ALL THE TABLES*/
--Up Script for login_details table
CREATE TABLE access.login_details(
	login_id INT IDENTITY NOT NULL,
	login_username NVARCHAR(50) NOT NULL,
	login_password VARBINARY(500) NOT NULL,
	login_email NVARCHAR(200) NOT NULL,
	login_usertype NVARCHAR(10) NOT NULL,
	CONSTRAINT pk_login_details_login_id PRIMARY KEY(login_id),
	CONSTRAINT u_login_details_login_username UNIQUE(login_username),
	CONSTRAINT u_login_details_login_email UNIQUE(login_email)
)
GO

--Up script for applicants table
CREATE TABLE jobseeker.applicants(
	applicant_id INT IDENTITY NOT NULL,
	applicant_firstname NVARCHAR(50) NOT NULL,
	applicant_middlename NVARCHAR(50),
	applicant_lastname NVARCHAR(50) NOT NULL,
	applicant_email NVARCHAR(200) NOT NULL,
	applicant_phone BIGINT NOT NULL,
	applicant_alternate_phone BIGINT,
	applicant_date_of_birth DATE NOT NULL,
	applicant_age AS (DATEDIFF(yy, applicant_date_of_birth, GETDATE()) + 
		(CASE
			WHEN 
				DATEPART(MONTH, GETDATE()) - DATEPART(MONTH, applicant_date_of_birth) < 0 THEN -1 
			ELSE 
				0 
		END)
	),
	CONSTRAINT pk_applicants_applicant_id PRIMARY KEY(applicant_id),
	CONSTRAINT u_applicants_applicant_email UNIQUE(applicant_email),
	CONSTRAINT u_applicants_applicant_phone UNIQUE(applicant_phone),
	CONSTRAINT chk_applicants_applicant_phone CHECK(applicant_phone>999999999 AND applicant_phone<10000000000),
	CONSTRAINT chk_applicants_applicant_alternate_phone CHECK(applicant_phone>999999999 AND applicant_phone<=9999999999)
)
GO

--Up script for applicant additional documents table
CREATE TABLE jobseeker.applicant_additional_documents(
	document_id INT IDENTITY NOT NULL,
	document_name NVARCHAR(50) NOT NULL,
	document_type VARCHAR(5) NOT NULL,
	document_content VARBINARY(MAX) NOT NULL,
	applicant_id INT NOT NULL
	CONSTRAINT pk_applicant_additional_documents_document_id PRIMARY KEY(document_id),
	CONSTRAINT u_applicant_additional_documents_document_name_type UNIQUE(document_name, document_type)
)
GO

--Up script for applicant skills table
CREATE TABLE jobseeker.applicant_skills(
	applicant_skill_id INT IDENTITY NOT NULL,
	skill_id INT NOT NULL,
	applicant_id INT NOT NULL
	CONSTRAINT pk_applicant_skills_skill_applicant_id PRIMARY KEY(applicant_skill_id),
	CONSTRAINT u_applicant_skills_applicant_id_skill_id UNIQUE(skill_id, applicant_id)
)
GO

--Up script for applicant cover letters table
CREATE TABLE jobseeker.applicant_cover_letters(
	cover_letter_id INT IDENTITY NOT NULL,
	cover_letter_name NVARCHAR(50) NOT NULL,
	cover_letter_type VARCHAR(5) NOT NULL,
	cover_letter_content VARBINARY(MAX) NOT NULL,
	applicant_id INT NOT NULL
	CONSTRAINT pk_applicant_cover_letter_cover_letter_id PRIMARY KEY(cover_letter_id),
	CONSTRAINT u_applicant_cover_letters_cover_letter_name_type UNIQUE(cover_letter_name, cover_letter_type)
)
GO

--Up script for applicant resumes table
CREATE TABLE jobseeker.applicant_resumes(
	resume_id INT IDENTITY NOT NULL,
	resume_name NVARCHAR(50) NOT NULL,
	resume_type VARCHAR(5) NOT NULL,
	resume_content VARBINARY(MAX) NOT NULL,
	applicant_id INT NOT NULL
	CONSTRAINT pk_applicant_resumes_resume_id PRIMARY KEY(resume_id),
	CONSTRAINT u_applicant_resumes_resume_name_type UNIQUE(resume_name, resume_type),
	CONSTRAINT u_applicant_resumes_applicant_id UNIQUE(applicant_id)
)
GO

--Up script for applicant experiences table
CREATE TABLE jobseeker.applicant_experiences(
	experience_id INT IDENTITY NOT NULL,
	exp_company_job_title NVARCHAR(50) NOT NULL,
	exp_company_name NVARCHAR(50) NOT NULL,
	exp_company_joining_date DATE NOT NULL,
	exp_company_leaving_date DATE NOT NULL,
	exp_description NVARCHAR(MAX) NOT NULL,
	applicant_id INT NOT NULL,
	CONSTRAINT pk_applicant_experiences_experience_id PRIMARY KEY(experience_id),
	CONSTRAINT u_applicant_experiences_job_title_company_name UNIQUE(exp_company_job_title, exp_company_name)
)
GO

--Up script for applicant experiences table
CREATE TABLE jobseeker.applicant_education(
	education_id INT IDENTITY NOT NULL,
	degree_type_id INT NOT NULL,
	course_id INT NOT NULL,
	is_completed VARCHAR(3) NOT NULL,
	joining_date DATE NOT NULL,
	completion_date DATE,
	applicant_id INT NOT NULL,
	CONSTRAINT pk_applicant_education_education_id PRIMARY KEY(education_id),
	CONSTRAINT u_applicant_education_degree_course_id UNIQUE(degree_type_id, course_id),
	CONSTRAINT chk_applicant_education_is_completed CHECK(is_completed in ('Yes', 'No', 'In Progress'))
)
GO

--Up script for applicant address table
CREATE TABLE jobseeker.applicant_address(
	applicant_address_id INT IDENTITY NOT NULL,
	applicant_street_name VARCHAR(60) NOT NULL,
	applicant_apartment_no VARCHAR(15),
	applicant_state_id INT NOT NULL,
	applicant_city_id INT NOT NULL,
	applicant_pincode_id INT NOT NULL,
	applicant_id INT NOT NULL,
	CONSTRAINT pk_applicant_address_applicant_address_id PRIMARY KEY(applicant_address_id)
)

--Up script for employers table
CREATE TABLE recruiter.employers(
	employer_id INT IDENTITY NOT NULL,
	employer_firstname NVARCHAR(50) NOT NULL,
	employer_middlename NVARCHAR(50),
	employer_lastname NVARCHAR(50) NOT NULL,
	employer_company_name VARCHAR(50) NOT NULL,
	employer_designation VARCHAR(50) NOT NULL,
	employer_phone BIGINT NOT NULL,
	employer_email NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_employers_employer_id PRIMARY KEY(employer_id),
	CONSTRAINT u_employers_employer_company_name UNIQUE(employer_company_name),
	CONSTRAINT u_employers_employer_phone UNIQUE(employer_phone),
	CONSTRAINT u_employers_employer_email UNIQUE(employer_email),
	CONSTRAINT chk_employers_employer_phone CHECK(employer_phone>999999999 AND employer_phone<10000000000)
)
GO

--Up script for employer address table
CREATE TABLE recruiter.employer_address(
	company_address_id INT IDENTITY NOT NULL,
	company_street_name VARCHAR(60) NOT NULL,
	company_state_id INT NOT NULL,
	company_city_id INT NOT NULL,
	company_pincode_id INT NOT NULL,
	employer_id INT NOT NULL,
	CONSTRAINT pk_employer_address_company_address_id PRIMARY KEY(company_address_id),
	CONSTRAINT u_employer_address_employer_id UNIQUE(employer_id)
)
GO

--Up script for the jobs table
CREATE TABLE jobapps.jobs(
	job_id INT IDENTITY NOT NULL,
	job_position VARCHAR(100) NOT NULL,
	job_type VARCHAR(15) NOT NULL,
	job_description NVARCHAR(MAX) NOT NULL,
	job_pay_type VARCHAR(10) NOT NULL,
	job_base_pay INT NOT NULL,
	job_max_pay INT NOT NULL,
	job_posting_date DATE NOT NULL DEFAULT GETDATE(),
	job_deadline_date DATE NOT NULL,
	employer_id INT NOT NULL,
	CONSTRAINT pk_jobs_job_id PRIMARY KEY(job_id),
	CONSTRAINT u_jobs_job_position UNIQUE(job_position),
	CONSTRAINT chk_jobs_job_type CHECK(job_type in ('Technical', 'Non-Technical', 'Managerial')),
	CONSTRAINT chk_jobs_job_pay_type CHECK(job_pay_type in ('Hourly', 'Daily', 'Weekly', 'Monthly', 'Quarterly', 'Annually')),
	CONSTRAINT chk_jobs_job_base_pay CHECK(job_base_pay>15),
	CONSTRAINT chk_jobs_job_max_pay CHECK(job_max_pay>=job_base_pay+5),
	CONSTRAINT chk_jobs_job_deadline_date CHECK(job_deadline_date>job_posting_date)
)

--Up Script for job skills table
CREATE TABLE jobapps.job_skills(
	job_skill_id INT IDENTITY NOT NULL,
	skill_id INT NOT NULL,
	job_id INT NOT NULL,
	CONSTRAINT pk_job_skills_job_skill_id PRIMARY KEY(job_skill_id),
	CONSTRAINT u_job_skills_skill_id_job_id UNIQUE(skill_id, job_id)
)

--Up Script for job qualifications table
CREATE TABLE jobapps.job_qualifications(
	job_qualification_id INT IDENTITY NOT NULL,
	degree_type_id INT NOT NULL,
	course_id INT NOT NULL,
	job_id INT NOT NULL,
	CONSTRAINT pk_job_qualifications_job_qual_id PRIMARY KEY(job_qualification_id),
	CONSTRAINT u_job_qualifications_degree_course_job_id UNIQUE(degree_type_id, course_id, job_id)
)

--Up Script for the job applications table
CREATE TABLE jobapps.job_applications(
	job_application_id INT IDENTITY NOT NULL,
	applicant_id INT NOT NULL,
	job_id INT NOT NULL,
	job_application_status VARCHAR(12) DEFAULT 'RECEIVED',
	CONSTRAINT job_applications_job_application_id PRIMARY KEY(job_application_id),
	CONSTRAINT job_applications_applicant_job_id UNIQUE(applicant_id, job_id),
	CONSTRAINT job_application_status CHECK(job_application_status in ('RECEIVED','REVIEWED', 'ACCEPTED', 'REJECTED'))
)

--------------------------------------------------------------------------------------------
/*UP SCRIPTS FOR ALL THE CONSTRAINTS*/
--Up script for the cities lookup and states lookup foreign key constraint
ALTER TABLE reference.cities_lookup
	ADD CONSTRAINT fk_cities_lookup_state_id
		FOREIGN KEY(state_id)
		REFERENCES reference.states_lookup(state_id) 
GO

--Up script for the pincode lookup and cities lookup foreign key constraint
ALTER TABLE reference.pincode_lookup
	ADD CONSTRAINT fk_pincode_lookup_city_id
		FOREIGN KEY(city_id)
		REFERENCES reference.cities_lookup(city_id) 
GO

--------------------------------------------------------------------------------------------
--Up script for the login details and user type lookup foreign key constraint
ALTER TABLE access.login_details
	ADD CONSTRAINT fk_login_details_login_usertype
		FOREIGN KEY(login_usertype)
		REFERENCES reference.usertype_lookup(usertype_name) 
GO

--Up script for the applicants and login details foreign key constraint
ALTER TABLE jobseeker.applicants
	ADD CONSTRAINT fk_applicants_applicant_email
		FOREIGN KEY(applicant_email)
		REFERENCES access.login_details(login_email) ON DELETE CASCADE
GO

--Up Script for applicant additional documents and applicants foreign key constraint
ALTER TABLE jobseeker.applicant_additional_documents
	ADD CONSTRAINT fk_applicant_additional_documents_applicant_id
		FOREIGN KEY(applicant_id)
		REFERENCES jobseeker.applicants(applicant_id) ON DELETE CASCADE
GO

--Up Script for applicant skills and applicants foreign key constraint
ALTER TABLE jobseeker.applicant_skills
	ADD CONSTRAINT fk_applicant_skills_applicant_id
		FOREIGN KEY(applicant_id)
		REFERENCES jobseeker.applicants(applicant_id) ON DELETE CASCADE
GO

--Up Script for applicant skills and skills lookup foreign key constraint
ALTER TABLE jobseeker.applicant_skills
	ADD CONSTRAINT fk_applicant_skills_skill_id
		FOREIGN KEY(skill_id)
		REFERENCES reference.skills_lookup(skill_id)
GO

--Up Script for applicant cover letters and applicants foreign key constraint
ALTER TABLE jobseeker.applicant_cover_letters
	ADD CONSTRAINT fk_applicant_cover_letters_applicant_id
		FOREIGN KEY(applicant_id)
		REFERENCES jobseeker.applicants(applicant_id) ON DELETE CASCADE
GO

--Up Script for applicant resumes and applicants foreign key constraint
ALTER TABLE jobseeker.applicant_resumes
	ADD CONSTRAINT fk_applicant_resumes_applicant_id
		FOREIGN KEY(applicant_id)
		REFERENCES jobseeker.applicants(applicant_id) ON DELETE CASCADE
GO

--Up Script for applicant experiences and applicants foreign key constraint
ALTER TABLE jobseeker.applicant_experiences
	ADD CONSTRAINT fk_applicant_experiences_applicant_id
		FOREIGN KEY(applicant_id)
		REFERENCES jobseeker.applicants(applicant_id) ON DELETE CASCADE
GO

--Up Script for applicant education and applicants foreign key constraint
ALTER TABLE jobseeker.applicant_education
	ADD CONSTRAINT fk_applicant_education_applicant_id
		FOREIGN KEY(applicant_id)
		REFERENCES jobseeker.applicants(applicant_id) ON DELETE CASCADE
GO

--Up Script for applicant education and degree type lookup foreign key constraint
ALTER TABLE jobseeker.applicant_education
	ADD CONSTRAINT fk_applicant_education_degree_type_id
		FOREIGN KEY(degree_type_id)
		REFERENCES reference.degree_type_lookup(degree_type_id) ON DELETE CASCADE
GO

--Up Script for applicant education and course lookup foreign key constraint
ALTER TABLE jobseeker.applicant_education
	ADD CONSTRAINT fk_applicant_education_course_id
		FOREIGN KEY(course_id)
		REFERENCES reference.course_lookup(course_id) ON DELETE CASCADE
GO

--Up Script for applicant address and applicants foreign key constraint
ALTER TABLE jobseeker.applicant_address
	ADD CONSTRAINT fk_applicant_address_applicant_id
		FOREIGN KEY(applicant_id)
		REFERENCES jobseeker.applicants(applicant_id) ON DELETE CASCADE
GO

--Up Script for applicant address and states lookup key constraint
ALTER TABLE jobseeker.applicant_address
	ADD CONSTRAINT fk_applicant_address_applicant_state_id
		FOREIGN KEY(applicant_state_id)
		REFERENCES reference.states_lookup(state_id)
GO

--Up Script for applicant address and cities lookup foreign key constraint
ALTER TABLE jobseeker.applicant_address
	ADD CONSTRAINT fk_applicant_address_applicant_city_id
		FOREIGN KEY(applicant_city_id)
		REFERENCES reference.cities_lookup(city_id)
GO

--Up Script for applicant address and pincode lookup key constraint
ALTER TABLE jobseeker.applicant_address
	ADD CONSTRAINT fk_applicant_address_applicant_pincode_id
		FOREIGN KEY(applicant_pincode_id)
		REFERENCES reference.pincode_lookup(pincode_id)
GO

--Up Script for employers and login details key constraint
ALTER TABLE recruiter.employers
	ADD CONSTRAINT fk_employers_employer_email
		FOREIGN KEY(employer_email)
		REFERENCES access.login_details(login_email)
GO

--Up Script for applicant address and applicants foreign key constraint
ALTER TABLE recruiter.employer_address
	ADD CONSTRAINT fk_employer_address_employer_id
		FOREIGN KEY(employer_id)
		REFERENCES recruiter.employers (employer_id) ON DELETE CASCADE
GO

--Up Script for employer address and states lookup key constraint
ALTER TABLE recruiter.employer_address
	ADD CONSTRAINT fk_employer_address_company_state_id
		FOREIGN KEY(company_state_id)
		REFERENCES reference.states_lookup(state_id)
GO

--Up Script for employer address and cities lookup foreign key constraint
ALTER TABLE recruiter.employer_address
	ADD CONSTRAINT fk_employer_address_company_city_id
		FOREIGN KEY(company_city_id)
		REFERENCES reference.cities_lookup(city_id)
GO

--Up Script for employer address and pincode lookup foreign key constraint
ALTER TABLE recruiter.employer_address
	ADD CONSTRAINT fk_employer_address_company_pincode_id
		FOREIGN KEY(company_pincode_id)
		REFERENCES reference.pincode_lookup(pincode_id)
GO

--Up Script for jobs and employers foreign key constraint
ALTER TABLE jobapps.jobs
	ADD CONSTRAINT fk_jobs_employer_id
		FOREIGN KEY(employer_id)
		REFERENCES recruiter.employers(employer_id) ON DELETE CASCADE
GO

--Up Script for job skills and skills lookup foreign key constraint
ALTER TABLE jobapps.job_skills
	ADD CONSTRAINT fk_job_skills_skill_id
		FOREIGN KEY(skill_id)
		REFERENCES reference.skills_lookup(skill_id)
GO

--Up Script for job skills and jobs foreign key constraint
ALTER TABLE jobapps.job_skills
	ADD CONSTRAINT fk_job_skills_job_id
		FOREIGN KEY(job_id)
		REFERENCES jobapps.jobs(job_id) ON DELETE CASCADE
GO

--Up Script for job qualifications and degree type lookup foreign key constraint
ALTER TABLE jobapps.job_qualifications
	ADD CONSTRAINT fk_job_qualifications_degree_type_id
		FOREIGN KEY(degree_type_id)
		REFERENCES reference.degree_type_lookup(degree_type_id)
GO

--Up Script for job qualifications and course lookup foreign key constraint
ALTER TABLE jobapps.job_qualifications
	ADD CONSTRAINT fk_job_qualifications_course_id
		FOREIGN KEY(course_id)
		REFERENCES reference.course_lookup(course_id)
GO

--Up Script for job qualifications and jobs foreign key constraint
ALTER TABLE jobapps.job_qualifications
	ADD CONSTRAINT fk_job_qualifications_job_id
		FOREIGN KEY(job_id)
		REFERENCES jobapps.jobs(job_id) ON DELETE CASCADE
GO

--Up Script for job applications and applicants foreign key constraint
ALTER TABLE jobapps.job_applications
	ADD CONSTRAINT fk_job_applications_applicant_id
		FOREIGN KEY(applicant_id)
		REFERENCES jobseeker.applicants(applicant_id) ON DELETE CASCADE
GO

--Up Script for job applications and jobs foreign key constraint
ALTER TABLE jobapps.job_applications
	ADD CONSTRAINT fk_job_applications_job_id
		FOREIGN KEY(job_id)
		REFERENCES jobapps.jobs(job_id) ON DELETE CASCADE
GO
--------------------------------------------------------------------------------------------