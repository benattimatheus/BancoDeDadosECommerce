-- Criação do Banco de Dados para E-commerce
-- drop database ecommerce;
-- Criar database ecommerce
create database if not exists ecommerce;
use ecommerce;

-- Criação da tabela endereco
create table endereco(
	IdEndereco int auto_increment primary key,
    CEP char(8),
    Logradouro varchar(255) not null,
    Numero int,
    Complemento varchar(45),
    Bairro varchar(45) not null,
    Cidade varchar(45) not null,
    constraint unique_cep unique (CEP),
    constraint unique_logradouro unique (Logradouro)
);
-- alter table endereco auto_increment = 1;
-- Criação da tabela cliente
create table cliente(
	IdCliente int auto_increment primary key,
    IdClienteEndereco int,
    PrimeiroNome varchar(20) not null,
    NomeDoMeio varchar(20),
    Sobrenome varchar(30) not null,
    CPF char(11),
    CNPJ char(14),
    DataNascimento date not null,
    Contato varchar(25) not null,
    constraint unique_cpf_cliente unique (CPF),
    constraint unique_cnpj_cliente unique (CNPJ),
    constraint fk_endereco_cliente foreign key (IdClienteEndereco) references endereco(IdEndereco)
);
-- alter table cliente auto_increment = 1;

-- Criação da tabela produto
create table produto(
	IdProduto int auto_increment primary key,
    Nome varchar(45) not null,
    Categoria enum('Eletrônico', 'Vestuário', 'Brinquedo', 'Móveis') not null,
    Descricao varchar(255) not null,
	Valor float not null,
    Avaliacao float default 0,
    Quantidade int
);

-- alter table produto auto_increment = 1;

-- Criação da tabela pagamento

create table pagamento(
	IdPagamento int auto_increment primary key,
    DataPagamento datetime not null,
    PagamentoConfirmado bool default false,
    TipoPagamento enum('Dinheiro','Crédito','Débito','Pix')
    );
-- alter table pagamento auto_increment = 1;

-- Criação da tabela entrega
create table entrega(
	IdEntrega int auto_increment primary key,
    DataEntrega datetime not null,
    Status enum("A caminho", "Entregue", "Cancelado") default "A caminho",
	CodigoRastreio varchar(7) not null,
    constraint unique_codigo_entrega unique (CodigoRastreio)
    );
-- alter table entrega auto_increment = 1;

-- Criação da tabela pedido
create table pedido(
	IdPedido int auto_increment primary key,
    IdCliente int not null,
    IdPagamento int not null,
    IdEntrega int not null, 
    StatusPedido enum('Em andamento', 'Processando', 'Cancelado') default 'Em andamento',
    Descricao varchar(255),
    Frete float default 0,
	DataPedido datetime not null,
    constraint fk_cliente_pedido foreign key (IdCliente) references cliente (IdCliente),
    constraint fk_pagamento_pedido foreign key (IdPagamento) references pagamento (IdPagamento),
    constraint fk_entrega_pedido foreign key (IdEntrega) references entrega (IdEntrega)
		on update cascade
);
-- alter table pedido auto_increment = 1;

-- Criação da tabela vendedor 
create table vendedor(
	IdVendedor int auto_increment primary key,
    CPF char(11) not null,
    RazaoSocial varchar(45) not null,
    Localidade varchar(100),
    constraint unique_cpf_vendedor unique (CPF),
    constraint unique_razaosocial_vendedor unique (RazaoSocial)
);
-- alter table vendedor auto_increment = 1;

-- Criação da tabela fornecedor
create table fornecedor(
	IdFornecedor int auto_increment primary key,
    RazaoSocial varchar(45) not null,
    CNPJ char(14) not null,
    Contato varchar(25),
    constraint fornecedor_razaosocial unique (RazaoSocial),
    constraint fornecedor_cnpj unique (CNPJ)
);
-- alter table fornecedor auto_increment = 1;

-- Criação da tabela estoque	
create table estoque(
	IdEstoque int auto_increment primary key,
    Localidade varchar(45) not null,
    Quantidade int default 0
);
-- alter table estoque auto_increment = 1;

-- Criação da tabela vendedorproduto
create table vendedorproduto(
	idVendedorProduto int,
    idProduto int,
    primary key (idVendedorProduto,idProduto), 
    constraint fk_vendedor_produto foreign key (idVendedorProduto) references vendedor (IdVendedor),
    constraint fk_produto_produto foreign key (idProduto) references produto (IdProduto)
);

-- Criação da tabela produtopedido
create table produtopedido(
	IdProdutoPedido int,
    IdPedidoPedido int,
    Quantidade int not null,
    Status enum('Disponível', 'Indisponível') default 'Disponível',
    primary key (IdProdutoPedido,IdPedidoPedido), 
    constraint fk_produto_pedido foreign key (IdProdutoPedido) references produto (IdProduto),
    constraint fk_pedido_pedido foreign key (IdPedidoPedido) references pedido (IdPedido)
);


-- Criação da tabela produtoestoque
create table produtoestoque(
	IdProdutoEstoque int,
    IdEstoqueProduto int,
    Localizacao varchar(45) not null,
    primary key (IdProdutoEstoque,IdEstoqueProduto), 
    constraint fk_produto_estoque foreign key (IdProdutoEstoque) references produto (IdProduto),
    constraint fk_estoque_Produto foreign key (idEstoqueProduto) references estoque (IdEstoque)
);


-- Criação da tabela fornecedorproduto
create table fornecedorproduto(
	IdFornecedor int,
    IdProduto int,
    Localizacao varchar(45) not null,
    primary key (IdFornecedor, IdProduto), 
    constraint fk_fornecedor_produto foreign key (IdFornecedor) references fornecedor (IdFornecedor),
    constraint fk_fornecedorproduto_produto foreign key (IdProduto) references produto (IdProduto)
);

show tables;