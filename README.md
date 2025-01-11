# DataBird_AE_LocalBike
DataBird - Analytics Engineer - Cas final (Gsheets/BigQuery/dbt)


## Overview  
The DataBird_AE_LocalBike project aims to provide detailed insights into sales, product and store performance using a data warehouse architecture powered by dbt (data build tool). 
This project integrates, transforms and analyzes data from multiple sources, enabling better business decision-making through standardized reporting and analytics.  

## Features  
- Comprehensive sales performance metrics by customer, product and store.  
- Customer behavior analysis, including favorite product identification.  
- Monthly product and store performance summaries.  
- Built-in support for flexible data visualization tools such as Power BI.  

## Project Structure  
The project is organized as follows:  


### Key Models  
#### 1. **Customer Performance**  
This model provides a comprehensive overview of customer performance metrics, combining aggregated performance data with favorite product information. 
It helps identify key customer behaviors, preferences, lifetime value and favorite product.
**It allows to provide insights into customer activity, lifetime value and favorite product.**

#### 2. **Monthly Product Performance**
This model provides a detailed view of product performance metrics aggregated on a monthly basis. 
It includes sales, units sold and order data for each product.
**It allows to analyze product sales trends, revenue contribution and popularity over time.**


#### 3. **Monthly Sales Performance**  
This model provides a monthly analysis of sales performance by store, category and product, including key metrics such as sales revenue, units sold and customer data.
**It allows to summarize sales metrics at the store and product level for monthly analysis.**


#### 4. **Store Performance**  
This model provides an overview of store performance, including revenue, customer activity and operational metrics.
**It allows to analyze the performance by store, city and state.**


## Tools and Technology Stack  

### Tools  
- **Excel & Google Sheets**: Initial data preparation and sharing.  
- **Fivetran**: Automates data extraction and loading into the warehouse.  
- **BigQuery**: Cloud data warehouse for centralized data storage and processing.  
- **dbt**: Transforms raw data into analytics-ready datasets through modular SQL models.  
- **Git**: Version control for collaborative development and deployment workflows.  

### Data Flow Process  
1. **Data Sources**:  
   - Raw data originates from **Excel files**.  
   - These files are uploaded to **Google Drive** and converted into **Google Sheets** for seamless integration.  

2. **Data Extraction**:  
   - **Fivetran** automatically extracts data from Google Sheets via its connector.  

3. **Data Loading**:  
   - Fivetran loads the extracted data into **BigQuery**, ensuring scalability and performance.  

4. **Data Transformation**:  
   - **dbt** fetches raw data from BigQuery and performs transformations, applying business logic to create analytics-ready tables.  

5. **Data Deployment**:  
   - Transformed datasets are written back to **BigQuery**, making them accessible for analytics and reporting tools.  

6. **Version Control**:  
   - **Git** is used to manage dbt project files, with workflows supporting main and branch development for team collaboration and CI/CD.  

---

This structured process ensures a smooth data pipeline from ingestion to analysis, leveraging modern tools to deliver high-quality insights.  
