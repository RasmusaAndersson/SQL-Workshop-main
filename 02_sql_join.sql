# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM City WHERE Name LIKE 'Ping%' ORDER BY Population ASC;
#
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM City WHERE Name LIKE 'Ran%' ORDER BY Population DESC;
#
#
# 3: Count all cities
SELECT COUNT(*) FROM City;
#
#
# 4: Get the average population of all cities
SELECT AVG(Population) FROM City;
#
#
# 5: Get the biggest population found in any of the cities
SELECT MAX(Population) FROM City;
#
#
# 6: Get the smallest population found in any of the cities
SELECT MIN(Population) FROM City;
#
#
# 7: Sum the population of all cities with a population below 10000
SELECT SUM(Population) FROM City WHERE Population < 10000;
#
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(*) FROM City WHERE CountryCode IN ('MOZ', 'VNM');
#
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT CountryCode, COUNT(*) FROM City WHERE CountryCode IN ('MOZ', 'VNM') GROUP BY CountryCode;
#
#
# 10: Get average population of cities in MOZ and VNM
SELECT CountryCode, AVG(Population) FROM City WHERE CountryCode IN ('MOZ', 'VNM') GROUP BY CountryCode;
#
#
# 11: Get the countrycodes with more than 200 cities
SELECT CountryCode FROM City GROUP BY CountryCode HAVING COUNT(*) > 200;
#
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT CountryCode, COUNT(*) AS city_count FROM City GROUP BY CountryCode HAVING city_count > 200 ORDER BY city_count;
#
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT DISTINCT Language FROM CountryLanguage WHERE CountryCode IN (SELECT CountryCode FROM City WHERE Population BETWEEN 400 AND 500);
#
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT City.Name, CountryLanguage.Language FROM City JOIN CountryLanguage ON City.CountryCode = CountryLanguage.CountryCode WHERE City.Population BETWEEN 500 AND 600;
#
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT City.Name FROM City WHERE CountryCode = (SELECT CountryCode FROM City WHERE Population = 122199);
#
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT City.Name FROM City WHERE CountryCode = (SELECT CountryCode FROM City WHERE Population = 122199) AND Population <> 122199;
#
#
# 17: What are the city names in the country where Luanda is capital?
SELECT City.Name FROM City WHERE CountryCode = (SELECT Code FROM Country WHERE Capital = (SELECT Id FROM City WHERE Name = 'Luanda'));
#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT City.Name FROM City WHERE Id IN (SELECT Capital FROM Country WHERE Region = (SELECT Region FROM Country WHERE Code = (SELECT CountryCode FROM City WHERE Name = 'Yaren')));
#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT Language FROM CountryLanguage WHERE CountryCode IN (SELECT Code FROM Country WHERE Region = (SELECT Region FROM Country WHERE Code = (SELECT CountryCode FROM City WHERE Name = 'Riga')));
#
#
# 20: Get the name of the most populous city
SELECT Name FROM City WHERE Population = (SELECT MAX(Population) FROM City)