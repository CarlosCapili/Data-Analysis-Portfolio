# Electric Vehicle Monitoring in Washington State
## Summary
The usage of EVs continue to grow year by year as more car companies create their own EVs to stay relevant in the automobile industry. There is no doubt in the future that gas cars will become obsolete and everyone will drive an EV. This project uses a dataset containing current EV registration records in Washington State provided by the Washington State Department of Licensing through Data.gov. A Power BI dashboard was built to show the geographic distribution of EVs to provide a better understanding of EV adoption patterns.

Data Source - https://catalog.data.gov/dataset/electric-vehicle-population-data

## Tools
- SQL (Postgres)
- Power BI

Data preprocessing was performed using SQL(Postgres) and the dashboard was created using Power BI.

## Key Findings:

There are approximately 193.8k registered EV's in Washington State.

1. Some of the most common EV makes are:
     - Tesla - 85,000 EV's (43.9% of the EV's in the state)
     - Chevrolet - 14,500 (7.5%) 
     - Nissan - 14,300 (7.4%) 
     - Ford - 10,200 (5.3%)
     - Kia - 8400 (4.4%)

Some other makes outside the top 5 are BMW, Toyota, Volkswagen, Jeep, and Hyundai.

2. The top 5 counties with the most registered EV's are:
     - King - 100,000 EV's (51.6% of registered EV's in the state)
          - Popular makes: Tesla, Nissan, and Chevrolet 
     - Snohomish - 23,000 (11.9%)
          - Popular makes: Tesla, Nissan, and Chevrolet
     - Pierce - 15,300 (7.9%)
          - Popular makes: Tesla, Chevrolet, and Ford   
     - Clark - 11,500 (5.9%)
          - Popular makes: Tesla, Chevrolet, and Toyota  
     - Thurston - 7000 (3.7%)
          - Popular makes: Tesla, Chevrolet, and Ford
  
3. The top 5 cities with the most registered EV's and top 3 makes are:
     - Seattle - 31,700 EV's (16.4% of EV's in the state)
          - Tesla - 12,200 EV's (38.6% of Seattle EV's are Tesla)
          - Nissan - 2,791 (8.8%)
          - Chevrolet - 2,481 (7.8%) 

     - Bellevue - 9,600 (5.0%)
          - Tesla - 5,841 (60.3%)
          - BMW - 540 (5.6%)
          - Nissan - 539 (5.6%)

     - Redmond - 6,900 (3.6%)
          - Tesla - 4,159 (59.9%)
          - Nissan - 473 (6.8%)
          - BMW - 323 (4.7%)

     - Vancouver - 6,800 (3.5%)
          - Tesla - 2,679 (39.0%)
          - Chevrolet - 588 (8.6%)
          - Nissan - 560 (8.2%)

     - Bothell - 6,300 (3.3%)
          - Tesla - 3,795 (59.4%)
          - Nissan - 398 (6.2%)
          - BMW - 267 (4.2%)

4. There are 483 cities in Washington State. The top 5 EV makes where it is the most registered in the city are:
     - Tesla - 382 cities (79% of cities in Washington state have Tesla as the most registered EV)
     - Chevrolet- 61 
     - Ford - 35 
     - Nissan - 24 
     - Toyota - 20
  
There is no surprise that Tesla is the most registered make for an EV. Other makes such as Chevrolet, Ford, Nissan, and Toyota  seem to be the more popular alternatives to a Tesla.

5. Approximately 151,000 or 78.4% of all registered EV's are Battery Electric Vehicle (BEV) while 41,900 or 21.6% are Plug-in Hybrid Electric Vehicle (PHEV)

Most Common EV Models:
1. Tesla Model Y (20.7% of registered EV's in the state)
2. Tesla Model 3 (15.9%)
3. Nissan Leaf (7.0)
4. Tesla Model S (4.0)
5. Chevrolet Bolt EV (3.4)
6. Tesla Model X (3.2)
7. Chevrolet Volt (2.5)
8. Volkswagen ID 4 (2.3)
9. Ford Mustang Mach-E (2.0)
10. Jeep Wrangler (2.0)

## Dashboard
![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/SQL%20Analysis%20Projects/Electric%20Vehicle%20Monitoring%20in%20Washington%20State/Power%20BI%20Screenshots/image-2.png)
![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/SQL%20Analysis%20Projects/Electric%20Vehicle%20Monitoring%20in%20Washington%20State/Power%20BI%20Screenshots/image-3.png)
![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/SQL%20Analysis%20Projects/Electric%20Vehicle%20Monitoring%20in%20Washington%20State/Power%20BI%20Screenshots/image-4.png)
