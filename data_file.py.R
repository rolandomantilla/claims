#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import pandas as pd

# Define the data requirements for the CSV file
data_requirements = {
    'Column Name': [
        'claim_id', 'claim_date', 'admission_date', 'discharge_date',
        'diagnosis_code', 'insurance_provider', 'claim_amount', 
        'billed_amount', 'paid_amount', 'claim_status', 'area'
    ],
    'Data Type': [
        'String', 'Date (YYYY-MM-DD)', 'Date (YYYY-MM-DD)', 'Date (YYYY-MM-DD)',
        'String', 'String', 'Float', 'Float', 'Float', 'String', 'String'
    ],
    'Description': [
        'Unique identifier for each claim',
        'Date the claim was submitted',
        'Date of patient admission to the hospital',
        'Date of patient discharge from the hospital',
        'Code representing the diagnosis',
        'Name of the insurance provider',
        'Amount claimed by the provider',
        'Amount billed by the provider',
        'Amount paid by the insurance provider',
        'Status of the claim (e.g., Approved, Denied)',
        'Geographical area associated with the claim'
    ],
    'Example': [
        'C123456', '2024-01-01', '2024-01-01', '2024-01-10',
        'A123', 'Provider A', '1500.00', '2000.00', '1500.00', 'Approved', 'New York'
    ]
}

# Create a DataFrame to hold the data requirements
df_requirements = pd.DataFrame(data_requirements)

# Save the DataFrame to a CSV file
df_requirements.to_csv('data_requirements.csv', index=False)

print("Data requirements file 'data_requirements.csv' created successfully.")
