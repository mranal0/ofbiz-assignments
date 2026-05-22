# Relationship Manager Component (`relationshipmgr`)

A custom Moqui component built to manage Party and Contact Mechanism relationships using Mantle UDM concepts.

---

# 📌 Overview

The `relationshipmgr` component demonstrates enterprise-level relational data modeling using the Moqui Framework.

The project is designed around Mantle UDM principles and showcases:

- Supertype / Subtype modeling
- Association entities
- Classification-based design
- CRUD operations
- XML-based entity and UI development

The system manages:

- Persons
- Organizations
- Roles
- Contact Mechanisms
- Postal Addresses
- Telecom Numbers

---

# 🏗️ Architecture & Data Modeling

## Supertype / Subtype Modeling

### Party Hierarchy

`RmgrParty` acts as the supertype entity.

Subtypes:

- `RmgrPerson`
- `RmgrOrganization`

This structure allows shared party data to remain centralized while storing subtype-specific attributes separately.

---

### Contact Mechanism Hierarchy

`RmgrContactMech` acts as the base entity.

Subtypes:

- `RmgrPostalAddress`
- `RmgrTelecomNumber`

This enables extensibility for multiple contact mechanism types.

---

# 🔗 Association / Intersection Entities

## `RmgrPartyRole`

Maps relationships between:

- Parties
- Roles

Supports multiple role assignments for a single party.

---

## `RmgrPartyContactMech`

Maps relationships between:

- Parties
- Contact Mechanisms

Supports historical tracking using:

- `fromDate`
- `thruDate`

---

# 🧩 Core Entities

| Entity | Purpose |
|---|---|
| `RmgrParty` | Base Party entity |
| `RmgrPerson` | Person details |
| `RmgrOrganization` | Organization details |
| `RmgrRoleType` | Role classifications |
| `RmgrPartyRole` | Party ↔ Role mapping |
| `RmgrContactMech` | Base contact mechanism |
| `RmgrPostalAddress` | Address details |
| `RmgrTelecomNumber` | Telecom details |
| `RmgrPartyContactMech` | Party ↔ Contact mapping |

---

# ⚙️ Backend Implementation

Implemented using:

- XML Entity Definitions
- XML Services
- XML Forms
- XML Screens

The component supports complete CRUD functionality for:

- Parties
- Persons
- Organizations
- Roles
- Contact Mechanisms

---

# 🖥️ UI / UX Features

Built Moqui screens and forms for:

- Person Management
- Organization Management
- Role Management
- Address Management
- Telecom Management

Features include:

- Create
- View
- Update
- Delete operations

---

# 🧪 Sample Demo Data

## Organizations

- Springfield Engineering College
- Computer Science Department
- Mechanical Department
- Electrical Department

---

## Persons

### Teachers

- Amit Sharma
- Neha Verma

### Students

- Rahul Yadav
- Priya Sahu
- Arjun Patel

---

## Roles

- COLLEGE
- DEPARTMENT
- STUDENT
- TEACHER

---

# 📂 Example Relationships

## Student → Address Mapping

```text
Rahul Yadav (STU100)
    ↓
PartyContactMech
    ↓
Postal Address
    ↓
Raipur, Chhattisgarh
