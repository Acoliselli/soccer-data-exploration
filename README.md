# soccer-data-exploration
Exploração de Dados de Futebol utilizando SQL

# ⚽ **Exploração de Dados de Futebol com SQL**

Este projeto tem como objetivo explorar um banco de dados de futebol utilizando SQL para responder a perguntas de negócios reais. Baseado no [European Soccer Database](https://www.kaggle.com/datasets/hugomathien/soccer), o projeto visa proporcionar uma prática aprofundada e o domínio de consultas SQL.

## 🔍 **Perguntas de Negócio Respondidas**

### 1. **Quais são os 10 jogadores mais altos do banco de dados?**
Consulta simples utilizando `SELECT`, `ORDER BY` e `LIMIT`.

---

### 2. **Quais são os 10 times que mais marcaram gols jogando em casa?**
Consulta que calcula o somatório dos gols do time mandante (`home_team_goal`) na tabela `Match`.

---

### 3. **Qual a média de gols por jogo em cada liga?**
Consulta envolvendo `JOIN` entre as tabelas `Match` e `League`.

---

### 4. **Qual jogador teve a maior nota média de finalização (`finishing`)?**
Consulta na tabela `Player_Attributes`, utilizando `AVG` e `GROUP BY`.

---

### 5. **Quantos jogadores com mais de 85 de overall jogaram em cada liga?**
Consulta mais elaborada, utilizando `JOINs` entre as tabelas `Player_Attributes`, `Match` e `League`.

---

### 6. **Quais são os 5 times que mais sofreram gols como visitantes?**
Análise do `home_team_goal` nas partidas em que o time era o `away_team_api_id`.

---

### 7. **Qual a evolução do overall médio dos jogadores de um time específico ao longo dos anos?**
Exemplo: **"Como o nível técnico do elenco do Barcelona evoluiu de 2008 a 2016?"**  
Utilização de `JOIN`, `EXTRACT(YEAR)` e `AVG` para medir a evolução anual.

---

### 8. **Qual a média de cartões (amarelos + vermelhos) por time, por temporada?**
Consulta baseada na coluna `card` da tabela `Match`, com pré-processamento dos valores em XML e `JOIN` com a tabela `Team`.

---

## 📁 **Organização dos Arquivos**

Cada pergunta é resolvida em um arquivo `.sql` separado, localizado na pasta `/queries`. Os arquivos contêm comentários explicativos para facilitar o entendimento de cada consulta.

---

## 🛠️ **Tecnologias Utilizadas**

- PostgreSQL
- SQL puro (SELECT, JOIN, GROUP BY, WHERE, etc.)
- Dataset: [European Soccer Database](https://www.kaggle.com/datasets/hugomathien/soccer)

---

## 👨‍💻 **Autor**

Desenvolvido por **Augusto Coliselli**  
👉 [LinkedIn](https://www.linkedin.com/in/acolisi/)  
👉 [Portfólio](#) *(link opcional para adicionar depois)*

---

## ⭐ **Como Contribuir**

Se você quiser sugerir novas perguntas ou melhorias nas consultas, fique à vontade para abrir uma *issue* ou enviar um *pull request*! 
