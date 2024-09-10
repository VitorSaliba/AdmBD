# -- Views
# 1 Crie uma view que apresente o total de pedidos do dia 2024-08-21
CREATE VIEW Total_Pedidos_Dia AS
SELECT COUNT(idPedido) AS total_pedidos, SUM(valorTotalPedido) AS valor_total
FROM pedidos
WHERE dataped = '2024-08-21';

# 2 Crie uma view que apresente o total de pedidos já realizados
CREATE VIEW Total_Pedidos_Realizados AS
SELECT COUNT(idPedido) as total_pedidos
FROM pedidos;

# 3 Crie uma view que apresente o nome dos clientes que ja fizeram uma compra
CREATE VIEW Clientes_Que_Compraram AS 
SELECT C.nome
FROM CLIENTES C JOIN PEDIDOS P ON C.idCliente = P.fk_id_Cliente;

# 4 Crie uma view que apresente os produtos que já foram comprados
CREATE VIEW Produtos_Comprados AS
SELECT P.descricao, P.tipo, P.precoVenda
FROM PRODUTOS P JOIN ITEMSPEDIDOS I ON P.idProduto = I.fk_id_Produto;

# 5 Crie uma view que apresente quais produtos os clientes compraram
CREATE VIEW Produtos_Comprados_Por_Clientes AS
SELECT C.nome AS cliente, P.descricao AS produto, IP.quantidade
FROM CLIENTES C
JOIN PEDIDOS PD ON C.idCliente = PD.fk_id_Cliente
JOIN ITEMSPEDIDOS IP ON PD.idPedido = IP.fk_id_Pedido
JOIN PRODUTOS P ON IP.fk_id_Produto = P.idProduto;

# 6 Crie uma view que apresente o ticket medio dos valores dos pedidos
CREATE VIEW Ticket_Medio AS 
SELECT AVG(valorTotalPedido) AS ticket_medio
FROM PEDIDOS;

# 7 Crie uma view que apresente o lucro que rendeu um pedido qualquer
CREATE VIEW Lucro_Por_Pedido AS
SELECT 
    PD.idPedido AS pedido,
    SUM((P.precoVenda - P.precoCompra) * IP.quantidade) AS lucro
FROM 
    PEDIDOS PD
JOIN 
    ITEMSPEDIDOS IP ON PD.idPedido = IP.fk_id_Pedido
JOIN 
    PRODUTOS P ON IP.fk_id_Produto = P.idProduto
GROUP BY 
    PD.idPedido;
    
# 8 Crie uma view que apresente quantos pedidos já foram feitos
CREATE VIEW Quantos_Pedidos_Feitos AS
SELECT COUNT(idPedido) AS total_pedidos, SUM(valorTotalPedido) AS valor_total
FROM PEDIDOS;

# 9 Crie uma view que apresente qual o maior pedido em valor
CREATE VIEW Maior_Pedido_Em_Valor AS
SELECT 
    idPedido AS pedido,
    valorTotalPedido
FROM 
    PEDIDOS
WHERE 
    valorTotalPedido = (SELECT MAX(valorTotalPedido) FROM PEDIDOS);
    
# 10 Crie uma view que apresente qual o menor pedido em valor
CREATE VIEW Menor_Pedido_Em_Valor AS
SELECT 
    idPedido AS pedido,
    valorTotalPedido
FROM 
    PEDIDOS
WHERE 
    valorTotalPedido = (SELECT MIN(valorTotalPedido) FROM PEDIDOS);
    
# 11 Crie uma view que apresente qual o endereco do cliente Teclaudio
CREATE VIEW Endereco_Teclaudio AS
SELECT 
    C.nome AS cliente,
    E.Logradouro,
    E.numero,
    E.complemento,
    E.cep,
    E.bairro,
    E.cidade,
    E.estado
FROM 
    CLIENTES C
JOIN 
    ENDERECOS E ON C.fk_id_endereco = E.idEndereco
WHERE 
    C.nome = 'Tecláudio Screen';
    
# 12 Crie uma view que apresente qual endereco dos clientes que ja fizeram compras
CREATE VIEW Enderecos_Clientes_Compras AS
SELECT 
    C.nome AS cliente,
    E.Logradouro,
    E.numero,
    E.complemento,
    E.cep,
    E.bairro,
    E.cidade,
    E.estado
FROM 
    CLIENTES C
JOIN 
    PEDIDOS P ON C.idCliente = P.fk_id_Cliente
JOIN 
    ENDERECOS E ON C.fk_id_endereco = E.idEndereco
GROUP BY 
    C.nome, E.Logradouro, E.numero, E.complemento, E.cep, E.bairro, E.cidade, E.estado;
    
# 13 Crie uma view que apresente quais pedidos foram pagos em pix
CREATE VIEW Pedidos_Pagos_Em_PIX AS
SELECT 
    PD.idPedido AS pedido,
    PG.forma_pagamento AS pagamento
FROM 
    PEDIDOS PD
JOIN 
    PAGAMENTOS PG ON PD.fk_id_pagamento = PG.idPagamento
WHERE 
    PG.forma_pagamento = 'PIX';
    
# 14 Crie uma view que apresente quais pedidos foram pagos em cartao
CREATE VIEW Pedidos_Pagos_Em_Cartao AS
SELECT 
    PD.idPedido AS pedido,
    PD.dataped AS data_pedido,
    PD.valorTotalPedido AS valor_total,
    PG.forma_pagamento AS pagamento
FROM 
    PEDIDOS PD
JOIN 
    PAGAMENTOS PG ON PD.fk_id_pagamento = PG.idPagamento
WHERE 
    PG.forma_pagamento = 'CARTAO_CREDITO';
    
# 15 Crie uma view que apresente quais itens foram pedidos no pedido do Marta Castro
CREATE VIEW Itens_Pedido_Marta_Castro AS
SELECT 
    IP.idiItemPedido AS id_item_pedido,
    IP.fk_id_Pedido AS id_pedido,
    P.descricao AS produto,
    IP.quantidade AS quantidade,
    P.precoVenda AS preco_unitario,
    (IP.quantidade * P.precoVenda) AS valor_total
FROM 
    ITEMSPEDIDOS IP
JOIN 
    PEDIDOS PD ON IP.fk_id_Pedido = PD.idPedido
JOIN 
    CLIENTES C ON PD.fk_id_Cliente = C.idCliente
JOIN 
    PRODUTOS P ON IP.fk_id_Produto = P.idProduto
WHERE 
    C.nome = 'Marta Castro';

# 16 Crie uma view que apresente qual fornecedor fabricou os produtos do pedido da Helena Carla
CREATE VIEW Fornecedores_Produtos_Pedido_Helena_Carla AS
SELECT 
    P.idProduto AS id_produto,
    P.descricao AS produto,
    F.nome AS fornecedor,
    F.cnpj AS cnpj_fornecedor
FROM 
    ITEMSPEDIDOS IP
JOIN 
    PEDIDOS PD ON IP.fk_id_Pedido = PD.idPedido
JOIN 
    CLIENTES C ON PD.fk_id_Cliente = C.idCliente
JOIN 
    PRODUTOS P ON IP.fk_id_Produto = P.idProduto
JOIN 
    FORNECEDORES F ON P.fk_id_fornecedor = F.idFornecedor
WHERE 
    C.nome = 'Helena Carla';
    
# 17 Crie uma view que apresente qual fornecedor fabrica as Camisas comercializadas
CREATE VIEW Fornecedores_Camisas AS
SELECT 
    P.idProduto AS id_produto,
    P.descricao AS descricao_produto,
    F.nome AS fornecedor,
    F.cnpj AS cnpj_fornecedor
FROM 
    PRODUTOS P
JOIN 
    FORNECEDORES F ON P.fk_id_fornecedor = F.idFornecedor
WHERE 
    P.descricao LIKE '%Camisa%';
    
# 18 Crie uma view que apresente qual a quantidade em estoque do produto comprado pela Maria de Almeida
CREATE VIEW Quantidade_Estoque_Produto_Maria_Almeida AS
SELECT 
    P.idProduto AS id_produto,
    P.descricao AS descricao_produto,
    P.estoque AS quantidade_estoque
FROM 
    ITEMSPEDIDOS IP
JOIN 
    PEDIDOS PD ON IP.fk_id_Pedido = PD.idPedido
JOIN 
    CLIENTES C ON PD.fk_id_Cliente = C.idCliente
JOIN 
    PRODUTOS P ON IP.fk_id_Produto = P.idProduto
WHERE 
    C.nome = 'Maria de Almeida';
    
# 19 Crie uma view que apresente o total de produtos fabricados pela Marte Roupas
CREATE VIEW Total_Produtos_Fabricados_Marte_Roupas AS
SELECT 
    F.nome AS fornecedor,
    COUNT(P.idProduto) AS total_produtos
FROM 
    PRODUTOS P
JOIN 
    FORNECEDORES F ON P.fk_id_fornecedor = F.idFornecedor
WHERE 
    F.nome = 'Marte Roupas'
GROUP BY 
    F.nome;