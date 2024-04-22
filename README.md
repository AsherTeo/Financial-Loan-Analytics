# Financial Loan Analysis with Dashboard (Below)
<details>
  <summary>Overview</summary>

## Overview

For this project, we utilize a financial loan dataset to delve into insights across various features. Our objectives include determining which categorical features contribute most significantly to profitability, evaluating the impact of interest rates, debt-to-income, annual income on profits, investigating correlations between these variables and profitability, and exploring additional factors of interest. For this analysis, we leverage SQL for data extraction, and Python equipped with the `pandas` library for data analysis, `seaborn` for data visualization, and `scikit-learn` for machine learning. Furthermore, we enhance our visualization with the interactive dashboard features of **Power BI** , providing more detailed and dynamic visualizations. 

Subsequently, we trained and optimized a machine learning model using feature selection techniques such as **Chi-Square** and **ANOVA**, along with `optuna` to select the best hyperparameters for the XGBoost (XGB) model. The target label 'loan status' was used as y in this process. To create a binary classification task determining 'Approved' or 'Not Approved', we modified the 'loan status' variable, assigning the label '1' to instances of 'Current' and 'Fully Paid', and '0' to instances of 'Charged Off'.  This was done to predict whether applicants will be eligible for loans in the future. The process was facilitated through a machine learning graphical user interface (GUI) provided by `gradio`, as demonstrated below. 

If you want to explore further or experiment with the GUI, feel free to check out the script labeled **Gradio.ipynb**.
</details>

<details>
  <summary>Key Features</summary>

## Key Features
- **Financial Loan Dataset**: Extraction of data from Microsoft SQL Server
- **Feature Engineering**: Utilize K-means clustering to group job titles into distinct job categories and remove redundant features such as ID, last_credit_pull_date	last_payment_date, etc
- **Data Analysis**: Performing in-depth analysis of the dataset to extract insights and understand the relationships between different features and loan profitability. 
- **Feature Selection**: Employ feature selection techniques like Chi-Square and ANOVA to eliminate features with p-values exceeding 0.05.
- **Machine Learning Model**: Experiment with various machine learning algorithms including XGBoost, LightGBM, CatBoost, and Random Forest to predict future loan eligibility based on selected features and target labels and assess the performance of each model using the F1 score to determine the best-performing model.
- **Class Imbalance Technique**: Experiment with undersampling techniques like Tomek Links and oversampling techniques like SMOTE to assess if the results improve.
- **Hyperparameter Tuning**: Utilizing Optuna to automatically select the best hyperparameters for the machine learning model, enhancing its predictive performance.
- **Interactive Dashboard**: Enhancing data visualization using Power BI to create detailed and dynamic visualizations for better understanding and interpretation of results.
- **Graphical User Interface (GUI)**: Facilitating the machine learning process through a graphical user interface (GUI) provided by gradio, allowing for easy interaction and prediction of loan eligibility.
</details>

<details>
  <summary>Objective</summary>
  
## Objective

1. **Profitability Analysis:(Power BI)**
   - Identify which categorical features such as months, purpose have the highest and lowest profitability.
   - Analyze factors like interest rate, loan amount, and term to understand their impact on profitability.
     
2. **Loan Performance Analysis: (Machine Learning)**
   - Analyze the loan status column to understand the performance of loans over time.
   - Assess the impact of various features such as employment length, grade, home ownership, and purpose on loan status.
</details>

<details>
  <summary>Methodology</summary>
  
## Methodology

### 1) Data Extraction & Data Wrangling

To demonstrate my SQL skills, I manually import the dataset into Microsoft Server. Using SQL, I generate various results and insights, which are saved in an SQL Report under the SQL folder. Subsequently, I utilize the Python `pyodbc` library to extract the data from the SQL Server for further analysis and processing. Additionally, I conduct data wrangling tasks such as removing duplicates and missing values, and ensuring correct data types are assigned.

### 2) Feature Enginerring

In feature engineering, `Selenium` is utilized to extract the longitude and latitude coordinates of US states, enabling geographical visualization in Power BI. Additionally, K-Means clustering with 29 clusters is applied to categorize job titles into 15 distinct job categories, enhancing the granularity of job classification for deeper analysis. Moreover, employment length values are standardized: durations '1 < years' are transformed to 0 years, and durations exceeding '10 > years' are adjusted to 11 years to ensure compatibility with the XGBoost (XGB) model. Furthermore, months are extracted from the issue_date columns, and profit is calculated by subtracting the loan amount from the total payment.

### 3) Exploratory Data Analysis (EDA)

<details>
  <summary> Univariate Distributions</summary>

We initiate our Exploratory Data Analysis by examining univariate distributions, focusing on both numerical and categorical features. For numerical features, we apply box plot and remove extreme outliers from 'annual income' and 'total account' and assess skewness using the `stats` library, revealing a high right-skewness value of 31.04 for the annual income feature. Given that this is a classification problem, it's worth noting that non-parametric models like XGBoost (XGB) and LightGBM (LGM) are less impacted by skewness. For categorical features, we employ bar plots to analyze the distribution of loan statuses and loan terms:

  - For loan status, 83% have been fully paid, 13% have been charged off, and 2% are currently active.
    
  - Loans with a term of 36 months are nearly three times as common as those with a term of 60 months indicating a strong preference among borrowers for shorter loan durations.
    
  - The majority of loans, comprising around 67%, originate from organizations such as STARBUCKS, while public service accounts for 8% of loans. This trend may be attributed to employee loan programs and the stable employment typically found within these organizations.
    
  - 'Debt Consolidation' accounts for the largest share at 47.2%, followed by credit card debt consolidation at 12%. 'Debt Consolidation' is often chosen for its potential to secure lower interest rates compared to individual debts, resulting in benefits such as interest savings, simplified repayment, and improved creditworthiness
    
  - Approximately 90% of homeownership is divided between rental and mortgage, as owning a home may imply lower financial strain.
    
  - Analysis of popular US states reveals consistent top rankings for California, New York, Florida, and Texas consistently rank among the top five most popular states in the US. Consequently, the number of loans issued tends to be highest in these states. The popularity of these states attracts entrepreneurs and investors, leading to increased economic activity and demand for financial services, including loans.
    
  - There is a noticeable increase in loan issuance towards the end of the year, particularly in December and November. This trend could be attributed to various factors such as end-of-year financial planning, holiday expenses, or seasonal spending patterns. November might see a surge in loan issuance due to the preparation for holiday expenses and end-of-year financial decisions, which often coincide with the upcoming holiday season.
</details>

<details>
  <summary> Bivariate/Multivariate Distributions</summary>
  
1) **Analyzing Profit by State**
   
The top three states, California, New York, and Texas, have generated the highest profits, amounting to 5.4 million, 4 million, and $3 million, respectively. It's worth noting that California, New York, and Texas are among the top 10 most populous states in the U.S., as indicated by [StatsAmerica](https://www.statsamerica.org/sip/rank_list.aspx?rank_label=pop1) which could contribute to their higher profitability due to increased business activity and investment opportunities. Conversely, three states, Tennessee, Nebraska, and Indiana, have incurred negative profits.

2) **Analyzing Profit by Job Title & Purpose**

On average, sectors such as Education, Military, and Financial Services have demonstrated the highest profitability, whereas the self-employed sector exhibits a negative profile. This observation suggests the possibility of reducing the allocation of loans to self-employed individuals, as their ventures are not yielding significant profits. Conversely, there may be an opportunity to increase lending in the Education sector or introduce alternative schemes to attract more borrowers from profitable sectors.

3) **Charged Off Loans with Categorical Features**

In our analysis of loans with a "charged off" status, we observed notable trends. The likelihood of loans being charged off increases as the grading system progresses from 'A' to 'G', with Grade 'G' presenting the highest risk at a 31% charge-off rate. Small business loans stand out, with a quarter of them resulting in charge-offs, consistent with findings indicating negative profitability in this sector. Nebraska exhibits a remarkably high charge-off rate of 60%, aligning with its low profitability percentage. Furthermore, peak charge-off months are May and December, potentially due to seasonal factors such as increased spending on vacations and holiday-related expenses.

4) **Interest Rate with Categorical Features**
   
Higher interest rates often signal increased risk. For example, loans with longer durations, like 60-month terms, typically have higher rates than shorter-term loans, such as 36-month ones. Loan grades also follow this trend, with 'G' graded loans having the highest average rate (22%) and 'A' graded loans the lowest (7%). Rental properties and small business loans tend to have higher rates due to their perceived risk. Military occupations often face higher rates, reflecting the risks involved. December usually sees elevated rates, likely due to holiday spending.

5) **Debt-To-Income with Categorical Features**
   
A higher Debt-to-Income (DTI) ratio usually indicates increased financial risk, showing that a larger portion of income is used to repay debts, potentially straining finances. This risk can be heightened by other factors. For example, borrowers with lower credit grades often have higher DTI ratios, as do those using credit cards due to revolving credit structures. Certain occupations, like military service, may also show higher DTI ratios, influenced by salary structures or deployment-related expenses.

Geographical variations in DTI ratios can offer insights into regional risk profiles. States like Nebraska, with higher DTI ratios, may reflect local economic conditions or cost-of-living factors, contributing to increased financial risk in those areas.
  </details>

### 4) Feature Selection

For feature selection, prior to training, we first utilize chi-square `chi2_contingency` for categorical features and ANOVA `f_oneway` for numerical ones. If the p-values from either method exceed 0.05, we reject the feature. After training, we utilize XGB feature selection parameters to rank the importance of each feature and attempt to remove those with 0 importance. For example, we may replace 'Vermont', 'Tennessee', 'South Dakota', 'Mississippi', and 'Oklahoma' as 'Others' in the 'State' feature to enhance the model's performance.

### 5) Machine Learning 

The first step is to scale the numerical features using Standard Scaler. This is to ensure all numerical features are normalized to a consistent range, preventing certain features from dominating others during model training. Next, categorical features are transformed into one-hot encoding format. The dataset is then divided into an 80-20 split, with 80% designated for training and 20% for testing. Given the severe class imbalance in the dataset, we first train a baseline model to evaluate its performance. Our primary metric is the F1 score, as it combines both precision and recall to assess model effectiveness. 

Subsequently, we address the class imbalance using techniques such as undersampling and oversampling. For undersampling, we employ Tomek Links, which involve removing instances from the majority class that form Tomek links with instances from the minority class, rather than downsampling the larger class to match the size of the smaller class. For oversampling, we utilize SMOTE (Synthetic Minority Over-sampling Technique), which synthesizes instances for the minority class by leveraging K-nearest neighbor relationships. The number of nearest neighbors (K) is adjustable to suit the specific dataset characteristics and modeling objectives.

### Baseline

| Model                  | Precision |   Recall |      F1   |   AUC   |
|------------------------|-----------|----------|-----------|---------|
| XGBoost                | 0.975600	 | 0.975632 |  0.974903 |0.978645 |
| LightGBM               | 0.975928	 | 0.975632 |  0.974754	|0.979514 |
| CatBoost               | 0.975997  | 0.975502 |  0.974543 |0.983205 |
| Deep Learning	         | 0.961656  | 0.962541 |  0.961784	|0.960791 |
| Gradient Boosting      | 0.964339  | 0.963189 |  0.960869 |0.976053 |
| SVM	                   | 0.962597	 | 0.961115	|  0.958429 |0.970057 |
| Logistic Regression    | 0.957500  | 0.957874 |  0.955612 |0.951971 |
| Random Forest          | 0.937530	 | 0.932988 |  0.923629 |0.948796 |
| Extra Tree             | 0.897654  | 0.891380 |  0.861148	|0.905286 |

### UnderSampling (Tomek Links)

| Model                  | Precision |   Recall |      F1   |   AUC   |
|------------------------|-----------|----------|-----------|---------|
| **XGBoost**            | 0.977580	 | 0.977447	| 0.976751	| 0.979257|
| **LightGBM**           | 0.977083	 | 0.976798	| 0.976002	| 0.980277 |
| CatBoost               | 0.975309	 | 0.974854	| 0.973864	| 0.983643 |
| Deep Learning	         |0.960459	 | 0.961244	| 0.960697	| 0.960128 |
| Gradient Boosting      | 0.963253	 | 0.962022	| 0.959535	| 0.975482 |
| SVM	                   | 0.963253	 | 0.961892	| 0.959345	| 0.970672 |
| Logistic Regression    |0.957079	 | 0.957615	| 0.955426	| 0.952283|
| Random Forest          | 0.940920	 | 0.936876	| 0.928749	| 0.948122 |
| Extra Tree             | 0.895023	 | 0.890343	| 0.859823	| 0.898171 |

### After Feature Selection (Top 5)

| Model                  | Precision |   Recall |      F1   |   AUC   |
|------------------------|-----------|----------|-----------|---------|
| **XGBoost Tomek**      | 0.977833	 | 0.977706	| 0.977029	| 0.979802|
| **LightGBM Tomek**     | 0.977612	 | 0.977317	| 0.976549	| 0.980501 |
| XGBoost Baseline       | 0.975600	 | 0.975632	| 0.974903	| 0.978645 |
| LightGBM Baseline	     | 0.975928	 | 0.975632	| 0.974754	| 0.979514 |
| CatBoost Baseline      | 0.975873	 | 0.975373	| 0.974403	| 0.982934 |

### After Hyper parameter tunning (Top 2)

| Model                  | Precision |   Recall |      F1   |   AUC   |
|------------------------|-----------|----------|-----------|---------|
| **XGBoost Tomek Less Feature**     | 0.97808	| 0.977965	| 0.977306	| 0.980706|
| LightGBM Tomek Less Feature        | 0.97783	| 0.977705	| 0.977028	| 0.980501 |

</details>

<details>
  <summary>Machine Learning Graphical User Interface (GUI)</summary>
  
### Machine Learning Graphical User Interface (GUI)
![output](https://github.com/AsherTeo/Financial-Loan-Analytics/assets/78581569/c3c2a1f3-6dd3-41b0-ac4b-32f1a6588c3c)

</details>
