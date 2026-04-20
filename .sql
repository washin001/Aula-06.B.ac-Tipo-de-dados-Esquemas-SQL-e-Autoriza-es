-- =========================================
-- QUESTÃO 01
-- =========================================

-- VIEW sem salary
CREATE VIEW vw_instructor_basic AS
SELECT ID, name, dept_name
FROM instructor;

GRANT SELECT ON vw_instructor_basic TO User_B;

-- VIEW sem grade
CREATE VIEW vw_takes_basic AS
SELECT ID, course_id, sec_id, semester, year
FROM takes;

GRANT SELECT ON vw_takes_basic TO User_B;
GO


-- =========================================
-- QUESTÃO 02
-- =========================================

-- VIEW com atributos permitidos
CREATE VIEW vw_section_basic AS
SELECT course_id, sec_id, semester, year
FROM section;

GRANT SELECT, INSERT, UPDATE ON vw_section_basic TO User_C;
GO


-- =========================================
-- QUESTÃO 03
-- =========================================

GRANT SELECT ON instructor TO User_D;
GRANT SELECT ON student TO User_D;
GRANT SELECT ON grade_points TO User_D;
GO


-- =========================================
-- QUESTÃO 04
-- =========================================

-- VIEW com filtro por departamento
CREATE VIEW vw_student_filtered AS
SELECT *
FROM student
WHERE dept_name = 'Civil Eng.';

GRANT SELECT ON vw_student_filtered TO User_E;
GO


-- =========================================
-- QUESTÃO 05
-- =========================================

REVOKE SELECT ON vw_student_filtered FROM User_E;
GO


-- =========================================
-- QUESTÃO 06
-- =========================================

SELECT 
    dp.name AS usuario,
    dp2.permission_name AS permissao,
    dp2.state_desc AS tipo,
    OBJECT_NAME(dp2.major_id) AS objeto
FROM sys.database_permissions dp2
JOIN sys.database_principals dp 
    ON dp2.grantee_principal_id = dp.principal_id
WHERE dp.name IN ('User_A', 'User_B', 'User_C', 'User_D', 'User_E');
GO
