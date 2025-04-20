# CRM Sales Opportunities 
## Source Data
https://mavenanalytics.io/data-playground

## Purpose
To generate a report on the sales performance of each sales agent/team/regional office.

## Tools
- SQL (Postgres)
- Power BI 

## Findings:
1. Sales by regional office and manager:
  - West - $3,568,647 - Closing Rate: 63.9% 
    - Summer Sewald - $1,964,750
    - Celia Rouche - $1,603,897
  - Central - $3,346,293 - Closing Rate: 62.6%
    - Melvin Marxen - $2,251,930
    - Dustin Brinkmann - $1,094,363
  - East - $3,090,594 - Closing Rate: 63.0%
    - Rocco Neubert - $1,960,545
    - Cara Losch - $1,130,049

The west regional office produced the most sales at $3.5M, central produced $3.3M, and east produced $3.0M. Manager Melvin Marxen in central office, whose team produced $2.25M in sales, leads the best performing team in all offices.

2. The top 3 accounts for each office are:
  - Central
    - Treequote - $176,751
    - Warephase - $170,046
    - Isdom - $164,683
  - East
    - Kan-code - $171,377
    - Mathtouch - $163,339
    - Plussunin - $155,195 
  - West
    - Cheers - $198,020
    - Goodsilron - $182,522
    - Kan-code - $170,078

3. The top 5 best performing sales agents are:
  - Darcel Schlecht (Office: Central, Manager: Melvin Marxen) - $1,153,214
  - Vicki Laflamme (West, Celia Rouche) - $478,396
  - Kary Hendrixson (West, Summer Sewald) - $454,298
  - Cassey Cress (East, Rocco Neubert) - $450,489
  - Donn Cantrell (East, Rocco Neubert) - $445,860

In the top 10 best performing sales agents, there are 5/10 sales agents from the East office, 4/10 from the West office, and only 1 sales agent in the Central office. The East office has the lowest sales by regional office but half of the top sales agents are from the East office.

4. Sales by product:
  - GTX Basic (Sales Price of $550) - Units Sold: 1866 - $499,263
  - MG Special ($55) - Units Sold: 1651 - $43,768
  - GTX Pro ($4,821) - Units Sold: 1480 - $3,510,578
  - MG Advanced ($3,393) - Units Sold: 1412 - $2,216,387
  - GTX Plus Basic ($1,096) - Units Sold: 1383 - $705,275
  - GTX Plus Pro ($5,482) - Units Sold: 968 - $2,629,651
  - GTK 500 ($26,768) - Units Sold: 40 - $400,612

The most common product sold is the GTX Basic selling at $550 with 1800 units sold producing almost $500k in sales. The GTX Pro is the highest selling product selling at $4,821 with 1480 units sold producing $3.5M in sales.
  
5. Sales by sector:
  - Retail - $1,867,528
  - Technology - $1,515,487
  - Medical - $1,359,595
  - Software - $1,077,934
  - Finance - 950,908

Find what sectors each product sells best and recommend which teams should pursue these deals.

## Dashboard:
![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/SQL%20Analysis%20Projects/CRM%20Sales%20Insights/Power%20BI%20Screenshots/image.png)
![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/SQL%20Analysis%20Projects/CRM%20Sales%20Insights/Power%20BI%20Screenshots/image-1.png)

