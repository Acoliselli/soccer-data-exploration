
-- Qual a média de cartões (amarelos + vermelhos) por time, por temporada?

-- JOIN entre Match e Team. Agrupar por time e por temporada.

-- Exemplo de pergunta real de negócio:

-- “Quais times têm o estilo de jogo mais agressivo?”

WITH extrai_cartoes AS (
  SELECT
    id AS match_id,
    (xpath('//card_type/text()', x)::text[]) AS tipos_cartao,
    (xpath('//team/text()', x)::text[]) AS times_cartao,
    date
  FROM (
    SELECT 
      id,
      date,
      unnest(xpath('//value', card::xml)) AS x
    FROM match
    WHERE card IS NOT NULL
  ) AS eventos
),

cartoes_normalizados AS (
  SELECT
    match_id,
    (date::timestamp) AS data_partida,
    tipos_cartao[idx] AS tipo_cartao,
    times_cartao[idx]::int AS team_id
  FROM extrai_cartoes,
  generate_subscripts(tipos_cartao, 1) AS idx
)

SELECT 
  t.team_long_name AS nome_time,
  EXTRACT(YEAR FROM data_partida) AS temporada,
  COUNT(*) AS total_cartoes,
  ROUND(AVG(COUNT(*)) OVER (PARTITION BY cn.team_id), 2) AS media_por_time
FROM cartoes_normalizados cn
JOIN team t ON cn.team_id = t.team_api_id
GROUP BY t.team_long_name, temporada, cn.team_id
ORDER BY media_por_time DESC;
