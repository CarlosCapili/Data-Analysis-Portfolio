# Los Angeles Crime Analysis

## Summary 
This project explores Los Angeles crime trends using reported crime incidents from 2020 to 2025 provided by the Los Angeles Police Department on Data.gov. Python was used to perform exploratory data analysis with a primary focus on determining victim demographics, location, and type of crime, to aid in community support and inform the LAPD on where to focus their resources for crime prevention initiatives.

Data Source - https://catalog.data.gov/dataset/crime-data-from-2020-to-present

## Tools
- Python (pandas, matplotlib, seaborn)
- Jupyter Notebook

The entire project was completed using Python in a Jupyter Notebook environment. Data preprocessing was performed using the Pandas and Numpy libraries, while Seaborn and Matplotlib were used for data visualization.

## Key Findings :

### Victim Demographics

The following shows the percentages of victims by age group and the number of reported crimes followed by their respective sex percentage breakdown:
  - Child (0-14) -> 1.9% -> 13.6k 
    -  Male -> 42.0%
    -  Female -> 58.0%
  - Teen (15-18) -> 2.5% -> 17.6k
    -  Male -> 42.8%
    -  Female -> 57.2%
  - Young Adult (19-25) - 14.6% -> 104.5k
    -  Male -> 45.9%
    -  Female -> 54.1%
  - Adult (26-40) - 39.7% -> 284.6k
    -  Male -> 50.1%
    -  Female -> 49.9%
  - Middle Aged (41-60) - 30.0% -> 215.5k
    -  Male -> 54.5%
    -  Female -> 45.5%
  - Senior (61+) - 11.3% -> 81.2k
    -  Male -> 54.7%
    -  Female -> 45.3%

From 2020 to 2025, individuals aged 26+ account for approximately 81% of victims, where 40% are adults (26-40), 30% are middle aged (41-60), and 11% are seniors (61+). Victims aged 26+ are more likely to be males, while victims who are 25 and under tend to be female.

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image.png)

The following shows the percentages of victims by race and the number of reported crimes followed by their respective sex percentage breakdown:
  - Hispanic/Latin -> 39.9% -> 285.9k
    - Male -> 49.4%
    - Female -> 50.6%
  - White -> 25.2% -> 180.8k
    - Male -> 54.9%
    - Female -> 45.1%
  - Black -> 18.4% -> 131.9k
    - Male -> 43.6%
    - Female -> 56.4%
  - Other -> 8.8% -> 63.1k
    - Male -> 58.4%
    - Female -> 41.6%
  - Asian -> 5.2% -> 37.2k
    - Male -> 51.7%
    - Female -> 48.3%

According to [Data USA Los Angeles](https://datausa.io/profile/geo/los-angeles-ca?redirect=true), 47.2% of the people in Los Angeles are Hispanic/Latin people, 28.3% are White, 11.8% are Asian, and 8.2% are Black as of 2023. Hispanic/Latin people account for approximately 40% of victims, followed by White at 25%, Black at 18%, and Asian at 5%. There are more victims in the Black community than the Asian community despite being only 8.2% of the population of LA. Hispanic/Latin and Black victims tend to be females, while White and Asian victims tend to be males.

*The Unknown bar represents the race of the victim to which the crime has been reported is unknown*

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-1.png)

In the Hispanic/Latin community, the ratio between male and female victims is almost 50/50. However, the majority of female Hispanic/Latin victims are below the age of 40. In the Black community,  


 4. 5 Most Reported Crimes in LA:
 - Battery - Simple Assault - 10.28%
 - Theft of Identity - 8.21%
 - Burglary From Vehicle - 8.17%
 - Assault With Deadly Weapon, Aggravated Assault - 7.16%
 - Intimate Partner - Simple Assault - 6.45%

The most reported crime in LA is Battery - Simple Assault with over 70,000 occurances while only accounting for 10.28% of total crime in LA.

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-3.png)

5. Crimes Reported By Area:
- Central - 7.03%
- Southwest - 6.43%
- 77th Street - 6.34%
- Pacific - 5.67%
- Hollywood - 5.32%

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-4.png)

6. Crimes Reported By Premise:
- Single Family Dwelling - 22.00%
- Street - 18.47%
- Multi-Unit Dwelling (Apartment, Duplex, Etc) - 15.51%
- Parking Lot - 6.37%
- Sidewalk - 5.24%

Homes are a likely place for crimes to occur with almost a quarter of the crimes reported taking place in a Single Family Dwelling with over 157,000 incidents. Over 111,000 crimes reported have occurred in a Mult-Unit Dwelling. Homes account for 37.51% of premises for which crimes have been reported.

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-5.png)

7. Crimes Reported By Weapon Used:
- Strong-Arm (Hands, Fist, Feet Or Bodily Force) - 23.06%
- Unknown Weapon/Other Weapon - 4.31%
- Verbal Threat - 3.09%
- Hand Gun - 2.42%
- Knife With Blade 6 Inches or Less - 0.89%

*The Unknown bar indicates that it is unknown whether a weapon was used for the reported crime. It accounts for 58.24% of reported crimes.*

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-6.png)

8. Crimes Reported By Status:
- Investigation Continued - 76.75%
- Adult Other - 13.63%
- Adult Arrest - 9.07%
- Juvenile Arrest - 0.34%
- Juvenile Other - 0.21%

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-7.png)

9. Time It Takes To Report A Crime:
- Same Day - 51.20%
- Within 24 Hours - 18.82%
- 2-7 Days - 15.99%
- 60+ Days - 4.05%
- 29-60 Days - 2.59%

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-8.png)

## Challenges Faced
