/*
Exercicio sobre Roles
Crie dentro deste mesmo arquivo
Usando o lojaInformatica
5 usuarios locais com senha.
5 Roles diferentes usando qualquer nome.
Aplique 5 privilegios diferentes em cada role
cada usuario criado deve ter um role.
crie um usuario chamado Admin que tenha acesso 
a todos os roles criados.
*/

CREATE USER 'Vitor'@'localhost' IDENTIFIED BY '123',
			'Rafael'@'localhost' IDENTIFIED BY '123', 
			'Lucca'@'localhost' IDENTIFIED BY '123',
            'Guilherme'@'localhost' IDENTIFIED BY '123',
            'Thiago'@'localhost' IDENTIFIED BY '123';
            
CREATE ROLE 'r_clientes'@'localhost',
			'r_enderecos'@'localhost', 
			'r_itemsvendas'@'localhost',
            'r_produtos'@'localhost',
            'r_vendas'@'localhost';

GRANT 
	SELECT, INSERT, UPDATE, DELETE, ALTER
    ON lojainformatica2.clientes 
    TO 'r_clientes'@'localhost';
SHOW GRANTS FOR 'r_clientes'@'localhost';
    
GRANT 
	SELECT, INSERT, UPDATE, DELETE, ALTER 
    ON lojainformatica2.enderecos 
    TO 'r_enderecos'@'localhost';
SHOW GRANTS FOR 'r_enderecos'@'localhost';
    
GRANT 
	SELECT, INSERT, UPDATE, DELETE, ALTER 
    ON lojainformatica2.itemsvendas 
    TO 'r_itemsvendas'@'localhost';
SHOW GRANTS FOR 'r_itemsvendas'@'localhost';
    
GRANT 
	SELECT, INSERT, UPDATE, DELETE, ALTER 
    ON lojainformatica2.produtos 
    TO 'r_produtos'@'localhost';
SHOW GRANTS FOR 'r_produtos'@'localhost';

GRANT 
	SELECT, INSERT, UPDATE, DELETE, ALTER 
    ON lojainformatica2.vendas 
    TO 'r_vendas'@'localhost';
SHOW GRANTS FOR 'r_vendas'@'localhost';

GRANT 'r_clientes'@'localhost' TO 'Vitor'@'localhost';
SET DEFAULT ROLE 'r_clientes'@'localhost' TO 'Vitor'@'localhost';

GRANT 'r_enderecos'@'localhost' TO 'Rafael'@'localhost';
SET DEFAULT ROLE 'r_enderecos'@'localhost' TO 'Rafael'@'localhost';

GRANT 'r_itemsvendas'@'localhost' TO 'Lucca'@'localhost';
SET DEFAULT ROLE 'r_itemsvendas'@'localhost' TO 'Lucca'@'localhost';

GRANT 'r_produtos'@'localhost' TO 'Guilherme'@'localhost';
SET DEFAULT ROLE 'r_produtos'@'localhost' TO 'Guilherme'@'localhost';

GRANT 'r_vendas'@'localhost' TO 'Thiago'@'localhost';
SET DEFAULT ROLE 'r_vendas'@'localhost' TO 'Thiago'@'localhost';

CREATE USER 'admin'@'%' IDENTIFIED BY '123456';

GRANT 
	'r_clientes'@'localhost',
    'r_enderecos'@'localhost',
    'r_itemsvendas'@'localhost',
    'r_produtos'@'localhost',
    'r_vendas'@'localhost' 
TO 'admin'@'%';

SET DEFAULT ROLE 'r_clientes'@'localhost' TO 'admin'@'%';
SHOW GRANTS FOR 'admin'@'%';