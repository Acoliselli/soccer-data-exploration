

-- Qual a evolução do overall médio dos jogadores de um time específico ao longo dos anos?
--  JOIN entre Player_Attributes e Match + GROUP BY por ano.

-- Exemplo de pergunta real de negócio:
—“Como o nível técnico do elenco do Barcelona evoluiu de 2008 a 2016?”

-- Aqui eu usei o time do Barcelona como exemplo.


SELECT 
    EXTRACT(YEAR FROM pa.date::DATE) AS ano,
    ROUND(AVG(pa.overall_rating)::NUMERIC, 2) AS media_overall
FROM 
    Match m
JOIN 
    Player_Attributes pa
ON 
    pa.player_api_id IN (
        m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5,
        m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11,
        m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5,
        m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11
    )
WHERE 
    m.home_team_api_id = 9987 OR m.away_team_api_id = 9987
GROUP BY 
    ano
ORDER BY 
    ano;