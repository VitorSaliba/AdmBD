# ----------Exemplo 1---Retira pontos de um texto------------------------------------
Delimiter $$
CREATE FUNCTION Retira_Caracter1 (retira VARCHAR(60))
RETURNS VARCHAR(60) 
BEGIN
   RETURN REPLACE(retira,'.','');
END $$
Delimiter ;
 #SET GLOBAL log_bin_trust_function_creators = 1;
SELECT Retira_Caracter1("Ad.mi.nis.tração d.e B-a-n-c-o de D/a/d/o/s");
#----------Exemplo 2---Retira pontos, traços e barras de um texto----------------------- 
Delimiter $$
CREATE FUNCTION Retira_Caracter2 (retira VARCHAR(60))
RETURNS VARCHAR(60) Deterministic
BEGIN
   RETURN (REPLACE(REPLACE(REPLACE(retira,'.',''),'-',''),'/',''));
END $$
Delimiter ;
 
SELECT Retira_Caracter2("Ad.mi.nis.tração d.e B-a-n-c-o de D/a/d/o/s");
#----------Exemplo 3---Texto em Minúsculo-----------------------------------------------
Delimiter %
CREATE FUNCTION Funcao_Lower (texto VARCHAR(50))
RETURNS VARCHAR(50) deterministic
BEGIN
set texto =( LOWER(texto));
   RETURN texto;
END %
Delimiter ;
SELECT Funcao_Lower('Marcelo') AS MINUSCULO;


#------Exemplo 4----Texto em Maiusculo------------------------------------

Delimiter $$
CREATE FUNCTION Funcao_Upper (texto VARCHAR(50))
RETURNS VARCHAR(50) deterministic
BEGIN
set texto =( UPPER(texto));
   RETURN texto;
END $$
Delimiter ;
SELECT Funcao_Upper('Marcelo') AS MAIÚSCULO;
#-------Exemplo 5----Texto ao Contrario-------------------------------------- 
Delimiter $$
CREATE FUNCTION Funcao_CONTRARIO (texto VARCHAR(50))
RETURNS VARCHAR(50) deterministic
BEGIN
set texto =( REVERSE(texto));
   RETURN texto;
END $$
Delimiter ;
SELECT Funcao_CONTRARIO('MARCELO') AS CONTRÁRIO;

#---------Exemplo 6------Raiz Quadrada------------------------------------
Delimiter $$
CREATE Function Raiz_Quadrada (numero int)
Returns int deterministic
 Begin
  Declare raiz Int;
  -- funcão dentro de uma função
  Set raiz= SQRT(numero);
  Return (raiz);
 End $$
Delimiter ;
Select Raiz_Quadrada (9) AS RAIZ_É;
#---------Exemplo 7------Quadrado de um Numero------------------------------------
Delimiter $$
CREATE FUNCTION Quadrado_Numero (numero INT)
RETURNS INT deterministic
BEGIN
IF(numero<10)THEN
set numero = numero*numero;
ELSE
SET numero=0;
END  IF;
RETURN numero;
END $$ 
 Delimiter ;
SELECT Quadrado_Numero(13) AS QUADRADO;
#---------Exemplo 8------Conta Caracteres em um texto------------------------------------
Delimiter $$
CREATE FUNCTION Tamanho_Palavra(Palavra Varchar(100))
RETURNS int deterministic
BEGIN
Declare Tamanho int;
SET Palavra = REPLACE(Palavra,' ','');
Set Tamanho = length(Palavra);
Return Tamanho;
END $$
Delimiter ;
Select Tamanho_Palavra ('Administracao de Banco de Dados')AS Tamanho_Palavra;




#---------Exemplo 9------Aumentar Limite Credito------------------------------------
Delimiter $$
CREATE FUNCTION Limite_Credito(id_Cliente INT, aumentoLimite double)
RETURNS double 
BEGIN
Declare lcn, resultado double;
SELECT limiteCredito INTO lcn FROM Clientes WHERE idCliente = id_Cliente;
SET resultado = lcn + (lcn * aumentoLimite / 100);
#UPDATE clientes SET limiteCredito = resultado WHERE idCliente = id_Cliente;
Return resultado;
END $$
Delimiter ;
Select Limite_Credito(5,10) AS "Novo Limite";

DROP FUNCTION Limite_Credito;

# usando a funcao que acabamos de criar

SELECT concat(nome," ",cpf) AS "Nome _CPF",
limiteCredito AS "Limite Antigo",
Limite_Credito(idCliente,10) AS "Limite Novo"
FROM clientes;
# -----   Exercicios Funcoes  ----
# 1 Crie uma Função que : pesquise um nome que termine com a letra S na tabela Fornecedores
Delimiter $$
CREATE FUNCTION Buscar_Fornecedores_Terminam_S()
RETURNS VARCHAR(120)
BEGIN
    RETURN(
		SELECT nome
        FROM Fornecedores
        WHERE nome LIKE '%S'
    );
END $$
Delimiter ;
SELECT Buscar_Fornecedores_Terminam_S() AS "Fornecedores terminando em S";

# 2 Crie uma Função que : Retire os seguintes caracteres do texto abaixo : * . - !
#   Ta*lvez v.ocê ain*da n.ão saiba o que é *SQL. Ma.s, -provavelm-ente, ente-nde que lidar com 
#   o gerenciamento é super importante.
#   d-e da-dos t+em se to+rna.do um d!!esafio cada vez maior
DELIMITER $$

CREATE FUNCTION Remove_Caracteres(texto TEXT)
RETURNS TEXT
BEGIN
    SET texto = REPLACE(texto, '*', '');
    SET texto = REPLACE(texto, '.', '');
    SET texto = REPLACE(texto, '-', '');
    SET texto = REPLACE(texto, '!', '');
    
    RETURN texto;
END $$

DELIMITER ;
SELECT Remove_Caracteres('Ta*lvez v.ocê ain*da n.ão saiba o que é *SQL. Ma.s, -provavelm-ente, ente-nde que lidar com o gerenciamento é super importante. d-e da-dos t+em se to+rna.do um d!!esafio cada vez maior') AS Texto_Limpo;

# 3 Crie uma Função que : Calcule a média de 3 valores
DELIMITER $$

CREATE FUNCTION Calcular_Media(val1 DOUBLE, val2 DOUBLE, val3 DOUBLE)
RETURNS DOUBLE
BEGIN
    DECLARE media DOUBLE;
    
    SET media = (val1 + val2 + val3) / 3;
    
    RETURN media;
END $$

DELIMITER ;

SELECT Calcular_Media(10, 20, 30) AS Media;
# 4 Crie uma Função que : Calcule a expressao : x+2(y-1)*5+x;
DELIMITER $$

CREATE FUNCTION Calcular_Expressao(x DOUBLE, y DOUBLE)
RETURNS DOUBLE
BEGIN
    DECLARE resultado DOUBLE;
    
    SET resultado = x + 2 * (y - 1) * 5 + x;
    
    RETURN resultado;
END $$

DELIMITER ;

SELECT Calcular_Expressao(3, 4) AS Resultado;

# 5 Crie uma Função que : apresente um texto com palavras escritas ao contrario. 
#   precisam ser 3 palavras e todas devem ser palímdromos
DELIMITER $$

CREATE FUNCTION Palindromos_Ao_Contrario()
RETURNS TEXT
BEGIN
    DECLARE resultado TEXT DEFAULT '';
    
    -- Palíndromos
    SET resultado = CONCAT(REVERSE('radar'), ' ', REVERSE('level'), ' ', REVERSE('madam'));
    
    RETURN resultado;
END $$

DELIMITER ;

SELECT Palindromos_Ao_Contrario() AS Texto_Ao_Contrario;
# 6 Crie uma Função que : dê 5% de denconto em uma venda realizada.
DELIMITER $$

CREATE FUNCTION Aplicar_Desconto_5_Pedido(idPedido INT)
RETURNS DOUBLE
BEGIN
    DECLARE valor_original DOUBLE;
    DECLARE valor_com_desconto DOUBLE;
    
    -- Obtém o valor total do pedido
    SELECT valorTotalPedido INTO valor_original
    FROM PEDIDOS
    WHERE idPedido = idPedido;
    
    -- Calcula o valor com desconto de 5%
    SET valor_com_desconto = valor_original * 0.95;
    
    RETURN valor_com_desconto;
END $$

DELIMITER ;

-- Exemplo de uso:
SELECT Aplicar_Desconto_5_Pedido(1) AS Valor_Com_Desconto;





