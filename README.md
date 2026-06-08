# 💰 FinanceiroBD Dashboard

> 🇧🇷 Português | 🇺🇸 [English below](#-financeirobd-dashboard-english)

---

## 🇧🇷 Português

### Sobre o Projeto
Dashboard de controle financeiro pessoal desenvolvido do zero com SQL Server e Power BI. O projeto simula um controle real de receitas, despesas e metas mensais com 3 páginas analíticas.

### 🛠️ Tecnologias Utilizadas
- **SQL Server** — banco de dados relacional
- **SSMS** — gerenciamento e queries SQL
- **Power BI Desktop** — modelagem, DAX e dashboard

### 🗄️ Estrutura do Banco
- `Contas` — contas bancárias e formas de pagamento
- `Categorias` — categorias de receitas e despesas
- `Transacoes` — todas as movimentações financeiras
- `Metas` — valores planejados por categoria e mês
- `Calendario` — tabela de datas para análises temporais

### 📊 Páginas do Dashboard
- **Visão Geral** — saldo, receitas x despesas, evolução mensal
- **Relatório de Despesas** — análise detalhada com drill-down por categoria
- **Metas 2026** — planejado x realizado com status ✅ ❌

### 📐 Medidas DAX
```DAX
Total Receitas = CALCULATE(SUM(Transacoes[valor]), Transacoes[tipo] = "Receita")
Total Despesas = CALCULATE(SUM(Transacoes[valor]), Transacoes[tipo] = "Despesa")
Saldo = [Total Receitas] - [Total Despesas]
Total Planejado = SUM(Metas[valor_planejado])
Variacao Meta = DIVIDE([Total Despesas] - [Total Planejado], [Total Planejado], 0)
Status Meta = IF([Total Despesas] <= [Total Planejado], "✅ Dentro do orçamento", "❌ Acima do orçamento")
Semaforo = IF(Percentual > 1.10, "🔴 Crítico", IF(Percentual > 0.90, "🟡 Atenção", "🟢 Saudável"))
```

### 📁 Arquivos
| Arquivo | Descrição |
|---|---|
| `FinanceiroBD_Script.sql` | Script completo do banco |
| `FinanceiroBD_Dashboard.pbix` | Dashboard Power BI |

---

## 🇺🇸 English

### About the Project
Personal financial control dashboard built from scratch with SQL Server and Power BI. Simulates real control of income, expenses, and monthly goals across 3 analytical pages.

### 🛠️ Technologies
- **SQL Server** — relational database
- **SSMS** — database management and SQL queries
- **Power BI Desktop** — modeling, DAX and dashboard

### 🗄️ Database Structure
- `Accounts` — bank accounts and payment methods
- `Categories` — income and expense categories
- `Transactions` — all financial movements
- `Goals` — planned values per category and month
- `Calendar` — date table for time intelligence

### 📊 Dashboard Pages
- **Overview** — balance, income vs expenses, monthly evolution
- **Expenses Report** — detailed analysis with drill-down by category
- **Goals 2026** — planned vs actual with status ✅ ❌

### 📐 DAX Measures
```DAX
Total Income = CALCULATE(SUM(Transactions[value]), Transactions[type] = "Income")
Total Expenses = CALCULATE(SUM(Transactions[value]), Transactions[type] = "Expense")
Balance = [Total Income] - [Total Expenses]
Total Planned = SUM(Goals[planned_value])
Goal Variance = DIVIDE([Total Expenses] - [Total Planned], [Total Planned], 0)
Goal Status = IF([Total Expenses] <= [Total Planned], "✅ Within budget", "❌ Over budget")
Traffic Light = IF(Percentage > 1.10, "🔴 Critical", IF(Percentage > 0.90, "🟡 Warning", "🟢 Healthy"))
```

### 📁 Files
| File | Description |
|---|---|
| `FinanceiroBD_Script.sql` | Complete database script |
| `FinanceiroBD_Dashboard.pbix` | Power BI dashboard file |
