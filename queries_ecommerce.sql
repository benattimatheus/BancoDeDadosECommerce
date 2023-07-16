use ecommerce;
-- Quantos pedidos foram feitos por cada cliente?

select * from cliente;
select c.IdCliente, CONCAT(c.PrimeiroNome,' ', c.Sobrenome) AS Nome, COUNT(*) AS total_pedidos from pedido p inner join cliente c on p.IdCliente = c.IdCliente
group by c.IdCliente;

-- Algum vendedor também é fornecedor?
select * from vendedor;
select * from fornecedor;

select v.IdVendedor, v.RazaoSocial from vendedor v inner join fornecedor f on v.IdVendedor = f.IdFornecedor;

-- Relação de produtos fornecedores e estoques;
select f.RazaoSocial as nome_fornecedor, p.nome as nome_produto, e.quantidade from fornecedor f
join fornecedorproduto fp on f.idfornecedor = fp.idfornecedor
join produto p on fp.idproduto = p.idproduto
join produtoestoque pe on p.idproduto = pe.idprodutoestoque
join estoque e on pe.idestoqueproduto = e.idestoque;

-- Relação de nomes dos fornecedores e nomes dos produtos;

select f.RazaoSocial as nome_fornecedor, p.nome as nome_produto
from fornecedor f
join fornecedorproduto fp on f.idfornecedor = fp.idfornecedor
join produto p on fp.idproduto = p.idproduto;

select * from produto;

select nome, categoria, valor, avaliacao from produto where Valor <2000.00 and Valor > 1000.00;

select * from cliente where sobrenome like "%s%";

select IdPedido, IdCliente, Descricao, Frete from pedido order by Frete asc;
select IdPedido, IdCliente, Descricao, Frete from pedido order by Frete desc;

select * from produto where Avaliacao > 4.0;

select * from endereco where cidade = "Curitiba";

select concat(c.PrimeiroNome, ' ', c.Sobrenome) as nome_cliente, e.cidade as cidade_endereco, COUNT(p.idPedido) as total_pedidos
from cliente c
join endereco e on c.idclienteendereco = e.idendereco
join pedido p on c.idcliente = p.idcliente
group by nome_cliente, e.cidade;

