/*
A EMPRESA NEWTON LOC LOCAÇÃO DE VEICULOS TE CONTRATOU PARA SER 
O NOVO DBA DA EMPRESA. AO ANALISAR A PARTE DE GERENCIAMENTO DOS
DADOS MUITAS ALTERAÇÕES E ATÉ MELHORIAS PRECISAM SER FEITAS.
ABAIXO AS MELHORIAS SUGERIDAS:
#################################################################################
1 - CRIAÇÃO DE NOVOS USUARIOS: MARIA(ADM),ROBERTO(COMUM),ANDERSON(COMUM) E PAULA(ANALISTA).(TODOS LOCAIS)
	TODOS DEVEM TER SENHA E AS MESMAS DEVEM OBDECER AS SEGUINTES REGRAS:
		TODAS DEVEM EXPIRAR EM 180 DIAS
        TODAS DEVEM TER O número Máximo de falhas de login = 5 
        E O tempo de bloqueio em dias = 1
        
##################################################################################
2 - CRIAÇÃO DE NOVOS ROLES
	3 ROLES: ADM, ANALISTA,COMUM.
			ADM : ACESSA TODO SCHEMA NEWTON LOC .
            ANALISTA : ACESSA NEWTON, LOC MAS PARA APENAS INSERT,UPDATE E DELETE
            COMUM : SOMENTE PESQUISA NAS TABELAS DO NEWTON LOC
            APLIQUE AS PERMISSÕES AOS USUARIOS
##################################################################################
3 - CRIAÇÃO DE STORED PROCEDURED
		CRIE UMA PROCEDURED CHAMADA SP1 PARA calcular a soma 
        de pontos de um cliente.
        use o nome do cliente.
#####################################################################################
4 - CRIAÇÃO DE TRIGGER
			CRIE UMA TRIGGUER PARA APLICAR A PONTUAÇÃO 
			QUE O CLIENTE VAI GANHAR
            AO ALUGAR UM CARRO, FORMULA:
            CLIENTE BASICO =  500 
            CLIENTE INTERMEDIARIO = 1500
            CLIENTE PREMIUM =  2500
            
            
            
#####################################################################################
5 - CRIAÇÃO DE INDICES
         OS INDICES QUE DEVEM SER CRIADOS:
			CLIENTES : NOME,EMAIL,PONTUACAO,TIPO
            CARROS : FABRICANTE,MODELO,COR,ANOFABRICACAO,POTENCIAMOTOR,CATEGORIA,QUILOMETRAGEM
			LOCACAO : DATALOCACAO,VALORDIARIA
            DIMENSOES : ALTURA,LARGURA,COMPRIMENTO,PESO,TANQUE,PORTAMALAS
*/

/*
1 - CRIAÇÃO DE NOVOS USUARIOS: MARIA(ADM),ROBERTO(COMUM),ANDERSON(COMUM) E PAULA(ANALISTA).(TODOS LOCAIS)
	TODOS DEVEM TER SENHA E AS MESMAS DEVEM OBDECER AS SEGUINTES REGRAS:
		TODAS DEVEM EXPIRAR EM 180 DIAS
        TODAS DEVEM TER O número Máximo de falhas de login = 5 
        E O tempo de bloqueio em dias = 1
*/

CREATE USER 'MARIA'@'LOCALHOST' IDENTIFIED BY '123456' FAILED_LOGIN_ATTEMPTS 5 PASSWORD EXPIRE INTERVAL 180 DAY PASSWORD_LOCK_TIME 1;
CREATE USER 'ROBERTO'@'LOCALHOST' IDENTIFIED BY '123456' FAILED_LOGIN_ATTEMPTS 5 PASSWORD EXPIRE INTERVAL 180 DAY PASSWORD_LOCK_TIME 1;
CREATE USER 'ANDERSON'@'LOCALHOST' IDENTIFIED BY '123456' FAILED_LOGIN_ATTEMPTS 5 PASSWORD EXPIRE INTERVAL 180 DAY PASSWORD_LOCK_TIME 1;
CREATE USER 'PAULA'@'LOCALHOST' IDENTIFIED BY '123456' FAILED_LOGIN_ATTEMPTS 5 PASSWORD EXPIRE INTERVAL 180 DAY PASSWORD_LOCK_TIME 1;

/*
2 - CRIAÇÃO DE NOVOS ROLES
	3 ROLES: ADM, ANALISTA,COMUM.
			ADM : ACESSA TODO SCHEMA NEWTON LOC .
            ANALISTA : ACESSA NEWTON, LOC MAS PARA APENAS INSERT,UPDATE E DELETE
            COMUM : SOMENTE PESQUISA NAS TABELAS DO NEWTON LOC
            APLIQUE AS PERMISSÕES AOS USUARIOS
*/

CREATE ROLE 'ADM'@'LOCALHOST';
GRANT ALL ON newtonloc.* TO 'ADM'@'LOCALHOST';
SHOW GRANTS FOR 'ADM'@'LOCALHOST';
GRANT 'ADM'@'LOCALHOST' TO 'MARIA'@'LOCALHOST';
SET DEFAULT ROLE 'ADM'@'LOCALHOST' TO 'MARIA'@'LOCALHOST';