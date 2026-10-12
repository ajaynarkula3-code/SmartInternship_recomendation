# Smart Internship Eligibility & Recommendation System

A modern, full-stack web application built with **React.js (Vite)**, **Java Spring Boot**, and **MySQL**. The system helps students discover internships matching their skills, academic performance, and career interests through an **Automated Eligibility Engine** and a **Weighted Recommendation Engine**.

---

## 1. System Overview

Finding relevant college internships can be overwhelming when students must manually compare varying criteria (CGPA cutoffs, accepted branches, graduation batches, required skills). 

**Smart Internship Eligibility & Recommendation System** solves this by:
1. **Automatically Evaluating Eligibility**: Transparently checking 6 academic and skill constraints and classifying applicants as **Eligible**, **Partially Matched**, or **Not Eligible** with detailed explanations.
2. **Personalized Recommendations**: Ranking opportunities using a multi-factor transparent scoring model (Skill Overlap 40%, Domain Interest 30%, Academic Merit 20%, Location Flexibility 10%).
3. **Streamlining Recruitment**: Providing dedicated portals for **Students**, **HR Recruiters**, and **System Administrators** with application tracking across **Pending**, **Shortlisted**, **Selected**, and **Rejected** stages.

---

## 2. Technology Stack

### Frontend
- **Framework**: React.js 18 with Vite
- **Routing**: React Router DOM v7
- **HTTP Client**: Axios with JWT Bearer Interceptors
- **Icons**: Lucide React
- **Design & Styling**: Custom responsive CSS (Blue, White, Light-Purple theme), cards, data tables, status badges, progress bars, interactive modals

### Backend
- **Framework**: Java 17+ with Spring Boot
- **Web**: Spring Web MVC RESTful APIs
- **ORM & Database Access**: Spring Data JPA & Hibernate
- **Security**: JWT (JJWT 0.11.5) with BCrypt password hashing & role-based interceptors
- **Build Tool**: Apache Maven

### Database
- **Engine**: MySQL 8.0+
- **Database Name**: `internship_db`
- **Port**: 3306

---

## 3. User Roles & Features

### 🎓 Student
- **Secure Registration & Login** with JWT.
- **Academic Profile Management**: CGPA, degree (B.Tech, BCA, MCA, M.Tech, etc.), branch, graduation year, career domain, preferred location, bio, resume URL.
- **Technical Skills Inventory**: Add programming languages/frameworks with proficiency levels (Beginner, Intermediate, Advanced).
- **Automated Eligibility Checker**: Real-time breakdown of which criteria are satisfied vs. missing before applying.
- **Top Recommendations**: Ranked view of internships tailored specifically to the student's profile.
- **Application Submission & Tracking**: Prevents duplicate applications; tracks status: `PENDING`, `SHORTLISTED`, `SELECTED`, `REJECTED`, and displays recruiter feedback notes.

### 🏢 HR / Recruiter
- **Listing Management**: Post, update, and manage company internships with customizable criteria.
- **Eligibility Engine Rules**: Define minimum CGPA, accepted degrees, branches, graduation batches, and mandatory skills.
- **Candidate Screening**: Advanced multi-filter view to screen applicants by Eligibility Outcome, Minimum CGPA, Technical Skills, and Degrees.
- **Application Decision Workflow**: Advance applicants with 1-click Shortlist, Select, or Reject, or write custom interview feedback notes.

### 🛠️ Administrator
- **Executive Analytics Dashboard**: Real-time KPI cards (Total Students, Active Internships, Total Applications, Selected Candidates).
- **Hiring Funnel & Domain Metrics**: Visual breakdown of applications and industry domain coverage.
- **Internship Management**: Create, edit, toggle active status, or delete listings.
- **Student Directory**: Inspect all registered students, their CGPAs, branches, and technical skills.
- **Applications Oversight**: Complete review and status management across all companies.

---

## 4. Internship Eligibility Engine

For any internship, the engine evaluates 6 distinct criteria:

| Criterion | Rule Logic | Satisfied Condition |
| :--- | :--- | :--- |
| **1. Minimum CGPA** | Compares student CGPA against internship `minCgpa` | `studentCGPA >= minCgpa` (Borderline within 0.4 marked as Partial) |
| **2. Degree Qualification** | Checks if student degree matches eligible degree list | Matches degree list (e.g., B.Tech, BCA) or rule is set to `All` |
| **3. Branch Specialization** | Verifies student academic department | Matches branch list (e.g., CSE, IT, ECE) or rule is set to `All` |
| **4. Graduation Batch** | Checks student target graduation year | Class year matches requirement (e.g., 2025, 2026) or set to `All` |
| **5. Required Skills** | Validates mandatory and optional skill overlap | All mandatory skills present in student skill profile |
| **6. Work Mode & Location**| Assesses physical location or remote eligibility | 100% Remote or student location aligns with company office |

### Engine Results:
- **Eligible**: Satisfies all academic gates and all mandatory technical skills.
- **Partially Matched**: Satisfies primary academic requirements but has partial skill overlap or location difference.
- **Not Eligible**: Fails one or more hard constraints (e.g. CGPA < minimum required, degree/branch mismatch).

---

## 5. Internship Recommendation Algorithm

A transparent, mathematical scoring model ranking opportunities from **0% to 100%**:

$$\text{Total Score} = \text{Skill Score (40)} + \text{Domain Score (30)} + \text{Academic Score (20)} + \text{Location Score (10)}$$

1. **Skill Match Score (40% Weight)**:
   $$\text{Score} = \left(\frac{\text{Matched Required Skills}}{\text{Total Required Skills}}\right) \times 40$$
2. **Domain Alignment Score (30% Weight)**:
   - Direct match between student preferred domain and internship domain: **30 points**
   - Closely related domain (e.g., Software Dev $\leftrightarrow$ Java Dev): **20 points**
   - General domain: **8–15 points**
3. **Academic Merit & Eligibility Margin (20% Weight)**:
   - Student CGPA exceeds required cutoff by $\ge 1.0$: **12 points**
   - Student CGPA meets required cutoff: **10 points**
   - Qualification & branch verified: **8 points bonus**
4. **Location & Work Mode (10% Weight)**:
   - Remote role or matching city preference: **10 points**
   - Relocation needed: **4 points**

*Ineligible roles have their match score capped at 45% to guarantee eligible roles rank higher.*

---

## 6. Pre-Seeded Demonstration Accounts

The application automatically seeds test accounts on first startup:

| Role | Name | Email | Password | Profile Highlights |
| :--- | :--- | :--- | :--- | :--- |
| **Admin** | System Administrator | `admin@smartintern.com` | `admin123` | Full administrative control |
| **HR** | Sarah Jenkins (Google) | `hr@google.com` | `hr123` | Recruiter for Cloud roles |
| **HR** | David Miller (Microsoft) | `hr@microsoft.com` | `hr123` | Recruiter for AI & Systems |
| **Student** | Rahul Sharma | `rahul@gmail.com` | `student123` | B.Tech CSE (2025), **8.8 CGPA**, Java, Spring Boot, MySQL |
| **Student** | Priya Patel | `priya@gmail.com` | `student123` | B.Tech IT (2026), **7.5 CGPA**, Python, Machine Learning, Pandas |
| **Student** | Amit Kumar | `amit@gmail.com` | `student123` | BCA (2025), **6.9 CGPA**, React, JavaScript, HTML, CSS |
| **Student** | Ananya Verma | `ananya@gmail.com` | `student123` | B.Tech ECE (2024), **8.4 CGPA**, AWS, Docker, Kubernetes, Linux |
| **Student** | Vikram Singh | `vikram@gmail.com` | `student123` | M.Tech CSE (2025), **9.2 CGPA**, Cybersecurity, Networks, Linux |

*(Note: On the login page, you can also use the convenient 1-click buttons to autofill demo credentials!)*

---

## 7. Project Directory Structure

```
tt-project/
├── backend/
│   ├── pom.xml
│   └── src/
│       └── main/
│           ├── java/com/smartintern/
│           │   ├── SmartInternApplication.java
│           │   ├── config/
│           │   │   ├── DataInitializer.java        # Seeds realistic sample data & demo users
│           │   │   └── WebConfig.java              # CORS & Interceptor registration
│           │   ├── controller/
│           │   │   ├── ApplicationController.java
│           │   │   ├── AuthController.java
│           │   │   ├── DashboardController.java
│           │   │   ├── EligibilityController.java
│           │   │   ├── InternshipController.java
│           │   │   ├── RecommendationController.java
│           │   │   └── StudentController.java
│           │   ├── dto/                            # Data Transfer Objects
│           │   ├── model/                          # JPA Entities (User, Internship, StudentProfile, etc.)
│           │   ├── repository/                     # Spring Data JPA Repositories
│           │   ├── security/                       # JWT Util, JwtAuthFilter, UserContext
│           │   └── service/                        # Business Logic, Eligibility & Recommendation Engines
│           └── resources/
│               └── application.properties          # MySQL connectivity, port, JWT secrets
├── frontend/
│   ├── package.json
│   ├── vite.config.js
│   ├── index.html
│   └── src/
│       ├── App.jsx                                 # 15 routes with role-based Route Guards
│       ├── index.css                               # Modern responsive UI design
│       ├── main.jsx
│       ├── api/axios.js                            # Axios client with JWT interceptor
│       ├── context/AuthContext.jsx                 # Auth session & role state management
│       ├── components/
│       │   ├── Navbar.jsx
│       │   ├── Footer.jsx
│       │   ├── InternshipCard.jsx
│       │   ├── EligibilityModal.jsx                # Detailed criteria audit popup
│       │   └── ApplicationModal.jsx
│       └── pages/
│           ├── Home.jsx                            # Landing page
│           ├── Login.jsx                           # Sign in with 1-click demo buttons
│           ├── Register.jsx                        # Student / HR registration
│           ├── StudentDashboard.jsx                # Student dashboard & quick metrics
│           ├── StudentProfile.jsx                  # Profile & skills editor
│           ├── InternshipListings.jsx              # Searchable catalog with multi-filters
│           ├── RecommendedInternships.jsx          # Ranked recommendations
│           ├── InternshipDetails.jsx               # Deep-dive with live eligibility evaluator
│           ├── MyApplications.jsx                  # Application tracking & notes
│           ├── AdminDashboard.jsx                  # Analytics, charts, platform stats
│           ├── ManageInternships.jsx               # Add, edit, delete internships
│           ├── ManageStudents.jsx                  # View registered candidate profiles
│           ├── ManageApplications.jsx              # Status transition pipeline
│           ├── HRDashboard.jsx                     # Recruiter dashboard
│           └── HRApplicants.jsx                    # Filter applicants by eligibility/CGPA/skills
├── schema.sql                                      # Database creation script
├── run-backend.bat                                 # 1-click backend runner
├── run-frontend.bat                                # 1-click frontend runner
└── README.md
```

---

## 8. Step-by-Step Execution Instructions

### Prerequisites
1. **Java JDK 17 or higher** (JDK 17, 21, or 26).
2. **Apache Maven 3.8+**.
3. **Node.js 18+ & npm**.
4. **MySQL Server 8.0+** running on port `3306`.

---

### Step 1: Database Setup
Ensure MySQL is running. The application automatically creates the database if it does not already exist, or you can create it manually:

```sql
CREATE DATABASE IF NOT EXISTS internship_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Verify your credentials in `backend/src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/internship_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=ajay2028
```
*(Update `spring.datasource.password` if your local MySQL root password is different).*

---

### Step 2: Start the Backend (Spring Boot)
Open a terminal in the root directory (or in VS Code terminal):

```bash
cd backend
mvn spring-boot:run
```
*(Or simply double-click `run-backend.bat`).*

- The backend will compile and start Tomcat on **`http://localhost:8080`**.
- It will automatically connect to MySQL and seed default accounts, sample students, and realistic internships.

---

### Step 3: Start the Frontend (React Vite)
Open a second terminal:

```bash
cd frontend
npm install
npm run dev
```
*(Or simply double-click `run-frontend.bat`).*

- The frontend will start at **`http://localhost:5173`**.
- Open your browser to **`http://localhost:5173`**.

---

## 9. Troubleshooting & Common Fixes

1. **MySQL Access Denied (Error 1045)**:
   - Check your password in `backend/src/main/resources/application.properties` under `spring.datasource.password`.
   - Ensure the MySQL service (`MySQL80`) is running. On Windows PowerShell, verify with:
     ```powershell
     Get-Service -Name *mysql*
     ```
2. **Port 8080 or 5173 already in use**:
   - Backend: Change `server.port=8081` in `application.properties` and update `vite.config.js` proxy.
   - Or kill the process occupying port 8080:
     ```powershell
     Stop-Process -Id (Get-NetTCPConnection -LocalPort 8080).OwningProcess -Force
     ```
3. **CORS issues**:
   - The backend includes a global CORS configuration in `WebConfig.java` allowing `http://localhost:5173`, and the Vite dev server includes a reverse proxy under `/api`.

---

## 10. Change Log (review & fixes)

- **Delete internship** no longer fails with a foreign-key error when the listing has applications (applications are removed first).
- **HR applicant list** now only returns applicants for the HR user's own internships and respects the `internshipId` filter (previously fell back to *all* applications).
- **`/api/eligibility/check`** is now restricted to ADMIN/HR roles.
- **Registration** can no longer create ADMIN accounts through the public API.
- **Seed data** runs in one transaction, so a failed first start can't leave a half-seeded database.
- **Frontend session expiry**: an expired/invalid token now clears the session and redirects to `/login`.
- Removed stale build output (`backend/target`, `frontend/dist`); rebuild with `mvn spring-boot:run` / `npm run dev`.
#   p r o j e c t - f r o n t  
 