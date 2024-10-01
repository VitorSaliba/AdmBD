# Qual a descricao dos produtos que nao foram pedidos.
CREATE OR REPLACE VIEW Produtos_Nao_Pedidos AS
SELECT p.descricao
FROM produtos p
LEFT JOIN itemspedidos ip ON p.idProduto = ip.fk_id_Produto
WHERE ip.fk_id_Produto IS NULL;
SELECT * FROM Produtos_Nao_Pedidos;

# QUAis enderecos nao sao dos clientes?
CREATE VIEW Enderecos_Nao_Clientes AS
SELECT e.*
FROM enderecos e
LEFT JOIN clientes c ON e.idEndereco = c.fk_id_endereco
WHERE c.fk_id_endereco IS NULL;
SELECT * FROM Enderecos_Nao_Clientes;

# Qual pagamento ainda nao foi usado em pedidos?
CREATE VIEW Pagamento_Nao_Utilizado AS
SELECT p.*
FROM pagamentos p 
LEFT JOIN pedidos ped ON p.idPagamento = ped.fk_id_pagamento
WHERE ped.fk_id_pagamento IS NULL;
SELECT * FROM Pagamento_Nao_Utilizado;

# Qual fornecedor nao esta na lista?
CREATE VIEW Fornecedor_Nao_Cadastrado AS
SELECT f.nome, f.idFornecedor
FROM fornecedores f
LEFT JOIN produtos p ON f.idFornecedor = p.fk_id_fornecedor
WHERE p.fk_id_fornecedor IS NULL;
SELECT * FROM Fornecedor_Nao_Cadastrado;

# Ao receber um pedido novo, atualize o estoque do produto

# Apresente o calculo de soma das vendas realizadas em um determinado mes.
# Ao apagar um cliente , crie uma tabela de log no sistema, informando quem apagou, qual nome do cliente
# apagado e qual data foi realizada a operação