DROP SCHEMA IF EXISTS cmo;

CREATE SCHEMA cmo;

USE cmo;

CREATE TABLE ordem_de_servico (
  PRIMARY KEY (id_ordem_de_servico),
  id_ordem_de_servico int NOT NULL AUTO_INCREMENT,
  data_de_abertura_os date NOT NULL,
  data_garantia_servico date,
  valor_mao_de_obra decimal(10,2),
  valor_peca decimal(10,2),
  valor_acessorio decimal(10,2),
  valor_desconto decimal(10,2),
  valor_total decimal(10,2) NOT NULL,
  descricao_do_problema varchar(1000) NOT NULL,
  obs_os varchar(1000),
  id_microondas_manut int,
  id_forno_eletrico_manut int,
  id_acessorios int,
  id_microondas_venda int,
  id_forno_eletrico_venda int,
  id_pecas int,
  id_cliente int NOT NULL,  
  id_tipo_servico int NOT NULL,
  id_forma_de_pagamento int,
  id_situacao_os int,
  id_funcionario int NOT NULL,  
  id_filial int NOT NULL,  
  id_setor int NOT NULL,
  id_mao_de_obra int
);

CREATE TABLE acessorios (
  PRIMARY KEY (id_acessorios),
  id_acessorios int NOT NULL AUTO_INCREMENT,
  nome_acessorio varchar(200) NOT NULL,
  modelo_acessorio varchar(100) NOT NULL,
  qtd_em_estoque_acessorio int NOT NULL,
  qtd_min_estoque_acessorio int,
  preco_venda_acessorio decimal (10,2) NOT NULL,
  preco_compra_acessorio decimal (10,2) NOT NULL,
  acessorio_tipo_unidade varchar(50) NOT NULL,
  id_ordem_de_servico int,
  id_marcas int NOT NULL,
  id_condicao int NOT NULL,
  id_filial int NOT NULL
);

CREATE TABLE cliente (
  PRIMARY KEY (id_cliente),
  id_cliente int NOT NULL AUTO_INCREMENT,
  nome_cliente varchar(200) NOT NULL,
  cpf_cliente varchar(14) NOT NULL,
  cnpj_cliente varchar(18),
  telefone_cliente varchar(20) NOT NULL,
  data_de_nascimento_cliente date NOT NULL,
  email_cliente varchar(200) NOT NULL,
  senha_cliente varchar(30) NOT NULL,
  id_microondas_manut int,
  id_forno_eletrico_manut int,
  id_forno_eletrico_venda int,
  id_microondas_venda int,
  id_ordem_de_servico int,
  id_filial int NOT NULL,
  id_endereco int NOT NULL
);

CREATE TABLE endereco (
  PRIMARY KEY (id_endereco),
  id_endereco int NOT NULL AUTO_INCREMENT,
  endereco varchar(300) NOT NULL,
  complemento varchar(100),
  bairro varchar(100) NOT NULL,
  numero varchar(10) NOT NULL,
  cidade varchar(100) NOT NULL,
  estado varchar(60) NOT NULL,
  cep varchar(10) NOT NULL,
  observacao varchar(200),
  id_cliente int,
  id_filial int,
  id_funcionario int
);

CREATE TABLE filial (
  PRIMARY KEY (id_filial),
  id_filial int NOT NULL AUTO_INCREMENT,
  nome_filial varchar(200) NOT NULL,
  cnpj_filial varchar(14) NOT NULL,
  telefone_filial varchar(20) NOT NULL,
  id_ordem_de_servico int,
  id_pecas int,
  id_acessorios int,
  id_microondas_manut int,
  id_forno_eletrico_manut int,
  id_microondas_venda int,
  id_forno_eletrico_venda int,
  id_funcionario int,
  id_setor int,
  id_cliente int,
  id_endereco int NOT NULL
);

CREATE TABLE forma_de_pagamento (
  PRIMARY KEY (id_forma_de_pagamento),
  id_forma_de_pagamento int NOT NULL AUTO_INCREMENT,
  forma_de_pagamento varchar(20),
  id_plano_de_pagamento int NOT NULL,
  id_ordem_de_servico int
);    

CREATE TABLE forno_eletrico_manut (
  PRIMARY KEY (id_forno_eletrico_manut),
  id_forno_eletrico_manut int NOT NULL AUTO_INCREMENT,
  modelo_forno_eletrico varchar(100) NOT NULL,
  num_identificacao_forno_eletrico varchar(100) NOT NULL,
  cor_forno_eletrico varchar(100) NOT NULL,
  id_marcas int NOT NULL,
  id_ordem_de_servico int NOT NULL,
  id_cliente int NOT NULL,
  id_filial int NOT NULL
);

CREATE TABLE forno_eletrico_venda (
  PRIMARY KEY (id_forno_eletrico_venda),
  id_forno_eletrico_venda int NOT NULL AUTO_INCREMENT,
  modelo_forno_eletrico_venda varchar(100) NOT NULL,
  num_identificacao_forno_eletrico_venda varchar(100) NOT NULL,
  cor_forno_eletrico_venda varchar(100) NOT NULL,
  valor_forno_eletrico decimal(10,2) NOT NULL,
  id_ordem_de_servico int,
  id_marcas int NOT NULL,
  id_condicao int NOT NULL,
  id_filial int NOT NULL,
  id_cliente int
);

CREATE TABLE funcionario (
  PRIMARY KEY (id_funcionario),
  id_funcionario int NOT NULL AUTO_INCREMENT,
  nome_funcionario varchar(200) NOT NULL,
  cpf_funcionario varchar(11) NOT NULL,
  cnpj_funcionario varchar(18),
  data_de_nascimento_funcionario date NOT NULL,
  data_admissao date NOT NULL,
  data_demissao date,
  funcao_funcionario varchar(50) NOT NULL,
  email_funcionario varchar(200) NOT NULL,
  senha_funcionario varchar(30) NOT NULL,
  telefone_funcionario varchar(20) NOT NULL,
  id_ordem_de_servico int,
  id_situacao_os int,
  id_situacao_funcionario int NOT NULL,
  id_filial int NOT NULL,
  id_mao_de_obra int,
  id_setor int NOT NULL,
  id_endereco int NOT NULL
);

CREATE TABLE situacao_funcionario (
 PRIMARY KEY (id_situacao_funcionario),
 id_situacao_funcionario int NOT NULL AUTO_INCREMENT,
 situacao_funcionario varchar(20) NOT NULL,
 id_funcionario int
);

CREATE TABLE mao_de_obra (
  PRIMARY KEY (id_mao_de_obra),
  id_mao_de_obra int NOT NULL AUTO_INCREMENT,
  nome_mao_de_obra varchar(200) NOT NULL,
  id_setor int NOT NULL,
  id_ordem_de_servico int,
  id_funcionario int NOT NULL
);

CREATE TABLE marcas (
  PRIMARY KEY (id_marcas),
  id_marcas int NOT NULL AUTO_INCREMENT,
  nome_marca varchar(200) NOT NULL,
  id_microondas_manut int,
  id_forno_eletrico_manut int,
  id_acessorios int,
  id_pecas int,
  id_microondas_venda int,
  id_forno_eletrico_venda int
);

CREATE TABLE microondas_manut (
  PRIMARY KEY (id_microondas_manut),
  id_microondas_manut int NOT NULL AUTO_INCREMENT,
  modelo_microondas varchar(100) NOT NULL,
  num_identificacao_microondas varchar(100) NOT NULL,
  cor_microondas varchar(100) NOT NULL,
  id_ordem_de_servico int NOT NULL,
  id_marcas int NOT NULL,
  id_cliente int NOT NULL,
  id_filial int NOT NULL
);

CREATE TABLE microondas_venda (
  PRIMARY KEY (id_microondas_venda),
  id_microondas_venda int NOT NULL AUTO_INCREMENT,
  modelo_microondas_venda varchar(100) NOT NULL,
  num_identificacao_microondas_venda varchar(100) NOT NULL,
  cor_microondas_venda varchar(100) NOT NULL,
  valor_microondas decimal(10,2) NOT NULL,
  id_ordem_de_servico int,
  id_marcas int NOT NULL,
  id_condicao int NOT NULL,
  id_filial int NOT NULL,
  id_cliente int
);

CREATE TABLE pecas (
  PRIMARY KEY (id_pecas),
  id_pecas int NOT NULL AUTO_INCREMENT,
  nome_pecas varchar(200) NOT NULL,
  modelo_pecas varchar(100) NOT NULL,
  qtd_em_estoque_pecas int NOT NULL,
  qtd_min_estoque_pecas int,
  preco_venda_pecas decimal (10,2) NOT NULL,
  preco_compra_pecas decimal (10,2) NOT NULL,
  pecas_tipo_unidade varchar(50) NOT NULL,
  id_ordem_de_servico int,
  id_filial int,
  id_marcas int NOT NULL,
  id_condicao int NOT NULL
);

CREATE TABLE condicao (
  PRIMARY KEY (id_condicao),
  id_condicao int NOT NULL AUTO_INCREMENT,
  condicao varchar(100) NOT NULL,
  id_pecas int,
  id_acessorios int,
  id_microondas_venda int,
  id_forno_eletrico_venda int
);

CREATE TABLE plano_de_pagamento (
  PRIMARY KEY (id_plano_de_pagamento),
  id_plano_de_pagamento int NOT NULL AUTO_INCREMENT,
  plano_de_pagamento varchar(20),
  id_forma_de_pagamento int NOT NULL
);    

CREATE TABLE setor (
  PRIMARY KEY (id_setor),
  id_setor int NOT NULL AUTO_INCREMENT,
  nome_setor varchar(200) NOT NULL,
  id_filial int,
  id_ordem_de_servico int,
  id_mao_de_obra int,
  id_funcionario int
);

CREATE TABLE situacao_os (
  PRIMARY KEY (id_situacao_os),
  id_situacao_os int NOT NULL AUTO_INCREMENT,
  situacao varchar(50) NOT NULL,
  data_de_exclusao_os date,
  data_de_previsao_os date,
  data_de_execucao_os date,
  data_de_fechamento_os date,
  obs_fechamento_os varchar(100),
  id_ordem_de_servico int NOT NULL,
  id_funcionario int NOT NULL
);  

CREATE TABLE tipo_de_servico (
  PRIMARY KEY (id_tipo_de_servico),
  id_tipo_de_servico int NOT NULL AUTO_INCREMENT,
  nome_do_tipo_de_servico varchar(100) NOT NULL,
  id_ordem_de_servico int
);  





-- FOREIGN KEYS

ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_tipo_de_servico FOREIGN KEY (id_tipo_servico) REFERENCES tipo_de_servico(id_tipo_de_servico);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_microondas_manut FOREIGN KEY (id_microondas_manut) REFERENCES microondas_manut(id_microondas_manut);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_forno_eletrico_manut FOREIGN KEY (id_forno_eletrico_manut) REFERENCES forno_eletrico_manut(id_forno_eletrico_manut);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_acessorios FOREIGN KEY (id_acessorios) REFERENCES acessorios(id_acessorios);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_pecas FOREIGN KEY (id_pecas) REFERENCES pecas(id_pecas);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_mao_de_obra FOREIGN KEY (id_mao_de_obra) REFERENCES mao_de_obra(id_mao_de_obra);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_nota_fiscal FOREIGN KEY (id_nota_fiscal) REFERENCES nota_fiscal(id_nota_fiscal);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_forma_de_pagamento FOREIGN KEY (id_forma_de_pagamento) REFERENCES forma_de_pagamento(id_forma_de_pagamento);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_setor FOREIGN KEY (id_setor) REFERENCES setor(id_setor);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_microondas_venda FOREIGN KEY (id_microondas_venda) REFERENCES microondas_venda(id_microondas_venda);
ALTER TABLE ordem_de_servico ADD CONSTRAINT FK_ordem_de_servico_forno_eletrico_venda FOREIGN KEY (id_forno_eletrico_venda) REFERENCES forno_eletrico_venda(id_forno_eletrico_venda);
ALTER TABLE acessorios ADD CONSTRAINT FK_acessorios_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE acessorios ADD CONSTRAINT FK_acessorios_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial);
ALTER TABLE acessorios ADD CONSTRAINT FK_acessorios_marca FOREIGN KEY (id_marcas) REFERENCES marcas(id_marcas);
ALTER TABLE acessorios ADD CONSTRAINT FK_acessorios_condicao FOREIGN KEY (id_condicao) REFERENCES condicao(id_condicao);
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco);
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_microondas_manut FOREIGN KEY (id_microondas_manut) REFERENCES microondas_manut(id_microondas_manut);
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_forno_eletrico_manut FOREIGN KEY (id_forno_eletrico_manut) REFERENCES forno_eletrico_manut(id_forno_eletrico_manut);
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_microondas_venda FOREIGN KEY (id_microondas_venda) REFERENCES microondas_venda(id_microondas_venda);
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_forno_eletrico_venda FOREIGN KEY (id_forno_eletrico_venda) REFERENCES forno_eletrico_venda(id_forno_eletrico_venda);
ALTER TABLE endereco ADD CONSTRAINT FK_endereco_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial);
ALTER TABLE endereco ADD CONSTRAINT FK_endereco_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE endereco ADD CONSTRAINT FK_endereco_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);
ALTER TABLE filial ADD CONSTRAINT FK_filial_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE filial ADD CONSTRAINT FK_filial_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);
ALTER TABLE filial ADD CONSTRAINT FK_filial_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE filial ADD CONSTRAINT FK_filial_pecas FOREIGN KEY (id_pecas) REFERENCES pecas(id_pecas);
ALTER TABLE filial ADD CONSTRAINT FK_filial_acessorios FOREIGN KEY (id_acessorios) REFERENCES acessorios(id_acessorios);
ALTER TABLE filial ADD CONSTRAINT FK_filial_microondas_manut FOREIGN KEY (id_microondas_manut) REFERENCES microondas_manut(id_microondas_manut);
ALTER TABLE filial ADD CONSTRAINT FK_filial_forno_eletrico_manut FOREIGN KEY (id_forno_eletrico_manut) REFERENCES forno_eletrico_manut(id_forno_eletrico_manut);
ALTER TABLE filial ADD CONSTRAINT FK_filial_microondas_venda FOREIGN KEY (id_microondas_venda) REFERENCES microondas_venda(id_microondas_venda);
ALTER TABLE filial ADD CONSTRAINT FK_filial_forno_eletrico_venda FOREIGN KEY (id_forno_eletrico_venda) REFERENCES forno_eletrico_venda(id_forno_eletrico_venda);
ALTER TABLE filial ADD CONSTRAINT FK_filial_setor FOREIGN KEY (id_setor) REFERENCES setor(id_filial);
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_setor FOREIGN KEY (id_setor) REFERENCES setor(id_setor);
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial);
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco);
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_situacao_os FOREIGN KEY (id_situacao_os) REFERENCES situacao_os(id_situacao_os);
ALTER TABLE mao_de_obra ADD CONSTRAINT FK_mao_de_obra_setor FOREIGN KEY (id_setor) REFERENCES setor(id_setor);
ALTER TABLE mao_de_obra ADD CONSTRAINT FK_mao_de_obra_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE marcas ADD CONSTRAINT FK_marcas_microondas_manut FOREIGN KEY (id_microondas_manut) REFERENCES microondas_manut(id_microondas_manut);
ALTER TABLE marcas ADD CONSTRAINT FK_marcas_microondas_venda FOREIGN KEY (id_microondas_venda) REFERENCES microondas_venda(id_microondas_venda);
ALTER TABLE marcas ADD CONSTRAINT FK_marcas_forno_eletrico_manut FOREIGN KEY (id_forno_eletrico_manut) REFERENCES forno_eletrico_manut(id_forno_eletrico_manut);
ALTER TABLE marcas ADD CONSTRAINT FK_marcas_forno_eletrico_venda FOREIGN KEY (id_forno_eletrico_venda) REFERENCES forno_eletrico_venda(id_forno_eletrico_venda);
ALTER TABLE marcas ADD CONSTRAINT FK_marcas_pecas FOREIGN KEY (id_pecas) REFERENCES pecas(id_pecas);
ALTER TABLE marcas ADD CONSTRAINT FK_marcas_acessorios FOREIGN KEY (id_acessorios) REFERENCES acessorios(id_acessorios);
ALTER TABLE microondas_manut ADD CONSTRAINT FK_microondas_manut_marcas FOREIGN KEY (id_marcas) REFERENCES marcas(id_marcas);
ALTER TABLE microondas_manut ADD CONSTRAINT FK_microondas_manut_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE microondas_manut ADD CONSTRAINT FK_microondas_manut_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE microondas_venda ADD CONSTRAINT FK_microondas_venda_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE microondas_venda ADD CONSTRAINT FK_microondas_venda_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial);
ALTER TABLE microondas_venda ADD CONSTRAINT FK_microondas_venda_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE microondas_venda ADD CONSTRAINT FK_microondas_venda_condicao FOREIGN KEY (id_condicao) REFERENCES condicao(id_condicao);
ALTER TABLE forno_eletrico_manut ADD CONSTRAINT FK_forno_eletrico_marcas FOREIGN KEY (id_marcas) REFERENCES marcas(id_marcas);
ALTER TABLE forno_eletrico_manut ADD CONSTRAINT FK_forno_eletrico_manut_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE forno_eletrico_manut ADD CONSTRAINT FK_forno_eletrico_manut_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE forno_eletrico_venda ADD CONSTRAINT FK_forno_eletrico_venda_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE forno_eletrico_venda ADD CONSTRAINT FK_forno_eletrico_venda_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial);
ALTER TABLE forno_eletrico_venda ADD CONSTRAINT FK_forno_eletrico_venda_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE forno_eletrico_venda ADD CONSTRAINT FK_forno_eletrico_venda_condicao FOREIGN KEY (id_condicao) REFERENCES condicao(id_condicao);
ALTER TABLE pecas ADD CONSTRAINT FK_pecas_marcas FOREIGN KEY (id_marcas) REFERENCES marcas(id_marcas);
ALTER TABLE pecas ADD CONSTRAINT FK_pecas_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE pecas ADD CONSTRAINT FK_pecas_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial);
ALTER TABLE pecas ADD CONSTRAINT FK_pecas_condicao FOREIGN KEY (id_condicao) REFERENCES condicao(id_condicao);
ALTER TABLE setor ADD CONSTRAINT FK_setor_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filial);
ALTER TABLE setor ADD CONSTRAINT FK_setor_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);
ALTER TABLE setor ADD CONSTRAINT FK_setor_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE setor ADD CONSTRAINT FK_setor_mao_de_obra FOREIGN KEY (id_mao_de_obra) REFERENCES mao_de_obra(id_mao_de_obra);
ALTER TABLE situacao_os ADD CONSTRAINT FK_situacao_os_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE tipo_de_servico ADD CONSTRAINT FK_tipo_de_servico_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE condicao ADD CONSTRAINT FK_condicao_pecas FOREIGN KEY (id_pecas) REFERENCES pecas(id_pecas);
ALTER TABLE condicao ADD CONSTRAINT FK_condicao_acessorios FOREIGN KEY (id_acessorios) REFERENCES acessorios(id_acessorios);
ALTER TABLE condicao ADD CONSTRAINT FK_condicao_microondas_venda FOREIGN KEY (id_microondas_venda) REFERENCES microondas_venda(id_microondas_venda);
ALTER TABLE condicao ADD CONSTRAINT FK_condicao_forno_eletrico_venda FOREIGN KEY (id_forno_eletrico_venda) REFERENCES forno_eletrico_venda(id_forno_eletrico_venda);
ALTER TABLE forma_de_pagamento ADD CONSTRAINT FK_forma_de_pagamento_plano_de_pagamento FOREIGN KEY (id_plano_de_pagamento) REFERENCES plano_de_pagamento(id_plano_de_pagamento);
ALTER TABLE forma_de_pagamento ADD CONSTRAINT FK_forma_de_pagamento_ordem_de_servico FOREIGN KEY (id_ordem_de_servico) REFERENCES ordem_de_servico(id_ordem_de_servico);
ALTER TABLE plano_de_pagamento ADD CONSTRAINT FK_plano_de_pagamento_forma_de_pagamento FOREIGN KEY (id_forma_de_pagamento) REFERENCES forma_de_pagamento(id_forma_de_pagamento);
ALTER TABLE situacao_funcionario ADD CONSTRAINT FK_situacao_funcionario_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);
