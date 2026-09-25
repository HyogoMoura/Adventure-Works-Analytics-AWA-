# Adventure-Works-Analytics-AWA-

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
