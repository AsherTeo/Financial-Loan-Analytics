# Table of Contents

- [Overview](#overview)
- [Objective](#objective)
- [Key Features](#Key Features)



# Financial Loan Analysis with Dashboard (Below)

## Overview

For this project, we're diving into insights from a financial loan dataset, aiming to uncover key contributors to profitability and understand the effects of variables like interest rates, debt-to-income ratios, and annual income. We'll also explore correlations between these factors and profitability while considering additional relevant factors.

We start by extracting data using **SQL** and perform our analysis using **Python**, leveraging `pandas` for data manipulation, `seaborn` for visualization, and `scikit-learn` for machine learning tasks. Additionally, we enhance our visualizations with **Power BI**'s interactive dashboard features for more detailed and dynamic presentations.

Next, we train and optimize a machine learning model using techniques like  **Chi-Square**  and **ANOVA** for feature selection, and optuna for hyperparameter tuning of the XGBoost (XGB) model. Our target label, 'loan status', is used to create a binary classification task where 'Approved' or 'Not Approved' are determined. To achieve this, we reassign labels, marking instances of 'Current' and 'Fully Paid' as '1' and 'Charged Off' as '0'. This allows us to predict future loan eligibility for applicants. The process is streamlined through a machine learning graphical user interface (GUI) provided by `gradio`, as demonstrated below.

## Objective

1) **Profitability Analysis:(Power BI)**
   
    - Utilize Power BI to identify categorical features such as months and loan purposes with the highest and lowest profitability, while also exploring geographical data to unveil patterns in profitability across diverse states.
    - Explore the impact of factors like interest rate, loan amount, and term on profitability to uncover insights into business performance.
     
2) **Loan Performance Analysis: (Machine Learning)**
   
    - Develop a machine learning model for predicting loan approval in future applications
    - Analyze the influence of features like employment length, loan grade, home ownership, and loan purpose on loan status.
    
## Key Features

<details>
  <summary>Key Features</summary>

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

## Methodology

<details>
  <summary>Methodology</summary>
  
### 1) Data Extraction & Data Wrangling

To demonstrate my SQL skills, I manually import the dataset into Microsoft Server. Using SQL, I generate various results and insights, which are saved in an SQL Report under the SQL folder. Subsequently, I utilize the Python `pyodbc` library to extract the data from the SQL Server for further analysis and processing. Additionally, I conduct data wrangling tasks such as removing duplicates and missing values, and ensuring correct data types are assigned.

### 2) Feature Enginerring

In feature engineering, `Selenium` is utilized to extract the longitude and latitude coordinates of US states, enabling geographical visualization in Power BI. Additionally, K-Means clustering with 29 clusters is applied to categorize job titles into 15 distinct job categories, enhancing the granularity of job classification for deeper analysis. Moreover, employment length values are standardized: durations '1 < years' are transformed to 0 years, and durations exceeding '10 > years' are adjusted to 11 years to ensure compatibility with the XGBoost (XGB) model. Furthermore, months are extracted from the issue_date columns, and profit is calculated by subtracting the loan amount from the total payment.

### 3) Exploratory Data Analysis (EDA)

**Univariate Distributions**

<details>
  <summary> Univariate Distributions</summary>

We initiate our Exploratory Data Analysis by examining univariate distributions, focusing on both numerical and categorical features. For numerical features, we apply box plot and remove extreme outliers from 'annual income' and 'total account' and assess skewness using the `stats` library, revealing a high right-skewness value of 31.04 for the annual income feature. Given that this is a classification problem, it's worth noting that non-parametric models like XGBoost (XGB) and LightGBM (LGM) are less impacted by skewness. For categorical features, we employ bar plots to analyze the distribution of loan statuses and loan terms:

![image](https://github.com/AsherTeo/Financial-Loan-Analytics/assets/78581569/b0aa5591-150e-4485-8f6d-7d696ebecc61)

  - Loans with a term of 36 months are nearly three times as common as those with a term of 60 months indicating a strong preference among borrowers for shorter loan durations.
    
  - Analysis of popular US states reveals consistent top rankings for California, New York, Florida, and Texas consistently rank among the top five most popular states in the US. Consequently, the number of loans issued tends to be highest in these states. The popularity of these states attracts entrepreneurs and investors, leading to increased economic activity and demand for financial services, including loans.
    
  - There is a noticeable increase in loan issuance towards the end of the year, particularly in December and November. This trend could be attributed to various factors such as end-of-year financial planning, holiday expenses, or seasonal spending patterns. November might see a surge in loan issuance due to the preparation for holiday expenses and end-of-year financial decisions, which often coincide with the upcoming holiday season.
</details>

**Bivariate/Multivariate Distributions**

<details>
  <summary> Bivariate/Multivariate Distributions</summary>
  
1) **Analyzing Profit by State**
   
    ![image](https://github.com/AsherTeo/Financial-Loan-Analytics/assets/78581569/505678a4-c915-4cb3-8236-189b7257da11)

The top three states, California, New York, and Texas, have generated the highest profits, amounting to 5.4 million, 4 million, and $3 million, respectively. It's worth noting that California, New York, and Texas are among the top 10 most populous states in the U.S., as indicated by [StatsAmerica](https://www.statsamerica.org/sip/rank_list.aspx?rank_label=pop1) which could contribute to their higher profitability due to increased business activity and investment opportunities. Conversely, three states, Tennessee, Nebraska, and Indiana, have incurred negative profits.

2) **Analyzing Profit by Job Title & Purpose**

![image](https://github.com/AsherTeo/Financial-Loan-Analytics/assets/78581569/b7e02fd1-9bc0-4da7-ac2d-b4b18415856b)

On average, sectors such as Education, Military, and Financial Services have demonstrated the highest profitability, whereas the self-employed sector exhibits a negative profile. This observation suggests the possibility of reducing the allocation of loans to self-employed individuals, as their ventures are not yielding significant profits. Conversely, there may be an opportunity to increase lending in the Education sector or introduce alternative schemes to attract more borrowers from profitable sectors.

3) **Charged Off Loans with Categorical Features**

![image](https://github.com/AsherTeo/Financial-Loan-Analytics/assets/78581569/f1dd2051-f608-4f49-84bc-d3778103ccd5)

In our analysis of loans with a "charged off" status, we observed notable trends. The likelihood of loans being charged off increases as the grading system progresses from 'A' to 'G', with Grade 'G' presenting the highest risk at a 31% charge-off rate. Small business loans stand out, with a quarter of them resulting in charge-offs, consistent with findings indicating negative profitability in this sector. Nebraska exhibits a remarkably high charge-off rate of 60%, aligning with its low profitability percentage. Furthermore, peak charge-off months are May and December, potentially due to seasonal factors such as increased spending on vacations and holiday-related expenses.

  </details>

### 4) Feature Selection

For feature selection, prior to training, we first utilize chi-square `chi2_contingency` for categorical features and ANOVA `f_oneway` for numerical ones. If the p-values from either method exceed 0.05, we reject the feature. After training, we utilize XGB feature selection parameters to rank the importance of each feature and attempt to remove those with 0 importance. For example, we may replace 'Vermont', 'Tennessee', 'South Dakota', 'Mississippi', and 'Oklahoma' as 'Others' in the 'State' feature to enhance the model's performance.

### 5) Machine Learning 

The first step is to scale the numerical features using Standard Scaler. This is to ensure all numerical features are normalized to a consistent range, preventing certain features from dominating others during model training. Next, categorical features are transformed into one-hot encoding format. The dataset is then divided into an 80-20 split, with 80% designated for training and 20% for testing. Given the severe class imbalance in the dataset, we first train a baseline model to evaluate its performance. Our primary metric is the F1 score, as it combines both precision and recall to assess model effectiveness. 

Subsequently, we address the class imbalance using techniques such as undersampling and oversampling. For undersampling, we employ Tomek Links, which involve removing instances from the majority class that form Tomek links with instances from the minority class, rather than downsampling the larger class to match the size of the smaller class. For oversampling, we utilize SMOTE (Synthetic Minority Over-sampling Technique), which synthesizes instances for the minority class by leveraging K-nearest neighbor relationships. The number of nearest neighbors (K) is adjustable to suit the specific dataset characteristics and modeling objectives. Despite Tomek Links yielding slight improvements in model performance, SMOTE did not prove effective in my case.

Moving to feature selection with XGB models, 'Vermont', 'Tennessee', 'South Dakota', 'Mississippi', and 'Oklahoma' in the 'State' feature are replaced with 'Others' due to their lower importance. The model is then re-trained with the reduced feature set. 

Finally, we employ `Optuna` to optimize the models by tuning the parameters of XGBoost with Tomek Links and LightGBM with Tomek Links. This optimization process ensures that the models perform optimally by fine-tuning their parameters based on specified evaluation metrics. Our top-performing model is determined to be XGBoost with Tomek Links after the optimization process. 
</details>

### Result

The table presented below is sorted based on the F1 score of each model.

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
| **XGBoost Tomek Less Feature**     | 0.97808	| 0.977965	| **0.977306**	| 0.980706|
| LightGBM Tomek Less Feature        | 0.97783	| 0.977705	| 0.977028	| 0.980501 |

Our top-performing model, utilizing XGBoost with Tomek Links and a reduced feature set, was achieved with the following hyperparameters: 'gamma': 0.04994580917280129, 'learning_rate': 0.05122322664789635, 'max_depth': 30, and 'n_estimators': 1903.



## Financial Loan Analysis Dashboard 

![powerbi_video1 (3)](https://github.com/AsherTeo/Financial-Loan-Analytics/assets/78581569/974841b8-b320-417e-9cd4-e1becd912c1b)

## Loan Approved Predictor

In this demo, we have integrated our optimized machine learning models into Gradio, leveraging its intuitive graphical user interface (GUI) capabilities for an enhanced user experience. With Gradio, users can effortlessly adjust parameters and interact with our machine learning model to predict loan approval status. Simply click and adjust the parameters to observe how changes affect the Loan Approved predictor's decision. 

Explore the power of machine learning in action with just a few clicks!

![output](https://github.com/AsherTeo/Financial-Loan-Analytics/assets/78581569/c3c2a1f3-6dd3-41b0-ac4b-32f1a6588c3c)

If you want to explore further or experiment with the GUI, feel free to check out the script labeled **Gradio.ipynb**.

## Installation
  
<details>
  <summary>Installation</summary>
  
The code is developed using Python version 3.10.14  If Python is not already installed on your system, you can download it [here](https://www.python.org/downloads/). If your current Python version is lower than 3.10.14  you can upgrade it using the pip package manager. Make sure you have the latest version of pip installed. To install the necessary packages and libraries, execute the following command in the project directory after cloning the repository:

```bash
pip install -r requirements.txt
```
  </details>
  
## Top 5 Importance Features

<details>
  <summary>Top 5 Importance Features</summary>
  
1) **Profitability Analysis:(Power BI)**
   
    **Top Numerical Features**
   
   1) Total Payment(Correlation: 0.577):
     Total repayment plays a crucial role in our loan profitability. It's essential to select borrowers wisely, and leveraging predictive modeling can help identify those likely to repay.
      
   2) Installment(Correlation: 0.196):
     While not as impactful as total payment, the consistency and affordability of installment payments are vital for financial stability.
      
   3) Loan Amount(Correlation: 0.135):
     Regardless of its size, the loan amount significantly influences financial outcomes, emphasizing the need for careful loan sizing strategies.

    **Top Categorical Features**
   
   4) Term:
     Shorter loan terms show potential to boost profitability. Offering additional options with shorter terms, such as 24 or 48 months, can cater to diverse borrower needs.
      
   5) Grade:
      Borrower risk, determined by their grade, is correlated with loan performance. Lower-risk borrowers typically lead to better financial results.

2) **Loan Performance Analysis: (Machine Learning)**

   The Loan Performance Analysis revealed the following key features using XGB that significantly impact loan performance:
   
   1) Loan Amount (12.76%):
      The amount of the loan is a significant factor, indicating that larger or smaller loan amounts may affect performance.
      
   2) Total Payment (7.54%):
      Total payment is important factors as it influnces the likelihood of loan approval, indicating that the borrower's capacity which is a critical factor to consider during the approval process.
      
   3) Installment (6.33%):
      The monthly payment ranks among the top 5 important features, indicating the applicant's ability to manage regular payments.
      
   4) Terms (36 Months) (4.81%):
      Loans with a 36-month term suggest a higher likelihood of loan approval, as shorter repayment periods are generally easier to manage compared to 72 months.
      
   5) Grade (A) (1.59% ):
      Borrowers with Grade A rating, representing the least risk, show a slight impact on loan performance, indicating a correlation between lower risk levels and better loan performance.
 </details>  
 
## Conclusion 

In conclusion, the features of total payment, installment consistency, loan amount, loan term, and borrower grade are crucial for both loan profitability and approval. Total payment and installment consistency reflect borrower commitment and financial responsibility, essential for successful loan approval. The loan amount, term, and borrower grade provide valuable insights into loan profitability and performance. Leveraging predictive models that consider these factors allows Bank to select the right borrowers, maximizing profitability. In essence, by focusing on these key features, bank can optimize their lending practices and drive sustainable growth.






