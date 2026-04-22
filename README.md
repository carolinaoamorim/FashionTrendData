# Análise de Tendências - (Fashion Dataset 2018-2022)

## Sobre o projeto

Este projeto foi desenvolvido com o objetivo de analisar um conjunto de dados de moda usando **Python** e **Prolog** e analisar tendências com base na quantidade de produtos vendido, avaliação média e quantidade em wish lists. Com isso foi possível analisar padrões de compras - como tipo de produto, estampa e categoria - baseado no ano e estação.

A proposta principal foi transformar dados de um arquivo `.csv` em uma **base de conhecimento lógica**, para que fosse possível fazer consultas e conclusões sobre tendências de moda.

O projeto funciona em duas etapas:

1. **Tratamento dos dados em Python**  

   O arquivo CSV (base de dados original) é lido, filtrado e normalizado para gerar fatos no formato aceito pelo Prolog.

2. **Análise em Prolog**  

   A base nova gerada na etapa anterior é usada para criar regras lógicas e responder perguntas sobre padrões de moda, tendências de vendas, popularidade e avaliações.

---

## O que o código faz

A partir do dataset original, o código:

- seleciona apenas as colunas selecionadas (as mais relevantes para as análises)

- padroniza os dados textuais para o formato do Prolog

- gera uma base de fatos com informações sobre peças

- cria regras para analisar padrões no dataset

- responde perguntas sobre tendências de moda

---

## Perguntas 

1. **Qual estampa é a favorita para a primavera?**  

   A estampa com maior soma de `wish_list_count` na estação `spring`.

2. **Em qual ano os biker shorts foram tendência?**  

   O ano em que `biker_shorts` teve a maior soma de `sales_count`.

3. **Qual foi o melhor produto do inverno?**  

   A categoria com maior média de `average_rating` na estação `winter`.

## Estrutura dos arquivos

```bash

├── fashion_data_2018_2022.csv   # dataset original

├── gerar_base.py                # script python que gera os fatos Prolog

├── base_fashion.pl              # base de fatos gerada

├── regras_fashion.pl            # regras lógicas em Prolog

└── queries_fashion.pl           # consultas utilizadas para testar (as perguntas)

```
---

## Desenvolvimento do projeto

### Seleção dos dados

Foram utilizadas as seguintes colunas do banco de dados original:

- product_id  

- product_name  

- category  

- pattern  

- season  

- sales_count  

- average_rating  

- wish_list_count  

- year_of_sale  

Para poder extrair informações como categoria, estampa, e estação por quantidade de vendas, avaliação média, quantidade em wish list e ano

---

### Normalização dos dados

Os dados foram padronizados para o formato aceito pelo Prolog:

- letras minúsculas  

- substituição de espaços por `_`  

- remoção de caracteres especiais  

Exemplo:

- `Biker Shorts` → `biker_shorts`  

- `Floral Print` → `floral_print`  

---

### Geração dos fatos em Prolog

Cada linha do dataset é convertida para o formato:

```prolog

peca(ProductID, ProductName, Category, Pattern, Season, SalesCount, AverageRating, WishListCount, YearOfSale).

```
---

### Regras no Prolog

As regras permitem:

* Filtrar dados por estação (no caso ultilizei primavera e inverno)
* Somar valores de wishlist e vendas
* Calcular médias
* Encontrar o valor máximo

---

## Como executar

#### Instalar as bibliotecas

rodar:

```bash

pip install pandas

```

#### Gerar a base em Prolog

rodar:

```bash

python3 gerar_base.py

```

que gera o arquivo: 

```bash

base_fashion.pl

```

#### Executar no Prolog - no SWISH

1. Acessar: 

```bash

https://swish.swi-prolog.org/

```

2. Copiar e colar o código em:

```bash

    * base_fashion.pl
    * regras_fashion.pl

```

3. Executar as queries:

?- favorita_primavera(Resultado).
?- ano_bikershorts(Resultado).
?- favorita_inverno(Resultado).

## Tecnologias Ultilizadas

* Python (pandas)
* Prolog (SWI-Prolog / SWISH)
* CSV (dataset)