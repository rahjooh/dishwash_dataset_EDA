# dishwash_dataset_EDA
Bent Oak Systems 's task

The data presented in this task is about the list of goods distributed among the washing equipment sellers. This data is a small piece of an integrated data warehouse with structured data. These data are one fact table and three dimension tables.
      The first dimension contains store information, which hierarchically includes branches and sub-branches of chain stores.
The second dimension includes the information of various washing products, which is also hierarchical and includes all the details needed in the dishwasher, such as tablets and washing liquid, etc.
The third dimension is related to the date data, which is presented weekly in this dataset.
The fact, which is at the center of these three dimensions, includes the information related to the number, amount, value and other related data that is aggregated weekly.

# Data Ingestion
In the data ingest stage, I presented the structure of the tables in the form of a query, which can lead to the creation of the table and the definition of the main key and the foreign key and the relationships between the tables.

At this stage, we have abbreviated the names of the table for simplicity


# Data Exploration and Cleaning
In the clean data phase, I have done all 4 tables separately in 4 different Jupyter files with explanations and details of the cases.

As we know, in the transfer form stage, things like join and group buy are work tools. Best practices suggest that the best place for these tasks is at the stage of fetching data from the database, which here is skingrass. Because the databases are highly optimized, and on the other hand, it is better to perform these actions to reduce the amount of overhead in the remaining steps. In distributed and scaled systems, things like network overhead and bandwidth are important in this field.
​

# Analysis 
In the analysis stage, we sorted the data set according to date and in descending order, and using the possibility of Postgres interval, we compared the last four records with the four records of one year before.
  At this stage, there were many possible analyzes that we will ignore their implementation due to time constraints

# Top Distribution
In the stage of choosing the best distributors, which is the stage of conclusion and exploitation, many models can be implemented. But unfortunately, due to lack of time, I don't have the opportunity to implement them. (Unfortunately, due to travel, I opened the task email two days later and missed the first two days).
At this stage, the distributors can be examined regarding various cases.
Or even the best-selling products can be specified.
Another idea is to identify the most profitable products as well.
Another idea is that according to the decrease in sales that was discovered from the analysis stage, the reasons for this decrease and the annual assessment of the sales of each company were investigated separately.
