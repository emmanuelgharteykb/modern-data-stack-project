# 🦆 Modern Data Stack: Retail Analytics (dbt + DuckDB)

## 🎯 Project Overview
This project demonstrates a **Modern Data Stack (MDS)** architecture by building a localized, high-performance data warehouse. As an aspiring DevOps/Analytics Engineer, I moved away from traditional spreadsheet analysis to implement **Analytics Engineering** best practices: Version Control, Modular SQL, and Automated Testing.

## 🏗️ Architecture
- **Storage & Compute:** [DuckDB](https://duckdb.org/) (In-process OLAP database for lightning-fast analytics).
- **Transformation:** [dbt Core](https://www.getdbt.com/) (Data Build Tool) for modularizing SQL and maintaining data lineage.
- **Environment:** Isolated Python Virtual Environment for dependency management.

## 🛠️ Key Technical Implementations
- **Virtualization:** Managed Python `venv` to ensure production-parity and clean dependency isolation.
- **Infrastructure-as-Code (for Data):** Treating SQL transformations as version-controlled code rather than static scripts.
- **Security:** Implemented `.gitignore` protocols to prevent data leakage and maintain repository hygiene.

## 🚀 How to Run
1. **Clone the repo:** `git clone https://github.com/YOUR_USERNAME/modern-data-stack-project.git`
2. **Setup Environment:**
3. ``` Bash
   python3 -m venv dbt-env
   source dbt-env/bin/activate
   pip install dbt-duckdb
