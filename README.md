# 🌾 Farm 2 Shop Web Application

[![Java](https://img.shields.io/badge/Java-8-orange.svg)](https://www.oracle.com/java/)
[![Maven](https://img.shields.io/badge/Maven-3.8+-blue.svg)](https://maven.apache.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-42.6-blue.svg)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://www.docker.com/)
[![Render](https://img.shields.io/badge/Deploy-Render-black.svg)](https://render.com/)

**Farm 2 Shop** is a modern, direct-to-market web platform that connects farmers directly with shopkeepers and retailers. By eliminating unnecessary intermediaries, the platform empowers farmers to get fair market value for their produce while enabling shopkeepers to source fresh, high-quality farm goods efficiently and transparently.

---

## ✨ Features & User Portals

### 👨‍🌾 Farmer Portal
- **Product Management**: Add, update, and showcase fresh farm produce along with pricing, quantity, unit details, and product images.
- **Booking & Order Tracking**: View customer orders, track fulfillment status, and monitor logistics in real time.
- **Payment Monitoring**: Track earnings, pending payments, and transaction history.
- **Complaint & Resolution System**: Submit complaints regarding orders or payments and receive admin assistance.

### 🛒 Shopkeeper Portal
- **Product Catalog**: Explore available products listed by registered local farmers.
- **Order Placement**: Place bulk bookings directly with farmers.
- **Order Status Tracking**: Follow order progression from farm dispatch to shop delivery.
- **Payment Processing**: Seamless payment settlement for completed bookings.
- **Feedback & Complaints**: Report issues regarding product quality or delayed deliveries.

### 🛠️ Admin Dashboard
- **Farmer & Shopkeeper Management**: Verify, approve, and manage user accounts across the platform.
- **Complaints Desk**: Review and resolve complaints raised by farmers or shopkeepers.
- **Sales & Analytics**: Access detailed platform sales reports and transactional metrics.

---

## 🛠️ Technology Stack

| Component | Technology |
| :--- | :--- |
| **Backend Framework** | Java 8 EE (Servlets & JSP), JSTL |
| **Database** | PostgreSQL |
| **Connection Pooling** | HikariCP |
| **Build & Dependency Tool** | Apache Maven |
| **App Server** | Apache Tomcat 9 |
| **Containerization** | Docker (Multi-stage build) |
| **Deployment Platform** | Render (`render.yaml`) |
| **Frontend** | HTML5, CSS3, JavaScript, JSP |

---

## 📂 Project Structure

```text
FarmToShopWeb/
├── Dockerfile                  # Multi-stage Docker build configuration
├── pom.xml                     # Maven dependencies & build plugins
├── render.yaml                 # Deployment configuration for Render
├── start.sh                    # Container entrypoint script
├── src/
│   └── main/
│       ├── java/com/farmtoshop/
│       │   ├── db/             # Database connection & connection pool setup
│       │   ├── model/          # Data Models (Farmer, Shopkeeper, Admin, Product, Booking, etc.)
│       │   ├── servlet/        # Servlets (Authentication, Farmer, Shopkeeper, Admin handlers)
│       │   └── util/           # Utility classes & schema runners
│       ├── resources/          # Configuration files & SQL scripts
│       └── webapp/             # JSP pages, CSS, JS, static assets & uploads
│           ├── index.jsp       # Landing page
│           ├── login.jsp       # User authentication
│           ├── register.jsp    # User registration
│           └── WEB-INF/jsp/    # Protected JSP views for Admin, Farmer, and Shopkeeper
```

---

## 🚀 Getting Started

### Prerequisites
Make sure you have the following installed on your local environment:
- **Java JDK 8** or higher
- **Apache Maven 3.8+**
- **PostgreSQL 12+**
- **Docker** *(Optional, for containerized execution)*

---

### Database Configuration

1. Create a PostgreSQL database (e.g., `farmtoshop`).
2. Set your database connection parameters via environment variables or in `DBConnection.java`:
   ```bash
   export JDBC_DATABASE_URL="jdbc:postgresql://localhost:5432/farmtoshop"
   export DB_USER="postgres"
   export DB_PASSWORD="your_password"
   ```

---

### Running Locally with Maven

You can launch the web application directly using embedded Tomcat:

```bash
mvn clean compile tomcat7:run
```

Once started, open your browser and navigate to:
```text
http://localhost:8080/FarmToShopWeb
```

---

### Running with Docker

1. **Build the Docker image:**
   ```bash
   docker build -t farmtoshop-web .
   ```

2. **Run the container:**
   ```bash
   docker run -p 8080:10000 \
     -e JDBC_DATABASE_URL="jdbc:postgresql://host.docker.internal:5432/farmtoshop" \
     -e DB_USER="postgres" \
     -e DB_PASSWORD="your_password" \
     farmtoshop-web
   ```

3. Open `http://localhost:8080` in your web browser.

---

## 🌐 Deployment

This project includes a native `render.yaml` specification for zero-config Docker deployment on **Render**:

1. Push your code to GitHub.
2. Connect your repository to **Render**.
3. Render will auto-detect `render.yaml` and build the containerized Maven/Tomcat service automatically.

---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).
