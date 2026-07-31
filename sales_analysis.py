import pandas as pd
df = pd.read_csv("SampleSuperstore_clean_data.csv")
print(df.head()) #head gives top 5 row of dataset

print(df.shape)         #shap describe sixe of dataset
print(df.columns)       #column describe how many rows and column
print(df.info())        #info describe full info
print(df.describe())    # Statistical Summary
print(df.isnull().sum())  #this give total sum of missing values

print(df["Sales"].sum())
print(df["Profit"].sum())
print(df["Sales"].mean())
print(df["Sales"].max())
print(df["Sales"].min())
 
# FILTERING
print(df[df["Sales"] > 1000]) 

print(df[df["Sales"] < 500])

print(df[df["Profit"] < 0])

print(df[(df["Sales"] >500) &( df["Sales"]<1000)])

print(df[df["State"] == "California"])

print(df[df["Category"] == "Technology"])

print(df[(df["Category"] == "Technology") & (df["Sales"] >1000)])

category_sales = df.groupby("Category")["Sales"].sum()
print(category_sales)

category_sales= df.groupby("Category")["Sales"].sum().sort_values(ascending=False)
print(category_sales)

# top state
state_sales = df.groupby("State")["Sales"].sum().sort_values(ascending=False)
print(state_sales)

# top 10 state
state_sales = df.groupby("State")["Sales"].sum().sort_values(ascending=False).head(10)
print(state_sales)

#top cities
city_sales = df.groupby("City")["Sales"].sum().sort_values(ascending=False)
print(city_sales)

#top sub-category
subcategory_profit = df.groupby("Sub-Category")["Profit"].sum().sort_values(ascending=False)
print(subcategory_profit)

#top 10 state
top_10_state = df.groupby("State")["Sales"].sum().sort_values(ascending=False).head(10)
print(top_10_state)

# top 10 cities
top_10_city = df.groupby("City")["Sales"].sum().sort_values(ascending=False).head(10)
print(top_10_city)

# top 10 sub-category profit
top_10_subcategory = df.groupby("Sub-Category")["Profit"].sum().sort_values(ascending=False)
print(top_10_subcategory)

import matplotlib.pyplot as plt
# category wise sales
category_sales = df.groupby("Category")["Sales"].sum()
plt.figure(figsize=(8,5))
plt.bar(category_sales.index,category_sales.values)

plt.title("Category-wise Sales")
plt.xlabel("Category")
plt.ylabel("Total Sales")
plt.show()

# top 10 state by sales
top_10_states = df.groupby("State")["Sales"].sum().sort_values(ascending=False).head(10)
print(top_10_states)

plt.figure(figsize=(10,5))
plt.bar(top_10_states.index, top_10_states.values)
plt.title("Top 10 States By Sales")
plt.xlabel("State")
plt.ylabel("Sales")

plt.xticks(rotation=45)
plt.show()

#top 10 cities by sales
top_10_cities = df.groupby("City")["Sales"].sum().sort_values(ascending=False).head(10)
print(top_10_cities)

plt.figure(figsize=(10,5))
plt.bar(top_10_cities.index, top_10_cities.values)
plt.title("Top 10 Cities by Sales")
plt.xlabel("City")
plt.ylabel("Sales")

plt.xticks(rotation=45)
plt.show()


# top 10 sub-category by profit
top_10_subcategory = df.groupby("Sub-Category")["Profit"].sum().sort_values(ascending=False).head(10)
print(top_10_subcategory)

plt.figure(figsize=(10,5))
plt.bar(top_10_subcategory.index,top_10_subcategory.values)
plt.title("Top 10 Sub-Category by Profit")
plt.xlabel("Sub_Category")
plt.ylabel("Profit")
plt.xticks(rotation=45)
plt.show()

# category wise profit
category_profit = df.groupby("Category")["Profit"].sum()

plt.figure(figsize=(8,5))
plt.bar(category_profit.index, category_profit.values)
plt.title("Category Wise Profit")
plt.xlabel("Categories")
plt.ylabel("Profit")
plt.show()

#Region wise sales
region_sales = df.groupby("Region")["Sales"].sum()

plt.figure(figsize=(8,5))
plt.bar(region_sales.index,region_sales.values)
plt.title("Region wise Sales")
plt.xlabel("Region")
plt.ylabel("Sales")
plt.show()

#Segment wise sale
segment_sales = df.groupby("Segment")["Sales"].sum()

plt.figure(figsize=(8,5))
plt.bar(segment_sales.index,segment_sales.values)
plt.title("Segment Wise Sales")
plt.xlabel("Segment")
plt.ylabel("Sales")
plt.show()


# Corelation Heatmap (it escribe how numeric columns related to each othr)
correlation = df[["Sales", "Profit", "Quantity", "Discount"]].corr()

plt.figure(figsize=(6,5))
plt.imshow(correlation, cmap="coolwarm")

plt.colorbar()

plt.xticks(range(len(correlation.columns)), correlation.columns)
plt.yticks(range(len(correlation.columns)),correlation.columns)

plt.title("Correlation Heatmap")
plt.show()
