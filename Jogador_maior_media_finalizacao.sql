--Qual jogador teve a maior nota média de finalização (finishing)?

SELECT p.player_name, ROUND(AVG(a.finishing)::numeric, 2) AS avg_finishing
FROM player_attributes a
JOIN player p ON a.player_api_id = p.player_api_id
WHERE a.finishing IS NOT NULL
GROUP BY p.player_name
ORDER BY avg_finishing DESC
LIMIT 1;