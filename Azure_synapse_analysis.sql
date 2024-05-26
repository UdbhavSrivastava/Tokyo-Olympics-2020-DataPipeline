-- 1. Calculate the number of athletes representing each country
SELECT Country, COUNT(*) AS AthleteCount
FROM athletes
GROUP BY Country
ORDER BY AthleteCount DESC;

-- 2. Calculate the number of athletes for each combination of country and discipline
SELECT Country, Discipline, COUNT(*) AS AthleteCount
FROM athletes
GROUP BY Country, Discipline
ORDER BY Country, Discipline;

-- 3. Count the number of coaches from each country
SELECT Country, COUNT(*) AS CoachCount
FROM coaches
GROUP BY Country
ORDER BY CoachCount DESC;

-- 4. Find the disciplines with the highest number of coaches
SELECT Discipline, COUNT(*) AS CoachCount
FROM coaches
GROUP BY Discipline
ORDER BY CoachCount DESC;

-- 5. Count the number of coaches per discipline per country
SELECT Country, Discipline, COUNT(*) AS CoachCount
FROM coaches
GROUP BY Country, Discipline
ORDER BY CoachCount DESC;

-- 6. Find the discipline with the highest number of female participants
SELECT Discipline, Female
FROM entriesgender
ORDER BY Female DESC;

-- 7. Find the discipline with the highest number of male participants
SELECT Discipline, Male
FROM entriesgender
ORDER BY Male DESC;

-- 8. Calculate the total number of female and male participants across all disciplines
SELECT 
    SUM(Female) AS TotalFemaleParticipants,
    SUM(Male) AS TotalMaleParticipants
FROM entriesgender;

-- 9. List all disciplines where the number of female participants exceeds the number of male participants
SELECT Discipline, Female, Male
FROM entriesgender
WHERE Female > Male;


-- 10. Find the discipline with the smallest gender disparity in participation
SELECT Discipline, ABS(Female - Male) AS GenderDisparity
FROM entriesgender
ORDER BY GenderDisparity;

-- 11. Find the country with the highest number of gold medals
SELECT TOP 3 Team_Country, Gold
FROM medals
ORDER BY Gold DESC;

-- 12. Find the top 5 countries by total number of medals
SELECT TOP 5 Team_Country, Total
FROM medals
ORDER BY Total DESC;

-- 13. Calculate the total number of gold, silver, and bronze medals awarded
SELECT 
    SUM(Gold) AS TotalGoldMedals,
    SUM(Silver) AS TotalSilverMedals,
    SUM(Bronze) AS TotalBronzeMedals
FROM medals;

-- 14. Find the country with the smallest difference between gold and silver medals using a window function:
SELECT 
    Team_Country,
    Gold,
    Silver,
    ABS(Gold - Silver) AS Difference,
    ROW_NUMBER() OVER (ORDER BY ABS(Gold - Silver)) AS RankByDifference
FROM medals
ORDER BY Difference;














