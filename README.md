# HealthTech — Gestão Preditiva e Rastreabilidade Inteligente de OPME

Projeto interdisciplinar desenvolvido na **Universidade Nove de Julho (UNINOVE)** para a concepção arquitetural, modelagem de dados, infraestrutura e governança de TI de uma distribuidora de **Órteses, Próteses e Materiais Especiais (OPME)** no Estado de São Paulo.

## 🎯 Objetivo do Projeto
Otimizar a cadeia de suprimentos médico-hospitalar por meio de um **Agente Inteligente de Estoque**, integrando Inteligência Artificial preditiva, Data Warehouse, Business Intelligence (BI), Sistemas Distribuídos e Governança alinhada ao ITIL 4 e às normas da Anvisa (RDC nº 665/2022 e sistema UDI/SIUD).

## 🏗️ Arquitetura e Tecnologias
- **Engenharia de Dados & BI:** Modelagem multidimensional *Star Schema*, pipelines ETL, dashboards em Power BI e indicadores de acurácia e validade FEFO.
- **Infraestrutura & Banco de Dados:** Ambiente virtualizado em Oracle VM VirtualBox com Ubuntu Server, Apache, MySQL, phpMyAdmin e VPN Tailscale.
- **Sistemas Distribuídos:** Arquitetura desacoplada por mensageria assíncrona com tratamento de idempotência.
- **Governança & Conformidade:** Processos ITIL 4, metas de continuidade (RTO/RPO), ISO/IEC 27001, ISO 22301 e LGPD.

## 📂 Estrutura do Repositório
- `README.md` — Visão geral da arquitetura, objetivos e equipe do projeto.
- `infraestrutura-vm-ubuntu.md` — Passo a passo técnico de provisionamento da VM Ubuntu Server, LAMP, MySQL, phpMyAdmin e VPN Tailscale.
- `database-dw-healthtech.sql` — Script DDL e DML de criação das tabelas dimensão do Data Warehouse e carga inicial de registros.
- `dashboard-bi-healthtech.pbix` — Painel analítico desenvolvido no Microsoft Power BI conectado ao modelo dimensional.
- `planilhas-dw-healthtech/` — Bases de dados em Excel (`.xlsx`) das tabelas dimensão utilizadas na carga e validação do ETL.

## 👥 Equipe
- **Ellen** — Scrum Master e Líder da Equipe
- **Felipe Tezinho** — Especialista em Inteligência Artificial
- **Victor** — Gestor de Serviços de TI
- **Vinícius** — Gestor de Fornecedores e Governança
- **Rafaela** — Analista de BI e Data Analytics
- **Ives** — Engenheiro de Dados (ETL/DW)
- **Felipe Kalleu** — Arquiteto de Infraestrutura
- **João Victor** — Engenheiro de Sistemas Distribuídos
- **Eric** — Gestor de Mídia, Documentação e Qualidade
