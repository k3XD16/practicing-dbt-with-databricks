# 📊 Practicing dbt (Databricks + Medallion Architecture)

![dbt infographic](/assets/dbt-infographic.png)

**This repository is a hands-on dbt practice project built to understand how dbt works end-to-end using a Medallion architecture *(Bronze → Silver → Gold)* on Databricks, with seeds, tests, snapshots, and environment targets.**

**The goal of this project is learning dbt fundamentals the right way, before applying them to real production projects.**

## 🧱 Project Structure

```plain
practicing-dbt/
│
├── dbt_databricks_project/
│   ├── analyses/          # Ad-hoc analysis queries
│   ├── macros/            # Custom dbt macros (Jinja)
│   ├── models/
│   │   ├── bronze/        # Raw cleaned layer
│   │   ├── silver/        # Business logic layer
│   │   ├── gold/          # Analytics-ready models
│   │   └── source/        # Source definitions
│   ├── seeds/             # Static CSV data (lookup tables)
│   ├── snapshots/         # Slowly changing dimensions
│   ├── tests/             # Custom data tests
│   ├── dbt_project.yml    # dbt project configuration
│   ├── profiles.yml       # Databricks connection profiles
│   └── README.md
│
├── requirements.txt
├── pyproject.toml
└── README.md
```

## 🏗️ Architecture Overview

```txt
Raw Data (Databricks)
        ↓
Bronze Models (dbt)
        ↓
Silver Models (dbt)
        ↓
Gold Models (dbt)
        ↓
Analytics / BI (Power BI, SQL)
```

## 🔑 Key Concepts Practiced

- dbt models (table & view materializations)

- Medallion architecture

- dbt seeds (CSV → tables)

- dbt tests

    - not_null

    - unique

    - accepted_values

    - custom generic tests

- dbt snapshots

- dbt macros (Jinja)

- `ref()` vs `source()`

- dev vs prod targets

- dbt compilation vs execution

- Databricks catalog & schema handling

## 🧪 dbt Commands Used

```bash

# Validate setup
dbt debug

# Run models
dbt run

# Load seeds
dbt seed

# Run tests
dbt test

# Build everything (models + tests + seeds + snapshots)
dbt build

# Compile SQL only
dbt compile
```

## 🌱 Seeds Example

Static lookup data stored in `seeds/lookup.csv` and loaded using:

```bash
dbt seed
```

Referenced in models using:

```sql
SELECT * FROM {{ ref('lookup') }}
```

## 🧪 Testing Strategy

- Column-level tests defined in `properties.yml`

- Custom SQL tests under `tests/`

- Failures stop the pipeline (as expected in production)

## 🧠 Learning Outcomes

- By completing this project, I gained clarity on:

- Why dbt SQL cannot be executed directly without compilation

- How dbt resolves `ref()` and `source()`` internally

- How environment targets (`dev`, `prod`) affect data locations

- Common dbt errors and how to debug them correctly

## 🚀 Next Improvements

- Add documentation with `dbt docs generate`

- Add exposures for BI dashboards

- Introduce incremental models

- Add CI checks using GitHub Actions


# 🧑‍💻 Author

### Mohamed Khasim
### [Linkedin](https://www.linkedin.com/in/mohamedkhasim16/)
#### Data Engineer | ETL Developer | BI Developer