#qual o intervalo de layoffs que a tabela abrange
SELECT MIN(`date`), MAX(`date`) FROM layoffs_copia;

#qual foi o maior layoff da tabela
SELECT *  FROM layoffs_copia WHERE total_laid_off = (SELECT MAX(total_laid_off) FROM layoffs_copia);

#quais empresas tiveram o maior indice de layoffs (baseando-se na porcentagem de demissão)
SELECT * FROM layoffs_copia WHERE percentage_laid_off = (SELECT MAX(percentage_laid_off) FROM layoffs_copia)
ORDER BY total_laid_off DESC;

#entre as empresas com índice de 100% de demissão quais tinham o maior faturamento
SELECT * FROM layoffs_copia WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

#qual a soma geral de layoffs que cada empresa fez
SELECT company, SUM(total_laid_off) AS total_off FROM layoffs_copia
GROUP BY company ORDER BY total_off DESC;

#qual das industrias apresentou maior número de demissões
SELECT industry, SUM(total_laid_off) AS total_off FROM layoffs_copia
GROUP BY industry ORDER BY total_off DESC;

#quais paises mais sofreram layoffs
SELECT country, SUM(total_laid_off) AS total_off FROM layoffs_copia
GROUP BY country ORDER BY total_off DESC;

#quais foram os anos com mais demissões
SELECT YEAR(`date`), SUM(total_laid_off) AS total_off FROM layoffs_copia
GROUP BY YEAR(`date`) ORDER BY total_off DESC;

#e em relação aos meses, quais apresentaram maior número de demissões
WITH Rolling_offs AS
(
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_copia WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH` 
)

SELECT `MONTH`, SUM(total_off) OVER(ORDER BY `MONTH`) AS total_rolling FROM Rolling_offs;

#obtendo informações sobre as empresas com maior número de número de layoffs anuais
WITH Company_by_Year (company, years, total_laid_off) AS 
(
SELECT company, YEAR(`date`), SUM(total_laid_off) FROM layoffs_copia
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(SELECT *,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_by_Year WHERE years IS NOT NULL
)

SELECT * FROM Company_Year_Rank WHERE Ranking <=5;