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

Victims Grouped By Age Group:
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

From 2020 to 2025, individuals in Los Angeles aged 26+ account for approximately 81% of victims, where 40% are adults (26-40), 30% are middle aged (41-60), and 11% are seniors (61+). Victims aged 26+ are more likely to be males, while victims who are 25 and under tend to be female.

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image.png)

Victims Grouped By Race:
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

Victims Grouped By Age Group and Race:
The following chart shows victims of each race grouped by age group and sex. In the Hispanic/Latin, victims are more likely to be females aged 40 and under with 95.9k reported incidents as opposed to 86.2k for males. Similarly, in the Black community, victims are also likely to be females especially young adults (19-25) with 11.2k reported incidents as opposed to 6.2k for males, and adults (26-40) with 31.9k reported incidents as opposed to 23.1k for males. In the White and Asian communities, males aged 26+ are more likely to be victims.

The following chart shows crime incidents by age groups between races. 

place victim age group by race and sex here

### Type of Crimes and Incident Locations 

Incidents Grouped By Type of Crime:
The most commonly reported crimes in Los Angeles is some form of assault, with 'Battery - Simple Assault' being the most common with over 70k incidents, accounting for 10.3% of total crime incidents. Another common crime is 'Assault With Deadly Weapon, Aggravated Assault' with over 50k incidents accounting for 7.2% of total crime incidents. **Police in Los Angeles should always be aware and prepared to handle more violet incidents like this as it is more common.** 

1. Battery - Simple Assault -> 73.7k incidents -> Accounts for 10.3% of all crime in LA
2. Theft of Identity -> 58.9k -> 8.21%
3. Burglary From Vehicle -> 58.6k -> 8.17%
4. Assault With Deadly Weapon, Aggravated Assault -> 51.3k -> 7.2%
5. Intimate Partner - Simple Assault -> 46.2k -> 6.4%

place common crime in los angeles plot here

Common Crimes Between Sexes:
The type of crime incident can differ between males and females. For example, 71.8% of victims who exprerience aggravated assault with a deadly weapon are male, whereas 76.1% of victims who experience simple assault by an intimate partner are female. In Los Angeles, males are prone to more violent crimes than females. The following chart shows the most common crimes for each sex.

place male female common crime here

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-3.png)

Locations Where Incidents Occur:
There is not one area of Los Angeles that exceeds 10% of total crime incidents. The area with the most incidents is Central, accounting for 7.03% of total incidents (50k incidents), whereas Hollenbeck accounting for 3.29% of total incidents (23.6k incidents). **The Central area has experienced more than twice the crime incidents than Hollenbeck, and is an area that Los Angeles Police Department should monitor closely and prepare officers to deploy quicker.** The following chart shows the crime incidents per area.

Top 5 Locations With The Most Incidents:
1. Central - 7.03%
2. Southwest - 6.43%
3. 77th Street - 6.34%
4. Pacific - 5.67%
5. Hollywood - 5.32%

Locations Where Common Crimes Occur:
As expected, the locations with the most crime incidents will be where the most common crimes occur. For example, Central, 77th Street, and Southwest are all top locations where common crimes occur. However, there are some areas that are not expected. Aside from the expected areas like Central or 77th Street, Devonshire and West LA are areas where identity theft is a common crime. Vehicle burglaries are common in N Hollywood and West LA. Simple assaults by intimate partners also occur in areas like Olympic and Mission. Finally, aggravated assault with deadly weapons also occur in Newton and Southeast. **The top locations where aggravated assault with deadly weapons occur are 77th Street, Southeast, Central, Newton, and Southwest. Police officers responding to incidents at these locations should be aware of the possiblity of aggravated assault with deadly weapon.**

place locations whre common crimes occur here

![alt text](https://github.com/CarlosCapili/Data-Analysis-Portfolio/blob/main/Python%20Analysis%20Projects/Los%20Angeles%20Crime%20Pattern%20Analysis/Plots/image-4.png)









## Challenges Faced
