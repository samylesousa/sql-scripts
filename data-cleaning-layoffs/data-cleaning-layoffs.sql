#criando uma tabela cópia para manter os dados originais intactos 
CREATE TABLE layoffs_copia LIKE layoffs;

#copiando todos os dados para a tabela cópia
INSERT layoffs_copia SELECT * FROM layoffs;

#removendo os elementos duplicados
ALTER TABLE layoffs_copia ADD COLUMN row_num INT;

INSERT INTO layoffs_copia SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
country, funds_raised_millions) AS row_num
FROM layoffs;

DELETE FROM layoffs_copia WHERE row_num > 1;

#retirando os espaços em branco da coluna company
UPDATE layoffs_copia SET company = TRIM(company);

#estabelecendo um padrão para os valores de industry
UPDATE layoffs_copia SET industry = 'Crypto' WHERE industry LIKE 'Crypto%';

#corrigindo os valores de alguns elementos na coluna de paises
UPDATE layoffs_copia SET country = TRIM(TRAILING '.' FROM country) WHERE country LIKE 'United States%';

#modificando o tipo de dados da coluna date 
UPDATE layoffs_copia SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');
ALTER TABLE layoffs_copia MODIFY COLUMN `date` DATE;

#incluindo valores em elementos nulos do banco de dados
UPDATE layoffs_copia SET industry = NULL WHERE industry = '';

UPDATE layoffs_copia AS t1
JOIN layoffs_copia AS t2
	ON t1.company = t2.company
SET t1.industry = t1.industry
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;

#removendo linhas que possuem valores nulos em colunas importantes 
DELETE FROM layoffs_copia WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

#removendo a coluna row_num (visto que foi criada apenas para auxiliar em algumas operações)
ALTER TABLE layoffs_copia DROP COLUMN row_num;