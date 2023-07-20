-- Heaviest Hitters 
SELECT AVG(people.weight), batting.yearid, teams.name  
FROM people
JOIN batting 
ON people.playerid = batting.playerid
JOIN teams
ON batting.team_id = teams.id
GROUP BY teams.name, batting.yearid
ORDER BY AVG(people.weight) DESC;

--Shortest Sluggers
SELECT AVG(people.height), batting.yearid, teams.name  
FROM people
JOIN batting 
ON people.playerid = batting.playerid
JOIN teams
ON batting.team_id = teams.id
GROUP BY teams.name, batting.yearid
ORDER BY AVG(people.height) ASC;

--Biggest Spenders
SELECT SUM(salaries.salary), salaries.yearid, teams.name
FROM salaries
JOIN teams 
ON salaries.team_id = teams.id
    AND salaries.yearid = teams.yearid
GROUP BY teams.name, salaries.yearid
ORDER BY SUM(salaries.salary) DESC;

--Most Bang For Their Buck
SELECT ROUND(SUM(salaries.salary/teams.w)), salaries.yearid, teams.name, teams.w
FROM salaries
JOIN teams 
ON salaries.team_id = teams.id
    AND salaries.yearid = teams.yearid
WHERE salaries.yearid = 2010
GROUP BY teams.name, salaries.yearid, teams.w
ORDER BY 1 ASC;

--Priciest Starter
SELECT salaries.salary/pitching.gs as cost_per_game, salaries.yearid, pitching.gs, people.namegiven
FROM salaries
JOIN pitching
ON salaries.playerid = pitching.playerid 
    AND salaries.yearid = pitching.yearid
    AND salaries.teamid = pitching.teamid
JOIN people
ON salaries.playerid = people.playerid
WHERE pitching.gs >= 10
ORDER BY 1 DESC;

--Canadian Ace
SELECT MIN(pitching.era), people.namegiven, teams.name
FROM pitching
JOIN teams 
ON pitching.team_id = teams.id
    AND pitching.era = teams.era
JOIN people
ON pitching.playerid = people.playerid
WHERE teams.name LIKE 'Milwaukee%'
GROUP BY 2, 3
ORDER BY 1 ASC;