import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset from a CSV file
df = pd.read_csv('path_to_your_file.csv')

# Basic Data Overview
print("Dataset Overview:")
print(df.head())  # Display the first few rows of the dataset
print("\nSummary Statistics:")
print(df.describe())  # Summary statistics of the dataset

# Data Preprocessing
# Convert date columns to datetime format
df['claim_date'] = pd.to_datetime(df['claim_date'])
df['admission_date'] = pd.to_datetime(df['admission_date'])
df['discharge_date'] = pd.to_datetime(df['discharge_date'])

# Insight 1 - Most Common Diagnoses
print("\nMost Common Diagnoses:")
common_diagnoses = df['diagnosis_code'].value_counts().head(10)
print(common_diagnoses)

# Plotting the most common diagnoses
plt.figure(figsize=(10, 6))
sns.barplot(x=common_diagnoses.values, y=common_diagnoses.index, palette="viridis")
plt.title("Top 10 Most Common Diagnoses")
plt.xlabel("Number of Claims")
plt.ylabel("Diagnosis Code")
plt.show()

# Insight 2 - Average Cost per Claim
print("\nAverage Cost per Claim:")
average_cost_per_claim = df['claim_amount'].mean()
print(f"${average_cost_per_claim:.2f}")

# Insight 3 - Claim Submission Trends Over Time
df['year_month'] = df['claim_date'].dt.to_period('M')
claims_trend = df['year_month'].value_counts().sort_index()

# Plotting the claim submission trends over time
plt.figure(figsize=(12, 6))
claims_trend.plot(kind='line', marker='o')
plt.title("Claim Submission Trends Over Time")
plt.xlabel("Year-Month")
plt.ylabel("Number of Claims")
plt.grid(True)
plt.show()

# Insight 4 - Cost Distribution by Insurance Provider
print("\nCost Distribution by Insurance Provider:")
cost_by_provider = df.groupby('insurance_provider')['claim_amount'].sum().sort_values(ascending=False)
print(cost_by_provider)

# Plotting cost distribution by insurance provider
plt.figure(figsize=(12, 6))
sns.barplot(x=cost_by_provider.index, y=cost_by_provider.values, palette="coolwarm")
plt.title("Total Claim Cost by Insurance Provider")
plt.xlabel("Insurance Provider")
plt.ylabel("Total Claim Cost ($)")
plt.xticks(rotation=45)
plt.show()

# Insight 5 - Length of Stay Analysis
df['length_of_stay'] = (df['discharge_date'] - df['admission_date']).dt.days
print("\nLength of Stay Summary Statistics:")
print(df['length_of_stay'].describe())

# Plotting the distribution of length of stay
plt.figure(figsize=(10, 6))
sns.histplot(df['length_of_stay'], bins=20, kde=True, color="skyblue")
plt.title("Distribution of Length of Stay")
plt.xlabel("Length of Stay (days)")
plt.ylabel("Frequency")
plt.show()

# Insight 6 - High-Cost Claims Analysis
high_cost_threshold = df['claim_amount'].quantile(0.95)
high_cost_claims = df[df['claim_amount'] > high_cost_threshold]

print("\nHigh-Cost Claims (Top 5%):")
print(high_cost_claims[['claim_id', 'diagnosis_code', 'claim_amount', 'insurance_provider']])

# Plotting high-cost claims
plt.figure(figsize=(10, 6))
sns.boxplot(data=df, x='insurance_provider', y='claim_amount', palette="Set2")
plt.title("High-Cost Claims by Insurance Provider")
plt.xlabel("Insurance Provider")
plt.ylabel("Claim Amount ($)")
plt.xticks(rotation=45)
plt.yscale('log')
plt.show()

# Insight 7 - Diagnosis Codes and Average Cost
avg_cost_by_diagnosis = df.groupby('diagnosis_code')['claim_amount'].mean().sort_values(ascending=False).head(10)
print("\nTop 10 Diagnosis Codes by Average Claim Cost:")
print(avg_cost_by_diagnosis)

# Plotting average cost by diagnosis code
plt.figure(figsize=(10, 6))
sns.barplot(x=avg_cost_by_diagnosis.values, y=avg_cost_by_diagnosis.index, palette="magma")
plt.title("Top 10 Diagnosis Codes by Average Claim Cost")
plt.xlabel("Average Claim Cost ($)")
plt.ylabel("Diagnosis Code")
plt.show()

# Insight 8 - Total Amount Billed vs Paid
df['billed_vs_paid'] = df['billed_amount'] - df['paid_amount']

# Plotting the total amount billed vs paid
plt.figure(figsize=(10, 6))
sns.scatterplot(x=df['billed_amount'], y=df['paid_amount'], hue='insurance_provider', palette="Spectral")
plt.plot([0, df['billed_amount'].max()], [0, df['paid_amount'].max()], 'r--')  # Line of equality
plt.title("Total Amount Billed vs Paid")
plt.xlabel("Billed Amount ($)")
plt.ylabel("Paid Amount ($)")
plt.show()

# Insight 9 - Total Number of Codes per Claim per Provider
codes_per_claim = df.groupby(['insurance_provider', 'claim_id']).size().unstack().mean(axis=1)

print("\nAverage Number of Codes per Claim per Provider:")
print(codes_per_claim)

# Plotting the average number of codes per claim per provider
plt.figure(figsize=(10, 6))
sns.barplot(x=codes_per_claim.index, y=codes_per_claim.values, palette="cubehelix")
plt.title("Average Number of Codes per Claim per Provider")
plt.xlabel("Insurance Provider")
plt.ylabel("Average Number of Codes")
plt.xticks(rotation=45)
plt.show()

# Insight 10 - Denials per Area
denials_by_area = df[df['claim_status'] == 'Denied'].groupby('area').size()

print("\nDenials by Area:")
print(denials_by_area)

# Plotting denials by area
plt.figure(figsize=(10, 6))
sns.barplot(x=denials_by_area.index, y=denials_by_area.values, palette="autumn")
plt.title("Number of Denials by Area")
plt.xlabel("Area")
plt.ylabel("Number of Denials")
plt.xticks(rotation=45)
plt.show()
