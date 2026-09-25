# Adventure Works Analytics Engineering Project

## Visão Geral

Este projeto tem como objetivo construir uma plataforma moderna de analytics para a área de vendas da Adventure Works, utilizando conceitos de Data Warehouse, modelagem dimensional, dbt e Business Intelligence.

A solução foi desenvolvida seguindo a arquitetura Modern Data Stack, contemplando ingestão, transformação, testes, documentação e disponibilização dos dados para consumo analítico.

---

## Objetivos de Negócio

O projeto foi desenvolvido para responder perguntas estratégicas da área comercial, permitindo análises sobre:

- Número de pedidos;
- Quantidade comprada;
- Valor total negociado;
- Ticket médio;
- Top clientes;
- Top cidades;
- Análises temporais de vendas;
- Produtos mais vendidos por motivo de venda;
- Análises por cliente, produto, localização, cartão e status do pedido.

---

## Arquitetura da Solução

```text
Adventure Works
        │
        ▼
     Sources
        │
        ▼
     Staging
        │
        ▼
   Intermediate
        │
        ▼
      Marts
        │
        ▼
    Power BI
````

## Stack Utilizada
Databricks
dbt Cloud
GitHub
Power BI

## Estrutura do Projeto

```text
models/
│
├── staging/
│
├── intermediate/
│
└── marts/
    ├── dimensions/
    └── facts/
````


### Camada Staging
Responsável por:

* Padronização dos nomes das colunas;
* Conversão de tipos de dados;
* Limpeza inicial dos dados;
* Aplicação de testes de qualidade.

### Camada Intermediate
Responsável por:

* Consolidação de relacionamentos;
* Criação de surrogate keys;
* Aplicação de regras de negócio;
* Preparação dos dados para os marts.

### Camada Marts

* Contém o modelo dimensional utilizado pelo Power BI.

## Modelo Dimensional

### Tabela Fato
fct_vendas

### Dimensões
dim_produto
dim_cliente
dim_localidade
dim_cartao
dim_motivo_venda
dim_status
dim_data


## Qualidade dos Dados

Foram implementados:
* Testes de Sources;
* Testes de Unique;
* Testes de Not Null;
* Testes de Chaves Primárias;
* Testes de Integridade das Dimensões;
* Teste de Auditoria solicitado pela diretoria.

### Auditoria

* Validação das vendas brutas do ano de 2011 conforme requisito do desafio.

### Dashboard

O dashboard foi desenvolvido para responder todas as perguntas de negócio propostas no desafio:

Indicadores gerais de vendas;
Desempenho por produto;
Top 10 clientes;
Top 5 cidades;
Séries temporais;
Ticket médio;
Produto com maior volume vendido para o motivo de venda "Promotion".


### Como Executar
* dbt deps
* dbt run
* dbt test
* dbt test --select source:*
* dbt docs generate
