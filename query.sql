-- Use your project database
CREATE DATABASE job_portal;
USE job_portal;
-- 1. Companies Table
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    company_size int,
    state VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    zip_code VARCHAR(20),
    address TEXT,
    url VARCHAR(255)
);

-- 2. Company Industries
CREATE TABLE company_industries (
    company_id INT,
    industry VARCHAR(255),
    PRIMARY KEY (company_id, industry),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- 3. Company Specialities
CREATE TABLE company_specialities (
    company_id INT,
    speciality VARCHAR(255),
    PRIMARY KEY (company_id, speciality),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- 4. Employee Counts (time-series data)
CREATE TABLE employee_counts (
    company_id INT,
    employee_count INT,
    follower_count INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- 5. Industries Master
CREATE TABLE industries (
    industry_id INT PRIMARY KEY,
    industry_name VARCHAR(255)
);

-- 6. Skills Master
CREATE TABLE skills (
    skill_abr VARCHAR(50) PRIMARY KEY,
    skill_name VARCHAR(255)
);

CREATE TABLE benefits (
    job_id INT,
    inferred TINYINT,
    typen VARCHAR(255),
    PRIMARY KEY (job_id, typen)
);
ALTER TABLE benefits 
MODIFY job_id BIGINT;

CREATE TABLE job_skills (
    job_id INT,
    skill_abr VARCHAR(50),
    PRIMARY KEY (job_id, skill_abr),
    FOREIGN KEY (skill_abr) REFERENCES skills(skill_abr)
);
ALTER TABLE job_skills 
MODIFY job_id BIGINT;

CREATE TABLE job_industries (
    job_id INT,
    industry_id INT,
    PRIMARY KEY (job_id, industry_id),
    FOREIGN KEY (industry_id) REFERENCES industries(industry_id)
);
ALTER TABLE job_industries 
MODIFY job_id BIGINT;

CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    job_id INT,
    min_salary DECIMAL(15,2),
    med_salary DECIMAL(15,2),
    max_salary DECIMAL(15,2),
    pay_period VARCHAR(50),
    currency VARCHAR(10),
    compensation_type VARCHAR(50)
);
ALTER TABLE salaries
MODIFY job_id BIGINT;
ALTER TABLE salaries
MODIFY COLUMN min_salary VARCHAR(50),
MODIFY COLUMN med_salary VARCHAR(50),
MODIFY COLUMN max_salary VARCHAR(50);
ALTER TABLE salaries
MODIFY salary_id BIGINT;
