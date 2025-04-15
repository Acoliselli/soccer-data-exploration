--Quais os 5 times que mais sofreram gols como visitantes?

SELECT t.team_long_name AS time, SUM(m.home_team_goal) AS gols_sofridos_fora
FROM match m
JOIN team t ON m.away_team_api_id = t.team_api_id
GROUP BY t.team_long_name
ORDER BY gols_sofridos_fora DESC 
LIMIT 5;
