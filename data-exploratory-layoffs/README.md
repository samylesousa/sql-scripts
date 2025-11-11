# Layoffs Data Analysis — SQL Insights Project

### Sobre o script
Este script tem como objetivo **explorar e extrair insights relevantes sobre demissões em massa (layoffs)** em empresas de tecnologia e outros setores, utilizando consultas SQL avançadas.  

A análise foi desenvolvida com foco em **entender padrões e tendências** — como períodos críticos, setores mais afetados e companhias com maiores cortes — aplicando agregações, funções de janela e subconsultas otimizadas.

Além disso é importante destacar que os dados análisados pelo atual script foram gerados através da limpeza realizada em [data-cleaning-layofss](/data-cleaning-layoffs).

### Objetivos do script

1. **Identificar extremos** — maiores valores absolutos e percentuais de demissões.  
2. **Explorar padrões temporais** — evolução mensal e anual de layoffs.  
3. **Classificar empresas e setores** com maior impacto.  
4. **Detectar tendências geográficas** e econômicas por país.  
5. **Gerar rankings e métricas acumuladas** com funções de janela.  

### Principais Consultas

| Categoria | Descrição | Técnicas SQL Utilizadas |
|------------|------------|--------------------------|
| **Exploratória** | Consulta de valores máximos de demissões absolutas e percentuais. | `MAX()`, `WHERE` |
| **Filtragem de casos extremos** | Seleção de empresas com 100% dos funcionários demitidos. | `WHERE percentage_laid_off = 1` |
| **Ordenação por impacto** | Ordenação por número total de demissões e fundos captados. | `ORDER BY`, múltiplos critérios |
| **Análise setorial e geográfica** | Total de demissões por indústria e país. | `GROUP BY`, `SUM()` |
| **Evolução temporal** | Total de demissões por ano e por mês. | `YEAR()`, `SUBSTRING()`, agregações temporais |
| **Métricas acumuladas** | Cálculo do total acumulado de layoffs ao longo do tempo. | `WITH`, `WINDOW FUNCTION`, `SUM() OVER()` |
| **Ranking de empresas** | Top 5 empresas mais afetadas por ano. | `CTE`, `DENSE_RANK() OVER(PARTITION BY...)` |


### Principais Insights Obtidos
> *Os resultados podem variar conforme o dataset analisado, mas a estrutura das consultas permite aplicar o mesmo raciocínio em qualquer conjunto de dados similar.*

- **2022 e 2023** exibiram os anos com mais layoffs.  
- **Setores de varejo, consumo e transporte** entre os mais impactados.  
- **Empresas de tecnologia** foram as que apresentaram maior número de demissões.  
- **Estados Unidos e Índia** foram os países com mais demissões.  


