/* Exercicio 1
Crie uma Stored Procedure que calcule a média de quatro números 
inteiros informados como parâmetro. Retorne o resultado da 
operação e armazene os números e o resultado em uma tabela. 
Além dos números a tabela deve ter um ID como chave primaria, 
conter a data e o usuário que realizou a operação.
*/

CREATE TABLE Historico_Medias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num1 INT,
    num2 INT,
    num3 INT,
    num4 INT,
    media DECIMAL(10,2),
    dataOperacao DATE,
    usuario VARCHAR(50)
);
DELIMITER $$

CREATE PROCEDURE SP_EX1(
    IN num1 INT,
    IN num2 INT,
    IN num3 INT,
    IN num4 INT,
    OUT result DOUBLE
)
BEGIN
    DECLARE media DOUBLE;

    -- Calcula a média dos quatro números
    SET media = (num1 + num2 + num3 + num4) / 4;

    -- Atribui o valor da média à variável de saída
    SET result = media;

    -- Insere os valores na tabela de histórico
    INSERT INTO Historico_Medias (num1, num2, num3, num4, media, dataOperacao, usuario)
    VALUES (num1, num2, num3, num4, media, CURDATE(), USER());

END$$

DELIMITER ;

SET @mediaResult = 0;
CALL SP_EX1(10, 20, 30, 40, @mediaResult);
SELECT @mediaResult AS MediaCalculada;

/* Exercicio 2
Crie uma Stored Procedure que some quantos clientes tem no 
cadastro da loja_online  e quantos fornecedores tambem estão
cadastrados. Crie a tabela colaboradores e insira 5 tuplas. 

*/

DELIMITER $$

CREATE PROCEDURE Contar_Clientes_Fornecedores(
    OUT totalClientes INT,
    OUT totalFornecedores INT
)
BEGIN
    -- Conta quantos clientes estão cadastrados
    SELECT COUNT(*) INTO totalClientes
    FROM CLIENTES;

    -- Conta quantos fornecedores estão cadastrados
    SELECT COUNT(*) INTO totalFornecedores
    FROM FORNECEDORES;
END$$

DELIMITER ;



/* Exercicio 3
Crie uma Stored Procedure para resolver o problema de Mariana, 
ela quis usar uma fita para embrulhar um pacote. Após uma rápida 
medição notou que bastavam 45cm (quarenta e cinto centímetros) 
para embrulhar tal pacote. A papelaria aonde ela foi só vendia a fita por 
4.00 reais a cada metro. Quanto Mariana teve que pagar para ter o tamanho necessário de fita?  
Observe a tabela abaixo:
Metro Decímetro Centímetro Milímetro 
m        dm        cm         mm 
1m       0,1m     0,01m      0,001m
*/

/* Exercicio 4
 Crie uma Stored Procedure que leia um número e calcule o seu 
quadrado, ou seja, o produto de um número por si mesmo depois 
acrescente a esse numero a raiz quadrada de 81. Obs: deve-se 
fazer a conta da raiz quadrada na procedure também. 
*/

/* Exercicio 5
 No Brasil a taxa de imposto de um determinado carro é de 52%, na 
Argentina 21%, Crie uma Stored Procedure que apresente o custo 
total do carro em ambos os países. OBS: os valores apresentados 
são em reais para ambos os países.  
 Dados para calcular os valores: 
                   BRASIL                  ARGENTINA 
CUSTO TOTAL          ?                        ? 
CUSTO FABRICA      11000                    8000 
IMPOSTOS %          52                       21 
DISTRIBUIÇÃO_CUSTO 2450                     1100 
CONCESSIONÁRIA %    3.5                      1.5

*/

/* Exercicio 6

Crie uma stored procedure onde se deve criar a tabela de 
Cardápio com os preços abaixo, crie também uma tabela consumo. 
Crie outra stored procedure que insere o consumo do cliente. Leia o 
código do cliente, código do produto o preço unitário a quantidade 
desse produto consumida e soma total de consumo do cliente. 
Exemplo id=1,cliente= joao , quantidade=2 refrigerantes, 
precounitario = 3 totalconsumido=6 
Cardapio: 
Hambúrguer................. R$ 3,00 
Cheeseburger.............. R$ 2,50 
Fritas............................ R$ 2,50 
Refrigerante................. R$ 1,00 
Milkshake..................... R$ 3,00 

*/