--Qual a média de gols por jogo em cada liga?

SELECT ROUND (AVG (m.home_team_goal + m.away_team_goal),2) AS media_gols
FROM match m
JOIN league l ON m.country_id = l.country_id 
GROUP BY l.name
ORDER BY media_gols DESC;

-- Outra resposta válida

SELECT 
    l.name AS liga,
    ROUND(AVG(m.home_team_goal + m.away_team_goal), 2) AS media_gols_por_jogo
FROM 
    Match m
JOIN 
    League l ON m.league_id = l.id
GROUP BY 
    l.name
ORDER BY 
    media_gols_por_jogo DESC;

-- OBS: A query funciona corretamente ao fazer JOIN por country_id porque, neste dataset,
--cada país possui apenas uma liga associada, o que evita ambiguidade nos dados.
--Assim, agrupar por league.name continua retornando médias corretas por liga.
-- Contudo, a segunda query apresentada é mais segura!
