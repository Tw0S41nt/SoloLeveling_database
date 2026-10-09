# SoloFit Database Repository

Welcome to the central database repository for **SoloFit**. This repository contains the relational database design, Docker environment configuration, initialization SQL scripts, sample seed data, and business analytics queries.

## Repository Structure

```text
.
├── DATABASE/     
│   ├── Models/
│   │   ├── Conceptual Model/
│   │   │   └── Conceptual_Model.png
│   │   ├── Logical Model/
│   │   │   └── Logical_model.png
│   │   ├── Physical Model/
│   │   │   └── physical_model.dbml
│   │   │   └── physical_model.png
│   │   └── README.md
│   │
│   ├── Table initialization/
│   │   ├── compose.yml
│   │   ├── script.sql
│   │   └── README.md
│   │
│   └── Business Queries/
│       └── business_queries.md
│
├── physical-model/                   # Draft physical model assets
├── sql_queries/                      # Draft Business SQL queries
├── Conceptual_Model.png              # Draft conceptual diagram
├── Logical_model.png                 # Draft logical diagram
├── compose.yml                       # Draft Docker Compose configuration
├── script.sql                        # Draft database initialization script
└── README.md                         # Main repository documentation
```

**Note:** The files and folders at the repository root are working copies and are not the final submission. The finalized database models, initialization scripts, and business queries are maintained in the `DATABASE/` directory.


## Quick Start Guide

### 1. View Database Models

Review the conceptual, logical, and physical database designs, including entity relationships and schema descriptions, in the [Database Models README](DATABASE/Models/README.md).

### 2. Start the MariaDB Container

Make sure Docker and Docker Compose are installed and running.

Open a terminal in the repository root and run:

```bash
cd "DATABASE/Table initialization"
docker compose up -d
```

The initialization script (`script.sql`) is configured to create the database tables and insert sample seed data when the container is initialized for the first time.

For detailed setup instructions and troubleshooting, see the [Table Initialization README](DATABASE/Table%20initialization/README.md).

### 3. Connect Using DBeaver

Use the following connection details to connect to the local MariaDB database:

| Setting  | Value              |
| -------- | ------------------ |
| Host     | `localhost`        |
| Port     | `3306`             |
| Database | `SoloFit_Database` |
| Username | `user`             |
| Password | `password`         |

### 4. Business Analytics and Dashboard Queries

The [Business Queries SQL script](DATABASE/Business%20Queries/business_queries.md) contains SQL queries for core operational and analytical questions, including the home dashboard overview.

These queries support the retrieval and analysis of data needed by the SoloFit application.

## Technologies Used

* **MariaDB** — Relational database management system
* **Docker Compose** — Local database environment setup
* **DBeaver** — Database connection and management
