# Billionaires-Dataset-Analysis
# 📊 Billionaires Statistical Analysis

This project presents a **comprehensive statistical analysis** of the **demographics** and **wealth** of billionaires around the world. The analysis delves into the distribution of wealth, demographic characteristics, the difference between self-made and inherited wealth, correlations with economic indicators, geographical distribution, and trends over time.

## 📁 Dataset Description

- **Dataset:** Information related to billionaires worldwide
- **Sample Size:** Randomly selected **1000 observations** from a total of **2640**
- **Variables:** 
  - **Demographic Variables:**
    - `rank`: Billionaire's rank by wealth
    - `personName`, `age`, `country`, `city`, `countryOfCitizenship`, `birthDate`, `lastName`, `firstName`, `title`, `state`, `residenceStateRegion`, `birthYear`, `birthMonth`, `birthDay`, `gross_tertiary_education_enrollment`, `gross_primary_education_enrollment_country`
  - **Financial Variables:**
    - `finalWorth`: Net worth in USD
    - `source`, `industries`, `organization`, `cpi_country`, `cpi_change_country`, `gdp_country`, `life_expectancy_country`, `tax_revenue_country_country`, `total_tax_rate_country`, `population_country`
  - **Categorical Variables:**
    - `selfMade`, `gender`, `status`

## 🧠 Analyses Conducted

### 1. Wealth Distribution Analysis
- Explored the distribution of billionaire wealth across different **sectors**, **countries**, and **cities**.
- **Visualization:** Identified sectors, countries, and cities with the highest concentration of billionaires through detailed graphical representations.

### 2. Demographic Analysis
- Analyzed **age**, **gender**, and **birthplaces** of billionaires.
- **Key Insight:** Majority of billionaires are older and predominantly male.

### 3. Self-Made vs. Inherited Wealth
- **Findings:** 
  - **69.8%** of billionaires are **self-made**.
  - **30.2%** inherited their wealth.

### 4. Economic Indicators Correlation
- Investigated the relationship between billionaire wealth and economic indicators such as **GDP**, **CPI**, and **tax rates**.
- **Result:** Very weak negative correlations were observed.

### 5. Spatial Analysis
- **Mapping:** Visualized the geographical distribution of billionaires and their wealth.
- **Concentration:** High concentration of billionaires in **North America**, **Europe**, and **Asia**.

### 6. Trends Over Time
- Tracked changes in billionaire demographics and wealth over time using birth year data.
- **Trend:** Increasing number and wealth of billionaires post-2000, with a notable rise and fall in 2022.

## 🛠️ R Packages Utilized

- **Core Packages:** `dplyr`, `ggplot2`, `raster`, `sp`, `leaflet`, `tmap`, `htmlwidgets`, `maps`, `webshot`, `tidyverse`

## 📈 Conclusions & Recommendations

- **Concentration:** Billionaires are significantly concentrated in specific sectors and geographical regions.
- **Recommendation:** Further research is needed to address missing data, enhancing the robustness of the analysis.

More information about variables:

-rank: The ranking of the billionaire in terms of wealth.

-finalWorth: The final net worth of the billionaire in U.S. dollars.

-category: The category or industry in which the billionaire's business operates.

-personName: The full name of the billionaire.

-age: The age of the billionaire.

-country: The country in which the billionaire resides.

-city: The city in which the billionaire resides.

-source: The source of the billionaire's wealth.

-industries: The industries associated with the billionaire's business interests.

-countryOfCitizenship: The country of citizenship of the billionaire.

-organization: The name of the organization or company associated with the billionaire.

-selfMade: Indicates whether the billionaire is self-made (True/False).

-status: "D" represents self-made billionaires (Founders/Entrepreneurs) and "U" indicates inherited or unearned wealth.

-gender: The gender of the billionaire.

-birthDate: The birthdate of the billionaire.

-lastName: The last name of the billionaire.

-firstName: The first name of the billionaire.

-title: The title or honorific of the billionaire.

-date: The date of data collection.

-state: The state in which the billionaire resides.

-residenceStateRegion: The region or state of residence of the billionaire.

-birthYear: The birth year of the billionaire.

-birthMonth: The birth month of the billionaire.

-birthDay: The birth day of the billionaire.

-cpi_country: Consumer Price Index (CPI) for the billionaire's country.

-cpi_change_country: CPI change for the billionaire's country.

-gdp_country: Gross Domestic Product (GDP) for the billionaire's country.

-gross_tertiary_education_enrollment: Enrollment in tertiary education in the billionaire's country.

-gross_primary_education_enrollment_country: Enrollment in primary education in the billionaire's country.

-life_expectancy_country: Life expectancy in the billionaire's country.

-tax_revenue_country_country: Tax revenue in the billionaire's country.

-total_tax_rate_country: Total tax rate in the billionaire's country.

-population_country: Population of the billionaire's country.

-latitude_country: Latitude coordinate of the billionaire's country.

-longitude_country: Longitude coordinate of the billionaire's country.
