-- Quantos jogadores com mais de 85 de overall jogaram em cada liga?

SELECT l.name AS league_name, COUNT(DISTINCT pa.player_api_id) AS total_players
FROM player_attributes pa
JOIN player p ON pa.player_api_id = p.player_api_id
JOIN match m ON p.player_api_id IN (
    m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5,
    m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11,
    m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5,
    m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11
)
JOIN league l ON m.league_id = l.id
WHERE pa.overall_rating > 85
GROUP BY l.name
ORDER BY total_players DESC;

-- A consulta identifica jogadores com overall > 85 e cruza com partidas (match)
-- para contar quantos atuaram em cada liga (league),
-- usando JOINs entre player_attributes, match e league e player.
