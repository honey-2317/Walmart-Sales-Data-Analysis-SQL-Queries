**Walmart Sales Data Analysis**

**About**

This project is designed to analyze Walmart sales data with the objective of gaining insights into the top-performing branches and products. The focus includes understanding the sales trends of various products and examining customer behavior. The overarching goal is to assess how sales strategies can be enhanced and optimized for improved performance. The dataset utilized in this analysis was sourced from the Kaggle Walmart Sales Forecasting Competition.
"In the context of this recruitment competition, participants are presented with historical sales data encompassing 45 Walmart stores situated in diverse regions. Each store comprises multiple departments, and the task for participants involves forecasting sales for each department within every store. To introduce an additional layer of complexity, the dataset incorporates selected holiday markdown events. These markdowns are acknowledged to influence sales; however, predicting the specific departments affected and the magnitude of their impact poses a challenging aspect of the competition."

**Purposes Of The Project**

The primary objective of this project is to acquire insights from Walmart's sales data, aiming to comprehend the various factors influencing the sales performance across different branches.

**About Data**

The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

![WhatsApp Image 2024-01-08 at 23 33 50](https://github.com/honey-2317/Walmart-Sales-Data-Analysis-SQL-Queries/assets/140439533/29d79413-df90-446e-abcb-3d4f3e7c4f61)


**Analysis List**

**Product Analysis**

Performing an in-depth analysis on the dataset is crucial to gain insights into various product lines at Walmart. This analysis aims to identify the top-performing product lines and pinpoint areas that require improvement. By examining sales data, trends, and customer behaviors, the goal is to assess the relative success of different product lines and provide actionable recommendations for optimization and enhancement.

**Sales Analysis**

This analysis focuses on understanding the sales trends of products. The insights derived aim to gauge the effectiveness of implemented sales strategies, facilitating identification of necessary modifications for increased sales.

**Customer Analysis**

This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.

**Approach Used**

**Data Wrangling:**

During the initial step, the data undergoes thorough inspection to identify and address any NULL or missing values. Appropriate data replacement methods are employed to handle such instances. The creation of a database involves building tables and inserting data. Notably, we have set fields as NOT NULL during table creation, ensuring the absence of NULL values in our database.

**Feature Engineering:**

This stage involves generating new columns from existing ones. A "time_of_day" column is added to provide insights into sales during morning, afternoon, and evening, aiding in understanding peak sales periods. Another column, "day_name," is introduced to display the extracted days of the week for each transaction, offering insights into the busiest days for each branch. Additionally, a "month_name" column is created to identify the months of the year for transactions, facilitating analysis of monthly sales and profit trends.

**Exploratory Data Analysis (EDA):**

Exploratory data analysis is conducted to address project objectives and answer specific questions. This phase involves an in-depth examination of the dataset to extract meaningful insights, exploring various aspects such as sales trends, sales strategies, and factors influencing sales performance.

**Business Questions To Answer**

**Generic Question**

How many unique cities does the data have?
In which city is each branch?

**Product**

How many unique product lines does the data have?

What is the most common payment method?

What is the most selling product line?

What is the total revenue by month?

What month had the largest COGS?

What product line had the largest revenue?

What is the city with the largest revenue?

What product line had the largest VAT?

Which branch sold more products than average product sold?

What is the most common product line by gender?

What is the average rating of each product line?


**Sales**

Number of sales made in each time of the day per weekday

Which of the customer types brings the most revenue?

Which city has the largest tax percent/ VAT (Value Added Tax)?

Which customer type pays the most in VAT?


**Customer**

How many unique customer types does the data have?

How many unique payment methods does the data have?

What is the most common customer type?

Which customer type buys the most?

What is the gender of most of the customers?

What is the gender distribution per branch?

Which time of the day do customers give most ratings?

Which time of the day do customers give most ratings per branch?

Which day fo the week has the best avg ratings?

Which day of the week has the best average ratings per branch?



