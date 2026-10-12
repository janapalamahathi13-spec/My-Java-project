# NexusPay • Employee Payroll Management System

A full-stack, enterprise-grade **Employee Payroll Management System** built with **Java / Spring Boot** on the backend and **React JS (Vite + Tailwind CSS)** on the frontend.

---

## 🌟 Key Features

1. **Dashboard Command Center**:
   - Real-time KPIs: Total Workforce, Monthly Payroll Disbursal, Average Salary, Pending Batches.
   - Interactive departmental payroll allocation & cost breakdown.
   - Chronological logs of previous payroll cycles.

2. **Employee Directory & Compensation Management**:
   - Complete CRUD operations for employees with personal, departmental, and banking/tax profiles.
   - Instant search by name, employee code, designation, or department.
   - Status tracking (`Active`, `On Leave`, `Inactive`).

3. **Salary Structure & Compensation Breakdown Engine**:
   - Automated formula for standard earnings and statutory deductions:
     - **Earnings**: Basic Pay, House Rent Allowance (HRA), Dearness Allowance (DA), Medical, Conveyance, Special Allowance.
     - **Deductions**: Provident Fund (PF), Tax Deducted at Source (TDS), Professional Tax (PT), Group Health Insurance.
   - Live net salary calculation modal with custom adjustments per employee.

4. **Payroll Processing & Proration Engine**:
   - Configurable pay period (Month, Year, Standard Working Days).
   - Attendance tracking with live present days, paid leaves, and unpaid leaves (Loss of Pay / LOP).
   - Automated proration of earnings and loss-of-pay deductions based on attendance ratios.
   - Batch status lifecycle: `DRAFT` ➔ `PROCESSED` ➔ `PAID`.
   - One-click disbursal that generates official payment reference numbers (`PAY-YYYYMM-EMPXXXX`).

5. **Official Payslip Generation & Printing**:
   - Standard company payslip layout compliant with corporate and tax formats.
   - Displays company headers, registration details (CIN/GSTIN), employee credentials, banking details, itemized earnings & deductions.
   - Net pay displayed in numbers and spelled out in words (e.g. *"One Lakh Ten Thousand Rupees Only"*).
   - Print-ready layout with dedicated CSS styling (`window.print()` / Save as PDF).

6. **Analytics, Compliance & CSV Export**:
   - Real-time statutory compliance audit: Provident Fund pool, TDS tax withholdings, state Professional Tax, corporate health insurance.
   - Compensation bracket distribution (<50k, 50k-100k, 100k-150k, >150k).
   - One-click CSV export of workforce compensation records.

---

## 🏗️ Architecture & Technology Stack

| Layer | Technologies |
|---|---|
| **Backend** | Java 21 / 25, Spring Boot 3.x / 4.x, Spring Web, Spring Data JPA, Bean Validation, Lombok, H2 In-Memory DB |
| **Frontend** | React 19, Vite, Tailwind CSS v4, Lucide React Icons, Axios |
| **Database** | Embedded H2 Database (with H2 Web Console at `/h2-console`) |

---

## 🚀 Getting Started

### Prerequisites
- **Java**: JDK 21 or later (`java -version`)
- **Node.js**: v18 or later and npm (`node -v`, `npm -v`)

---

### 1. Running the Spring Boot Backend

Open a terminal and navigate to the `backend/` directory:

```bash
cd backend
# On Windows:
.\mvnw.cmd spring-boot:run

# On Linux / macOS:
./mvnw spring-boot:run
```

- Backend server starts on **`http://localhost:8080`**.
- Sample seed data (12 employees across Engineering, HR, Finance, Sales, Marketing + past payroll cycles) is automatically loaded upon startup.
- **H2 Console URL**: `http://localhost:8080/h2-console`
  - JDBC URL: `jdbc:h2:mem:payrolldb`
  - User Name: `sa`
  - Password: *(leave blank)*

---

### 2. Running the React Frontend

Open a second terminal and navigate to the `frontend/` directory:

```bash
cd frontend
npm install
npm run dev
```

- Frontend development server starts on **`http://localhost:5173`**.
- Open your browser at `http://localhost:5173` to explore the system!

---

## 📡 REST API Reference

### Employees (`/api/employees`)
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/employees` | List all employees (supports `?search=`, `?department=`, `?status=`) |
| `GET` | `/api/employees/{id}` | Get employee by ID |
| `POST` | `/api/employees` | Create a new employee |
| `PUT` | `/api/employees/{id}` | Update employee details |
| `DELETE` | `/api/employees/{id}` | Remove an employee |
| `PUT` | `/api/employees/{id}/salary-structure` | Update custom allowances & deductions |
| `GET` | `/api/employees/departments` | List distinct departments |

### Payroll (`/api/payroll`)
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/payroll/periods` | List all monthly payroll cycles |
| `GET` | `/api/payroll/periods/{id}` | Get cycle details by ID |
| `GET` | `/api/payroll/periods/find?month=X&year=Y` | Get cycle by month & year |
| `POST` | `/api/payroll/process` | Calculate / run payroll batch with attendance data |
| `POST` | `/api/payroll/periods/{id}/pay` | Disburse batch and mark as PAID |
| `DELETE` | `/api/payroll/periods/{id}` | Delete draft payroll cycle |

### Payslips (`/api/payslips`)
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/payslips` | List payslips (supports `?month=`, `?year=`, `?department=`, `?status=`) |
| `GET` | `/api/payslips/{id}` | Get detailed payslip breakdown |
| `GET` | `/api/payslips/employee/{empId}` | Get payslip history for an employee |

### Dashboard (`/api/dashboard`)
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/dashboard/stats` | KPI metrics, departmental spend, and monthly trends |
