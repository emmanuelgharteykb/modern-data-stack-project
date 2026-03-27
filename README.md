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
   ``` Bash
   python3 -m venv dbt-env
   source dbt-env/bin/activate
   pip install dbt-duckdb
3. Download Raw Data:
   (Note: Following best practices, the 43MB dataset is not stored in Git. Use the command below to fetch it.)
   ``` Bash
   curl -L https://raw.githubusercontent.com/databricks/Spark-The-Definitive-Guide/master/data/retail-data/all/online-retail-dataset.csv -o seeds/online_retail.csv
4. Build & Test:
   ``` Bash
   dbt debug  # Check connection
   dbt seed   # Load raw data
   dbt run    # Transform data

## 🛠 Project Progress

### Day 1: Environment Setup
- Initialized Ubuntu VM using Multipass.
- Configured SSH keys for secure remote access via VS Code.

### Day 2: Data Ingestion & Infrastructure Scaling
- **Problem:** Encountered `Killed` status during `dbt seed` due to Out-Of-Memory (OOM) errors on the 1GB default VM.
- **Solution:** Scaled VM resources to 4GB RAM and 2 CPUs using Multipass CLI.
- **Problem:** Dependency conflicts with `unzip` and `duckdb` binary paths.
- **Solution:** Manually installed `unzip` and moved the DuckDB binary to `/usr/local/bin` for system-wide access.
- **Achievement:** Successfully ingested `online_retail.csv` (~542k rows) into a DuckDB database using `dbt seed`.

## 📈 Tech Stack
- **OS:** Ubuntu 22.04 (via Multipass)
- **Database:** DuckDB
- **Transformation:** dbt-core v1.11.7
- **Language:** Python 3.12 (Virtual Environment)
- **IDE:** VS Code (Remote-SSH)

## 🔍 Data Verification
Verified the ingestion with:
```bash
duckdb retail_data.duckdb "SELECT count(*) FROM online_retail LIMIT 10;"
# Result: 541909 rows
