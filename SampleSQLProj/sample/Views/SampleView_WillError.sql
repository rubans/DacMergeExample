CREATE VIEW [sample].[SampleView_WillError]
AS
WITH [Cte] AS
(
    SELECT * 
    FROM
    (   VALUES
         ('1','2','3')
     
    ) AS [Overrides] ([Col1],[Col2],[Col3])
	
)
select   d.*
from    [sample].[SampleView] d
left OUTER JOIN [Cte] O
    ON  D.[Col1] = O.[Col1]
    AND D.[Col2] LIKE 'PRESTART%'
GO