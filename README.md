# Smart Agriculture System (SQL Project)

A relational database project that models a smart agriculture management system — tracking farmers, their farms, crops grown, yield records, and an auto-generated audit log for new yield entries.

## Overview
This project demonstrates core to advanced SQL concepts using a real-world agriculture scenario:
- Farmers register and own one or more farms
- Each farm grows one or more crops
- Each crop has associated yield (harvest quantity) records
- A trigger automatically logs every new yield entry into an audit table

## Database Schema

![ER Diagram](docs/er_diagram.svg)

**Tables:**
| Table | Description |
|---|---|
| `Farmer` | Stores farmer details (name, contact) |
| `Farm` | Farms owned by a farmer, linked via `FarmerID` |
| `Crop` | Crops grown on a farm, linked via `FarmID`, tracks growth `Status` |
| `YieldData` | Harvest quantity per crop, linked via `CropID` |
| `AuditLog` | Auto-populated log of new yield entries (via trigger) |

**Relationships:**
- `Farmer` (1) → (N) `Farm`
- `Farm` (1) → (N) `Crop`
- `Crop` (1) → (N) `YieldData`
- `YieldData` inserts → auto-logged into `AuditLog` (via trigger)

## Features Demonstrated
- ✅ Table creation with `PRIMARY KEY` / `FOREIGN KEY` constraints
- ✅ Data insertion (`INSERT`)
- ✅ Filtering & sorting (`WHERE`, `ORDER BY`)
- ✅ Aggregate functions (`COUNT`, `SUM`)
- ✅ Joins (`JOIN` between Farmer and Farm)
- ✅ Data updates & deletion (`UPDATE`, `DELETE`)
- ✅ Views (`CREATE VIEW`)
- ✅ Stored procedures (`CropReport`)
- ✅ Triggers (`YieldLog` — auto audit logging on new yield insert)

## Sample Queries

**Get all healthy crops:**
```sql
SELECT * FROM Crop
WHERE Status = 'Healthy';
```

**Total yield across all crops:**
```sql
SELECT SUM(Quantity) AS TotalYield FROM YieldData;
```

**Farmer + Farm join:**
```sql
SELECT Name, FarmName
FROM Farmer
JOIN Farm ON Farmer.FarmerID = Farm.FarmerID;
```

*(Add your query result screenshots here, e.g. `screenshots/query_result_1.png`)*

## Tools Used
- MySQL (uses `AUTO_INCREMENT`, `DELIMITER` syntax for procedures/triggers)
- MySQL Workbench / any MySQL-compatible client

## How to Run
1. Open MySQL Workbench (or any MySQL client / CLI)
2. Run the script:
   ```bash
   mysql -u root -p < schema.sql
   ```
   or open `schema.sql` in Workbench and execute it top to bottom
3. Explore the data:
   ```sql
   USE SmartAgricultureDB;
   SELECT * FROM CropView;
   CALL CropReport();
   ```

## Project Structure
```
smart-agriculture-system/
├── README.md
├── schema.sql
├── docs/
│   └── er_diagram.svg
└── screenshots/
    └── (add your query output screenshots here)
```

## Author
Add your name / GitHub profile link here.
