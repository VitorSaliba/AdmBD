-- Usando o schema da loja informatica
-- apague todos usuarios menos:
/*mysql.infoschema
mysql.session
mysql.sys
root
*/
# crie 5 roles.
# Role 1
#   apenas select no schema
# Role 2
#   apenas insert em clientes e create e drop

# Role 3
#   apenas select no vendas

# Role 4
# apenas select,insert,update e delete no schema
# Role 5
#   apenas upadate em vendas
# Crie 10 usuarios
# aplique os roles aos usuario como quiser
# revogue os privilegios de select do role1 e insira create e drop 

CREATE USER 'Michael'@'localhost' IDENTIFIED BY '123',
			'Lincoln'@'localhost' IDENTIFIED BY '123', 
			'Theodore'@'localhost' IDENTIFIED BY '123',
            'Sara'@'localhost' IDENTIFIED BY '123',
            'Mahone'@'localhost' IDENTIFIED BY '123',
            'Sucre'@'localhost' IDENTIFIED BY '123',
            'John'@'localhost' IDENTIFIED BY '123',
            'Cooper'@'localhost' IDENTIFIED BY '123',
            'Lechero'@'localhost' IDENTIFIED BY '123',
            'Bellick'@'localhost' IDENTIFIED BY '123';
            
CREATE ROLE 'role1'@'localhost',
			'role2'@'localhost', 
			'role3'@'localhost',
            'role4'@'localhost',
            'role5'@'localhost';
            
GRANT 
	INSERT, CREATE, DROP
    ON lojainformatica2.clientes
    TO 'role1'@'localhost';
SHOW GRANTS FOR 'role1'@'localhost';

GRANT 
	SELECT
    ON lojainformatica2.enderecos
    TO 'role2'@'localhost';
SHOW GRANTS FOR 'role2'@'localhost';

GRANT 
	SELECT
    ON lojainformatica2.vendas
    TO 'role3'@'localhost';
SHOW GRANTS FOR 'role3'@'localhost';

GRANT 
	SELECT, INSERT, UPDATE, DELETE
    ON lojainformatica2.*
    TO 'role4'@'localhost';
SHOW GRANTS FOR 'role4'@'localhost';

GRANT 
	UPDATE
    ON lojainformatica2.vendas
    TO 'role5'@'localhost';
SHOW GRANTS FOR 'role5'@'localhost';

GRANT 'role1'@'localhost' TO 'Michael'@'localhost';
SET DEFAULT ROLE 'role1'@'localhost' TO 'Michael'@'localhost';

GRANT 'role1'@'localhost' TO 'Bellick'@'localhost';
SET DEFAULT ROLE 'role1'@'localhost' TO 'Bellick'@'localhost';

GRANT 'role2'@'localhost' TO 'Lincoln'@'localhost';
SET DEFAULT ROLE 'role2'@'localhost' TO 'Lincoln'@'localhost';

GRANT 'role2'@'localhost' TO 'Lechero'@'localhost';
SET DEFAULT ROLE 'role2'@'localhost' TO 'Lechero'@'localhost';

GRANT 'role3'@'localhost' TO 'Theodore'@'localhost';
SET DEFAULT ROLE 'role3'@'localhost' TO 'Theodore'@'localhost';

GRANT 'role3'@'localhost' TO 'Cooper'@'localhost';
SET DEFAULT ROLE 'role3'@'localhost' TO 'Cooper'@'localhost';

GRANT 'role4'@'localhost' TO 'Sara'@'localhost';
SET DEFAULT ROLE 'role4'@'localhost' TO 'Sara'@'localhost';

GRANT 'role4'@'localhost' TO 'John'@'localhost';
SET DEFAULT ROLE 'role4'@'localhost' TO 'John'@'localhost';

GRANT 'role5'@'localhost' TO 'Mahone'@'localhost';
SET DEFAULT ROLE 'role5'@'localhost' TO 'Mahone'@'localhost';

GRANT 'role5'@'localhost' TO 'Sucre'@'localhost';
SET DEFAULT ROLE 'role5'@'localhost' TO 'Sucre'@'localhost';

CREATE USER 'admin'@'%' IDENTIFIED BY '123456';

GRANT 
	'role1'@'localhost',
    'role2'@'localhost',
    'role3'@'localhost',
    'role4'@'localhost',
    'role5'@'localhost' 
TO 'admin'@'%';

SET DEFAULT ROLE 'role1'@'localhost' TO 'admin'@'%';
SHOW GRANTS FOR 'admin'@'%';








