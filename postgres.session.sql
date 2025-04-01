SELECT descricao, SUM(CAST(valor_final AS NUMERIC)) AS total_despesa
FROM demonstracoes_contabeis
WHERE descricao ILIKE ANY (ARRAY['%EVENTO%', '%SINISTRO%'])
  AND data >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY descricao
ORDER BY total_despesa DESC
LIMIT 10;
