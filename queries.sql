SELECT descricao, SUM(CAST(valor_final AS NUMERIC)) AS total_despesa
FROM demonstracoes_contabeis
WHERE descricao ILIKE ANY (ARRAY['%EVENTO%', '%SINISTRO%'])
  AND data >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY descricao
ORDER BY total_despesa DESC
LIMIT 10;



SELECT descricao, SUM(CAST(valor_final AS NUMERIC)) AS total_despesa
FROM demonstracoes_contabeis
WHERE descricao ILIKE ANY (ARRAY['%EVENTO%', '%SINISTRO%'])
  AND data >= (SELECT MAX(data) - INTERVAL '6 months' FROM demonstracoes_contabeis)
  AND data <= (SELECT MAX(data) FROM demonstracoes_contabeis)
GROUP BY descricao
ORDER BY total_despesa DESC
LIMIT 30;