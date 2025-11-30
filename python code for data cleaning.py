Python 3.13.7 (tags/v3.13.7:bcee1c3, Aug 14 2025, 14:15:11) [MSC v.1944 64 bit (AMD64)] on win32
Enter "help" below or click "Help" above for more information.
>>> import pandas as pd
... import os
... import re
... 
... # Folder containing your original CSVs
... input_folder = r"C:\Users\AKANSHA KUMARI\Desktop\job posting\companies"
... # Folder to save cleaned CSVs (your Desktop)
... output_folder = r"C:\Users\AKANSHA KUMARI\Desktop\job"
... 
... os.makedirs(output_folder, exist_ok=True)
... 
... # Function to clean text
... def clean_text(text):
...     if pd.isna(text):
...         return text
...     # Remove non-printable characters
...     text = ''.join(c for c in text if c.isprintable())
...     # Remove non-ASCII characters
...     text = re.sub(r'[^\x00-\x7F]+', '', text)
...     return text
... 
... # Loop through all CSV files
... for filename in os.listdir(input_folder):
...     if filename.endswith(".csv"):
...         file_path = os.path.join(input_folder, filename)
...         df = pd.read_csv(file_path)
...         # Clean all string columns
...         for col in df.select_dtypes(include=['object']).columns:
...             df[col] = df[col].apply(clean_text)
...         # Save cleaned CSV as UTF-8
...         df.to_csv(os.path.join(output_folder, filename), index=False, encoding='utf-8')
