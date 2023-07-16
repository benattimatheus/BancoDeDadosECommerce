use ecommerce;
show tables;

desc endereco;

insert into endereco (CEP, logradouro, numero, complemento, bairro, cidade) values 
	('11111111', 'Rua Belo Horizonte', 1, 'Casa', 'Batel', 'Curitiba'),
    ('22222222', 'Rua Marilandia', 32, 'Ao lado da igreja', 'Barra funda', 'São Paulo'),
    ('33333333', 'Avenida Bela Vista', 44, 'Sobrado azul', 'Hauer', 'Curitiba'),
    ('44444444', 'Avenida Porto Seguro', 8, 'Casa cinza', 'Botafogo', 'Rio de Janeiro'),
    ('55555555', 'Rua São Carlos', 12, 'Casa em frente ao shopping', 'Irajá', 'Rio de Janeiro');

desc cliente;

insert into cliente (PrimeiroNome, NomeDoMeio, Sobrenome, CPF, CNPJ, DataNascimento, Contato, IdClienteEndereco) values
	('Matheus', 'Pedro', 'Silva', '11111111111', null, '2004-01-14', 'matheus@email.com', 1),
    ('Rosa', 'Maria', 'Saraiva', '22222222222', null, '1984-12-01', 'rosa@email.com', 2),
    ('Carlos', null , 'Santos', '33333333333', null, '1992-07-23', 'carlos@email.com', 3),
    ('André', 'Silveira', 'Pereira', '44444444444', null, '2000-10-30', 'andre@email.com', 4),
    ('Ana', null , 'Costa', null , '12345678901234', '1975-03-07', 'anacosta@email.com', 5);
    
desc vendedor;

insert into vendedor (CPF, RazaoSocial, Localidade) values 
	('12345678901', 'Empresa Amarela', 'São Paulo'),
    ('09876543211', 'Empresa Roxa', 'Rio de Janeiro'),
    ('12345098765', 'Empresa Vermelha', 'Curitiba'),
    ('09876123456', 'Empresa Lilás', 'São Paulo'),
    ('13245768901', 'Empresa Verde', 'Santa Catarina');
    
desc produto;

insert into produto (Nome, Categoria, Descricao, Valor, Avaliacao, Quantidade) values
	('Tablet A', 'Eletrônico', 'Tablet com processamento acima da média, câmera de 42p', 1239.99, 4.5, 200),
    ('Jaqueta de Couro', 'Vestuário', 'Jaqueta de couro sintético da mais alta qualidade', 347.43, 4.8, 100),
    ('Brinquedo de montar', 'Brinquedo', 'Brinquedo que fará sucesso com toda as crianças', 230.00, 3.0, 350),
    ('Sofá 4 lugares', 'Móveis', 'Móvel de 2 metros, ideal para qualquer decoração', 1740.99, 2.0, 20),
    ('Placa de Vídeo B', 'Eletrônico', 'A placa de vídeo oferece desempenho gráfico avançado para uma experiência de jogo imersiva e renderização de alta qualidade', 4723.56, 4.2, 60);

desc fornecedor;

insert into fornecedor (RazaoSocial, CNPJ, Contato) values
	('Fornecedor A', '12121212121212', '(11) 999999999'),	
    ('Fornecedor B', '21212121212121', '(41) 988888888'),	
    ('Fornecedor C', '53535353535353', '(12) 977777777'),	
    ('Fornecedor D', '94949494949494', '(28) 966666666'),	
    ('Fornecedor E', '01010101010101', '(42) 955555555');
    
desc estoque;

insert into estoque (localidade, quantidade) values
	('São Paulo', 10),
    ('Ribeirão Preto', 20),
    ('Belo Horizonte', 30),
    ('Rio de Janeiro', 40),
    ('Curitiba', 50);
    
desc entrega;
    
insert into entrega (DataEntrega, Status, CodigoRastreio) values
	('2023-07-16 14:24:52', 'A caminho', 'A31132S'),
    ('2023-05-27 09:42:00', 'Cancelado', 'B12117K'),
    ('2023-03-30 15:53:00', 'Entregue', 'C35784L'),
    ('2023-01-01 08:09:58', 'Entregue', 'D83363F'),
    ('2022-12-16 16:12:22', 'Entregue', 'E64363M');
    
desc pagamento;

insert into pagamento (DataPagamento, PagamentoConfirmado, TipoPagamento) values
	('2023-07-16 14:24:52', true, 'Dinheiro'),
    ('2023-05-27 09:42:00', false, 'Crédito'),
    ('2023-03-30 15:53:00', true, 'Crédito'),
    ('2023-01-01 08:09:58', true, 'Débito'),
    ('2022-12-16 16:12:22', true, 'Pix');

desc pedido;

select * from cliente;
select * from pagamento;
select * from entrega;


insert into pedido (IdCliente, IdPagamento, IdEntrega, StatusPedido, Descricao, Frete, DataPedido) values
	(1, 1, 1, 'Processando', 'Saiu da transportadora', 00.00, '2023-07-15 14:24:52'),
    (2, 2, 2, 'Cancelado', 'Pedido cancelado', 00.00, '2023-05-27 10:42:00'),
	(3, 3, 4, 'Em andamento', 'Produto aguardando reposição', 22.20, '2023-02-02 22:53:00'),
    (4, 4, 4, 'Processando', 'Saiu para entrega', 03.50, '2022-12-22 05:09:58'),
    (5, 5, 4, 'Processando', 'Pedido recebido', 32.52, '2022-12-15 12:12:22');

desc vendedorproduto;
desc produtoestoque;
desc produtopedido;

insert into vendedorproduto (idVendedorProduto, idProduto) values 
	(1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5);

insert into produtoestoque (IdProdutoEstoque, IdEstoqueProduto, Localizacao) values
	(1,1,"São Paulo"),
    (2,2,"São Paulo"),
    (3,3,"Rio de Janeiro"),
    (4,4,"Curitiba"),
    (5,5,"Espírito Santo");
    
insert into produtopedido (IdProdutoPedido, IdPedidoPedido, Quantidade, Status) values
	(1,1,12,"Disponível"),
    (2,2,0,"Indisponível"),
    (3,3,23,"Disponível"),
    (4,4,02,"Disponível"),
    (5,5,63,"Disponível");
