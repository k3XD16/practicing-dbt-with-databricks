WITH dedupQuery AS 
(
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY id ORDER BY updateDate DESC) AS dedup_ID
    FROM {{source('source', 'items')}}
)
SELECT
    id, name, category, updateDate
FROM dedupQuery
WHERE dedup_ID = 1