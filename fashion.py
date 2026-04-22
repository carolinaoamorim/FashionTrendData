import pandas as pd
import re

# ler e filtrar o data set

df = pd.read_csv("fashion_data_2018_2022.csv")

COLUNAS = [
    "product_id",
    "product_name",
    "category",
    "pattern",
    "season",
    "sales_count",
    "average_rating",
    "wish_list_count",
    "year_of_sale"
]

# filtra o dataset para as 9 colunas -> escolhi oque eu acho que vai ser mais interessante para as perguntas
df_filtered = df[COLUNAS].copy()

# remove as linhas com valor nulo
df_filtered = df_filtered.dropna()

# "normalizar" e padronizar as tabelas para o prolog conseguir ler
def normalizar_data(data):
    text = str(data).strip().lower()
    text = text.replace(" ", "_").replace("-", "_").replace("/", "_")
    text = re.sub(r"[^a-z0-9_]", "", text)
    return text

with open("base_fashion.pl", "w", encoding="utf-8") as f: # se nao existir o arquivo ele cria

    # percorre o arquivo filtrado e normaliza/padroniza os dados
    for _, row in df_filtered.iterrows():
        product_id = int(row["product_id"])
        product_name = normalizar_data(row["product_name"])
        category = normalizar_data(row["category"])
        pattern = normalizar_data(row["pattern"])
        season = normalizar_data(row["season"])
        sales_count = int(row["sales_count"])
        average_rating = float(row["average_rating"])
        wish_list_count = int(row["wish_list_count"])
        year_of_sale = int(row["year_of_sale"])

        line = (
            f"peca({product_id}, {product_name}, {category}, {pattern}, {season}, {sales_count}, {average_rating}, {wish_list_count}, {year_of_sale}).\n"
        )
        f.write(line)