# 🌾 Smart Agriculture Database Management System

![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 📖 Description

A MySQL database project developed to manage **farmers, farms, crops, and crop yield data**. The system tracks which farmer owns which farm, what crops are grown on each farm, their growth status, and the yield produced — while automatically logging every new yield entry through a trigger.

This project demonstrates core relational database concepts including table design, referential integrity, joins, views, stored procedures, and triggers.

## ✨ Features

- ✅ CRUD Operations (Create, Read, Update, Delete)
- ✅ Aggregate Functions (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`)
- ✅ Multi-table `INNER JOIN` queries
- ✅ `VIEW` for simplified crop reporting
- ✅ Stored Procedure (`CropReport`)
- ✅ Trigger (`YieldLog`) for automatic audit logging
- ✅ Audit Log table to track system activity

## 🗄️ Database Tables

| Table | Description |
|---|---|
| `Farmer` | Stores farmer details (name, contact) |
| `Farm` | Farms owned by farmers, linked via `FarmerID` |
| `Crop` | Crops grown on each farm, linked via `FarmID` |
| `YieldData` | Yield quantity recorded per crop, linked via `CropID` |
| `AuditLog` | Automatically logs new yield entries via trigger |

**Relationships:** `Farmer (1) → (M) Farm (1) → (M) Crop (1) → (M) YieldData`

## 🖼️ ER Diagram

See [`database/ER_Diagram.png`](https://github.com/7262ameer42/Smart_Agriculture_Management_System/blob/main/Smart_Agriculture_Management_System/ER%20Diagram.mwb) for the full entity-relationship diagram, and [`database/Database_Schema.pdf`](https://github.com/7262ameer42/Smart_Agriculture_Management_System/blob/main/Smart_Agriculture_Management_System/SmartAgricultureDB_Schema_Documentation.pdf) for detailed schema documentation.

## 🛠️ Technologies Used

- MySQL
- MySQL Workbench
- SQL (DDL, DML, DQL, Views, Stored Procedures, Triggers)

## ▶️ How to Run

1. Open MySQL Workbench (or any MySQL client).
2. Open `database/SmartAgricultureDB.sql`.
3. Execute the script (this drops any existing copy, creates the database, all tables, sample data, and objects).
4. The database and all tables, views, procedures, and triggers will be created automatically.
5. Run `CALL CropReport();` to test the stored procedure.
6. Insert a new row into `YieldData` and check `SELECT * FROM AuditLog;` to see the trigger in action.

## 📸 Sample Output

Screenshots of table data, join query results, view output, stored procedure output, and trigger output are available in the [`screenshots/`](https://github.com/7262ameer42/Smart_Agriculture_Management_System/tree/main/Smart_Agriculture_Management_System/Screenshots) folder.

## 📄 Project Report

A detailed project report is available at [`docs/Project_Report.pdf`](https://github.com/7262ameer42/Smart_Agriculture_Management_System/blob/main/Smart_Agriculture_Management_System/Project_Report.pdf).

## 👤 Author

**Muhammad Ameer Abdullah**


## 📜 License

This project is licensed under the [MIT License](https://github.com/7262ameer42/Smart_Agriculture_Management_System/blob/main/Smart_Agriculture_Management_System/LICENSE).
