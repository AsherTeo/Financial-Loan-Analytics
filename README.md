# Financial Loan Analysis with Dashboard (Below)

## Overview

In the initial phase of this project, we utilize a financial loan dataset to delve into insights across various features. Our objectives include determining which categorical features contribute most significantly to profitability, evaluating the impact of interest rates, debt-to-income, annual income on profits, investigating correlations between these variables and profitability, and exploring additional factors of interest. For this analysis, we leverage SQL for data extraction, and Python equipped with the `pandas` library for data analysis, `seaborn` for data visualization, and `scikit-learn` for machine learning. Furthermore, we enhance our visualization with the interactive dashboard features of **Power BI** , providing more detailed and dynamic visualizations. 

Subsequently, we trained and optimized a machine learning model using feature selection techniques such as **Chi-Square** and **ANOVA**, along with `optuna` to select the best hyperparameters for the XGBoost (XGB) model. The target label 'loan status' was used as y in this process. To create a binary classification task determining 'Approved' or 'Not Approved', we modified the 'loan status' variable, assigning the label '1' to instances of 'Current' and 'Fully Paid', and '0' to instances of 'Charged Off'.  This was done to predict whether applicants will be eligible for loans in the future. The process was facilitated through a machine learning graphical user interface (GUI) provided by `gradio`, as demonstrated below. 

If you want to explore further or experiment with the GUI, feel free to check out the script labeled **Gradio.ipynb**.

## Key Features
- **Financial Loan Dataset**: Extraction of data from Microsoft SQL Server
- **Feature Engineering**: Using K-means to cluster job titles into job category
- **Data Analysis**: Performing in-depth analysis of the dataset to extract insights and understand the relationships between different features and loan profitability. 
- **Feature Selection**: Employ feature selection techniques like Chi-Square and ANOVA to eliminate features with p-values exceeding 0.05.
- **Machine Learning Model**: Training and tesing mutiple machine learning such as XGB, LGMboost, CAT , random forest to predict future loan eligibility based on selected features and target labels.
-  **Class Imbalance Technique**: Experiment with undersampling techniques like Tomek Links and oversampling techniques like SMOTE to assess if the results improve.
- **Hyperparameter Tuning**: Utilizing Optuna to automatically select the best hyperparameters for the machine learning model, enhancing its predictive performance.
- **Interactive Dashboard**: Enhancing data visualization using Power BI to create detailed and dynamic visualizations for better understanding and interpretation of results.
- **Graphical User Interface (GUI)**: Facilitating the machine learning process through a graphical user interface (GUI) provided by gradio, allowing for easy interaction and prediction of loan eligibility.

## Methodology

### 5) Hypothesis Overview



![output](https://github.com/AsherTeo/Financial-Loan-Analytics/assets/78581569/c3c2a1f3-6dd3-41b0-ac4b-32f1a6588c3c)
