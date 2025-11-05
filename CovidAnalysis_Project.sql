-- This query displays all data from the CovidDeaths and CovidVaccinations tables, sorted by location and date for initial introspection

SELECT * 
FROM CovidDeaths
ORDER BY 3,4;

SELECT * 
FROM CovidVaccinations
ORDER BY 3,4 ;

-- Display selected columns from CovidDeaths, focus on key metrics for nalysis

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1,2; 

-- Looking at Total Cases vs Total Deaths
-- Likelihood of dying if you contract covid in your country

SELECT location, date, total_cases, total_deaths, 
	(total_deaths/total_cases) * 100 as DeathPercentage
FROM CovidDeaths
ORDER BY 1,2; 

-- Looking at Total Cases vs Population for Algeria
-- Shows what percentage of the population got infected

SELECT location, date, population, total_cases, 
	(total_cases * 1.0 /population) * 100 as PercentPopulationInfected
FROM CovidDeaths
WHERE location LIKE '%Algeria%'
ORDER BY 1,2;

-- Looking at Countries with Highest Infection Rate Compared to Population
-- Finds countries with the larggest proportion of their population infected

SELECT location, population, 
	MAX(total_cases) as HighestInfectionCount, 
	(MAX(total_cases) * 1.0 /population) * 100 as PercentagePopulationInfected
FROM CovidDeaths
GROUP BY location, population
ORDER BY PercentagePopulationInfected DESC;

-- Countries with the Highest Death Count per Continent
-- This query calculates the maximun total deaths for each continent

SELECT continent,  
	MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;

-- Global Numbers
-- Calculates total cases, total deaths, and death percentage across all countries

SELECT date, 
	SUM(new_cases) AS total_cases, 
	SUM(CAST(new_deaths AS int)) AS total_deaths, 
	SUM(CAST(new_deaths AS int ))* 1.0 /SUM(new_cases)* 100 AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
-- GROUP BY date
ORDER BY 1,2;

-- Looking at Total Population vs Vaccinations
-- Calculating rolling vaccinations and percent of population vaccinated per country

WITH PopvsVac AS (
	SELECT 
	dea.continent, 
    dea.location, 
    dea.date, 
     dea.population, 
     vac.new_vaccinations,
     SUM(CAST(vac.new_vaccinations AS INTEGER)) 
         OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
    FROM CovidDeaths dea
    JOIN CovidVaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
)
SELECT 
    *, 
    (RollingPeopleVaccinated * 1.0 / population) * 100 AS PercentVaccinated
FROM PopvsVac
ORDER BY location, date;






 


