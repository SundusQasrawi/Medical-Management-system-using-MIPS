

# Patient Medical Test Record Management System (MIPS Assembly)

## 📖 Overview
This project implements a **basic patient medical test record management system** in **MIPS assembly language**.  
It is designed to **store, manage, and retrieve medical test data** for individual patients, providing a text-based menu.  

The system focuses on **medical test results** stored in a structured text file, allowing users to add, search, update, and delete records while ensuring input validation and error handling.

---

## 📂 File Format
Medical test data is stored in a text file, where each line represents a **single test record** in the following format:

PatientID: TestName, TestDate, Result

- **Patient ID**: 7-digit integer  
- **Test Name**: fixed string (e.g., Hgb, BGT, LDL, BPT)  
- **Test Date**: `YYYY-MM` format  
- **Result**: floating-point number  

### Example
1300500: Hgb, 2024-03, 13.5
1300511: LDL, 2024-03, 110

---

## 🧪 Supported Medical Tests and Normal Ranges
| Test | Normal Range |
|------|--------------|
| Hemoglobin (Hgb) | 13.8 – 17.2 g/dL |
| Blood Glucose Test (BGT) | 70 – 99 mg/dL |
| LDL Cholesterol (LDL) | < 100 mg/dL |
| Blood Pressure Test (BPT) | Systolic < 120 mm Hg, Diastolic < 80 mm Hg |

---

## ⚙️ Features
- **Add new test** with validation.  
- **Search by patient ID**:  
  - Retrieve all tests  
  - Retrieve abnormal tests only  
  - Retrieve tests in a date range  
- **Search abnormal tests** across all patients (for a given test).  
- **Average test value** per test type.  
- **Update** an existing test result.  
- **Delete** a test record.  
- **Error handling** for invalid input or missing records.  

---
