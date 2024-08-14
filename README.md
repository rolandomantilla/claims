# Medical Claims Data Analysis

## Overview
This repository contains a Python script for analyzing medical claims data. The script processes a CSV file containing information about insurance claims and generates various insights through visualizations and statistics.

## Features
- **Most Common Diagnoses:** Identifies and visualizes the top 10 most common diagnosis codes in the dataset.
- **Average Cost per Claim:** Calculates the average claim amount.
- **Claim Submission Trends Over Time:** Analyzes the number of claims submitted each month and visualizes the trend.
- **Cost Distribution by Insurance Provider:** Displays the total claim costs for each insurance provider.
- **Length of Stay Analysis:** Analyzes the distribution of the length of stay for patients.
- **High-Cost Claims Analysis:** Identifies and visualizes claims that are above the 95th percentile in cost.
- **Diagnosis Codes and Average Cost:** Ranks diagnosis codes by the average claim cost.
- **Total Amount Billed vs Paid:** Compares the billed amount versus the paid amount for each claim.
- **Total Number of Codes per Claim per Provider:** Calculates the average number of diagnosis/procedure codes per claim for each provider.
- **Denials per Area:** Identifies the number of denied claims by geographical area.

## Getting Started

### Prerequisites
To run the script, you'll need to have the following installed:
- Python 3.7 or later
- Pandas
- Matplotlib
- Seaborn

You can install the required Python packages using pip:

```bash
pip install pandas matplotlib seaborn
