-- Quais os 10 jogadores mais altos do banco de dados?

SELECT player_name AS nome_jogador, height AS altura
FROM player
WHERE height IS NOT NULL
ORDER BY height DESC
LIMIT 10;