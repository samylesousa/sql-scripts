# Data Cleaning em SQL — Layoffs Dataset

Este script tem como objetivo demonstrar o processo completo de **limpeza, padronização e preparação de dados** utilizando **MySQL**.  
O dataset utilizado contém informações sobre **demissões em empresas de tecnologia**, e o script realiza etapas essenciais de *data cleaning* para torná-lo pronto para análise.


##  Sobre o Script

O script SQL aplica boas práticas de tratamento de dados, incluindo:

- Criação de cópias da tabela original para preservar o dataset original.  
- **Remoção de duplicatas** com funções de janela (`ROW_NUMBER`).  
- **Padronização de texto** e tratamento de inconsistências.  
- **Conversão de tipos de dados**, especialmente campos de data.  
- **Preenchimento de valores ausentes** e eliminação de registros inválidos.  

O resultado [layoffs_copia](data-cleaning-layoffs\layoffs_copia.csv) é um conjunto de dados limpo, padronizado e pronto para uso em análises, dashboards ou pipelines ETL.


## Tecnologias Utilizadas

- **MySQL**  



