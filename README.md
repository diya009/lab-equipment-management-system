# College Lab Equipment Management System

| | |
|---|---|
| **Student** | Ms. Diya Agnihotri (PIET24CR034) |
| **Technology** | Java Swing, JDBC, embedded H2 database |
| **Key Feature** | Equipment availability tracking |
| **SDG Alignment** | SDG 4 (Quality Education), SDG 9 (Industry, Innovation & Infrastructure) |

A desktop application to maintain laboratory equipment details and record issue and return of equipment to students and faculty, with live availability tracking.

**New in this version:** uses an embedded H2 database (a single file inside the project folder). **No MySQL server needed.** Just install Java and double-click `Start App.bat`.

---

## How to Run

See **[HOW TO RUN.md](HOW%20TO%20RUN.md)** for the full step-by-step guide.

Quick version:
1. Install Java JDK 17 from https://adoptium.net/ (tick "Add to PATH").
2. Double-click **`Start App.bat`**.
3. Login with **`admin`** / **`admin123`**.

The database file (`data/lab_equipment_db.mv.db`) and sample equipment are created automatically on first run.

---

## Features

- **Login system**: Admin and Staff roles, SHA-256 hashed passwords, change password
- **Dashboard**: total, available and issued units, active and overdue issues, low-stock items, fine collected, lab-wise availability bars, overdue list, recent transactions
- **Equipment management**: add, edit and delete equipment (code, name, category, lab, quantity, condition, purchase date, cost), search and filter by category, lab or availability, export to CSV
- **Availability tracking**: automatic status (Available, Low Stock, Out of Stock, Not Available), colour-coded; stock updates automatically on every issue and return
- **Issue equipment**: issue to a Student, Faculty member, Lab Staff or Research Scholar with roll no, department, contact, quantity, issue date and due date, with validation (stock limit, dates, phone number)
- **Return equipment**: select a pending record; late fine is calculated automatically (Rs 10 per unit per day). Return condition can be Good, Damaged (marks the equipment *Needs Repair*) or Lost (adds replacement cost and removes the units from stock)
- **Records & Reports**: full history with filters (status, borrower type, date range, search), totals summary, **Export CSV** and **Print**
- **User management** (Admin only): create or delete staff accounts, reset passwords
- Database transactions with row locking, so stock counts can't go wrong

## Project Structure

```
diya/
├── LabEquipmentSystem.jar        Pre-built app (ready to run)
├── Start App.bat                 Double-click to launch
├── HOW TO RUN.md                 Simple step-by-step guide
├── db.properties                 Database file location (editable)
├── lib/h2-2.2.224.jar            H2 embedded database driver (bundled)
├── sql/schema.sql                Reference schema
├── src/com/lab/                  Java source
│   ├── Main.java
│   ├── db/                       DBConfig, DBConnection, DatabaseInitializer
│   ├── model/                    Equipment, IssueRecord, User
│   ├── dao/                      EquipmentDAO, IssueDAO, UserDAO
│   ├── ui/                       Swing screens
│   └── util/                     PasswordUtil, DateUtil, CsvExporter, Session
├── run.bat                       Rebuild from source (for developers)
└── build-jar.bat                 Rebuild single JAR (for developers)
```

## Database Design

- **users** (id, username, password_hash, full_name, role, created_at)
- **equipment** (id, equipment_code, name, category, lab_name, total_qty, available_qty, condition_status, purchase_date, unit_cost, description)
- **issue_records** (id, equipment_id → equipment.id, borrower_name, borrower_id, borrower_type, department, contact, quantity, issue_date, due_date, return_date, status, return_condition, fine, purpose, remarks, issued_by)

**Availability logic:** `available_qty` is reduced on issue and increased on return, inside a transaction. Lost items reduce `total_qty`. Equipment that is *Under Maintenance* or *Damaged* cannot be issued.

## Expected Outcome

A consultancy- and IPR-ready laboratory asset, issue/return and availability-management solution that reduces equipment loss, improves accountability, and gives students better access to lab resources (SDG 4 & SDG 9).
