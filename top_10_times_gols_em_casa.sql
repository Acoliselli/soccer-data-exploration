--Quais os 10 times que mais marcaram gols jogando em casa?

SELECT t.team_long_name AS time, SUM (m.home_team_goal) AS gols_em_casa
FROM team t JOIN match m ON t.team_api_id = m.home_team_api_id
GROUP BY t.team_long_name
ORDER BY gols_em_casa DESC
LIMIT 10;