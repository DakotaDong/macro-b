import os
import pandas as pd

df = pd.read_csv('order_family.csv',sep=",")


order_names = df["order_scientificName"].unique().tolist()
order_dict = dict()

for index, row in df.iterrows():
    order = "-".join(row[0].split(" ")).lower()
    family = "-".join(row[1].split(" ")).lower()

    if order in order_dict.keys():
        order_dict[order].append(family)
    else:
        order_dict[order] = [family]

for order_name,item in order_dict.items():
    os.makedirs(os.path.join(order_name, "dc"))
    for family_name in item:
        os.makedirs(os.path.join(order_name, family_name))
        os.makedirs(os.path.join(order_name, family_name,"dc"))
        os.makedirs(os.path.join(order_name, family_name,"ventral"))
        os.makedirs(os.path.join(order_name, family_name,"dorsal"))
