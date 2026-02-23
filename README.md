# Local Business Discovery Web Application

A full-stack web application that helps users discover local businesses based on their location and preferences. Businesses can register, manage their profiles, and promote themselves.

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [API Endpoints](#api-endpoints)
- [Demo Credentials](#demo-credentials)
- [Features & Usage](#features--usage)
- [Database Schema](#database-schema)
- [File Structure](#file-structure)
- [Troubleshooting](#troubleshooting)

## ✨ Features

### For Users
- 🔍 **Search Businesses** - Search by business name, category, or description
- 📍 **Location-Based Filtering** - Find nearby businesses based on your location
- 📱 **Responsive UI** - Works seamlessly on desktop and mobile devices
- 📋 **Business Details** - View detailed information about businesses
- 🗺️ **Google Maps Integration** - View business locations on Google Maps

### For Business Owners
- 📝 **Business Registration** - Create an account and register your business
- 🔐 **User Authentication** - Secure login and profile management
- 💼 **Business Management** - Add, edit, and delete business profiles
- 📊 **Business Dashboard** - Manage all your business information from one place
- 🌟 **Business Promotion** - Gain visibility among local users

### General Features
- 🏠 **Home Page** - Featured businesses and categories
- 🔐 **Secure Authentication** - JWT-based user authentication
- 📱 **Mobile Responsive** - Optimized for all screen sizes
- ⚡ **Fast Performance** - Lightweight and efficient
- 🎨 **Modern Design** - Clean and intuitive user interface

## 🛠️ Tech Stack

### Frontend
- **HTML5** - Semantic markup
- **CSS3** - Responsive styling with modern features
- **JavaScript (Vanilla)** - Client-side logic and API integration
- **Responsive Design** - Mobile-first approach

### Backend
- **Node.js** - JavaScript runtime
- **Express.js** - Web framework and routing
- **JWT** - User authentication
- **bcryptjs** - Password hashing
- **CORS** - Cross-origin resource sharing

### Database
- **SQLite3** - Lightweight relational database
- **SQL** - Data queries and management

## 📂 Project Structure

```
business-discovery-app/
├── backend/
│   ├── server.js                 # Main server file
│   ├── database.js               # Database initialization and helpers
│   ├── seed.js                   # Sample data seeding
│   ├── package.json              # Backend dependencies
│   ├── .env                       # Environment configuration
│   └── routes/
│       ├── auth.js               # Authentication endpoints
│       └── businesses.js          # Business CRUD endpoints
├── frontend/
│   ├── index.html                # Home page
│   ├── search.html               # Search page
│   ├── business-details.html     # Business details page
│   ├── register.html             # Registration page
│   ├── login.html                # Login page
│   ├── dashboard.html            # Business dashboard
│   ├── css/
│   │   └── styles.css            # All styling
│   └── js/
│       ├── api.js                # API service layer
│       └── app.js                # Utility functions
└── README.md                      # This file
```

## 🚀 Installation & Setup

### Prerequisites
- **Node.js** (v12 or higher) - [Download](https://nodejs.org/)
- **npm** (comes with Node.js)
- **A modern web browser** (Chrome, Firefox, Edge, Safari)
- **A text editor or IDE** (VS Code recommended)

### Step 1: Installation

1. Clone or download the project:
```bash
cd c:\business\business-discovery-app
```

2. Install backend dependencies:
```bash
cd backend
npm install
```

3. Backend dependencies installed:
   - express - Web framework
   - sqlite3 - Database
   - bcryptjs - Password hashing
   - jsonwebtoken - JWT authentication
   - cors - Cross-origin requests
   - dotenv - Environment variables

### Step 2: Database Setup

Seed the database with sample data:
```bash
cd backend
node seed.js
```

This will:
- Create the database tables
- Add 5 sample business owners
- Add 5 sample businesses across different categories

**Sample Database Credentials:**
```
Email: john@coffee.com
Password: password123

Email: maria@italian.com
Password: password123

Email: tech@solutions.com
Password: password123

Email: spa@wellness.com
Password: password123

Email: fitness@city.com
Password: password123
```

## 🏃 Running the Application

### Starting the Backend Server

1. Navigate to the backend directory:
```bash
cd backend
```

2. Start the server:
```bash
npm start
```

Expected output:
```
🚀 Server running at http://localhost:5000
📱 Frontend available at http://localhost:5000
🔌 API endpoints: http://localhost:5000/api
```

The server will:
- Listen on port 5000
- Serve the frontend files
- Provide API endpoints at /api/*
- Create/connect to the SQLite database

### Accessing the Application

1. Open your browser
2. Navigate to: **http://localhost:5000**
3. The home page should load with featured businesses

## 🔌 API Endpoints

### Authentication Endpoints

#### Register a new user
```
POST /api/auth/register
Content-Type: application/json

{
  "name": "Business Name",
  "email": "user@email.com",
  "password": "password123"
}

Response: { token, user: { id, name, email } }
```

#### Login
```
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@email.com",
  "password": "password123"
}

Response: { token, user: { id, name, email } }
```

#### Get user profile (requires token)
```
GET /api/auth/profile
Authorization: Bearer <token>

Response: { id, name, email, created_at }
```

### Business Endpoints

#### Get all businesses
```
GET /api/businesses?limit=20&offset=0&category=Coffee%20Shop&search=coffee

Query Parameters:
- limit: Number of results (default: 20)
- offset: Pagination offset (default: 0)
- category: Filter by category
- search: Search term

Response: { 
  data: [businesses], 
  total: count,
  limit: number,
  offset: number
}
```

#### Get single business
```
GET /api/businesses/:id

Response: { id, name, category, description, address, ... }
```

#### Create business (requires authentication)
```
POST /api/businesses
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "Coffee Shop Name",
  "category": "Coffee Shop",
  "description": "Description of the business",
  "address": "123 Main St",
  "latitude": 40.7128,
  "longitude": -74.0060,
  "phone": "(555) 123-4567",
  "email": "business@email.com",
  "website": "https://example.com",
  "image_url": "https://example.com/image.jpg"
}

Response: { message, id, business }
```

#### Update business (requires authentication)
```
PUT /api/businesses/:id
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "Updated Name",
  "category": "Updated Category",
  ...other fields
}

Response: { message, business }
```

#### Delete business (requires authentication)
```
DELETE /api/businesses/:id
Authorization: Bearer <token>

Response: { message }
```

#### Get businesses by category
```
GET /api/businesses/category/:category

Response: { category, count, data: [businesses] }
```

#### Search by location
```
GET /api/businesses/search/location?latitude=40.7128&longitude=-74.0060&radius=10

Query Parameters:
- latitude: User latitude
- longitude: User longitude
- radius: Search radius in miles (default: 10)

Response: { location, count, data: [businesses] }
```

#### Get all categories
```
GET /api/businesses/categories

Response: { categories: [...] }
```

## 👥 Demo Credentials

Use these credentials to test the application:

| Email | Password | Business |
|-------|----------|----------|
| john@coffee.com | password123 | John's Premium Coffee |
| maria@italian.com | password123 | Maria's Authentic Italian Kitchen |
| tech@solutions.com | password123 | Tech Solutions Inc |
| spa@wellness.com | password123 | Green Wellness Spa & Yoga |
| fitness@city.com | password123 | City Fitness Center |

## 📖 Features & Usage

### Home Page
- View featured businesses at the top
- Browse categories
- Quick search functionality
- Learn about the platform with feature highlights

### Search Page
- Advanced search with filters
- Category filtering
- Pagination support
- Location-based search (requires location access)
- Responsive grid display

### Business Details
- View detailed business information
- Contact options (phone, email, website)
- Location details with Google Maps link
- Business metadata (creation date, updates)

### User Registration
- Create a new account
- Email validation
- Password confirmation
- Automatically logs in after registration

### User Login
- Secure JWT authentication
- Demo credentials available for testing
- Token-based session management
- 7-day token expiration

### Business Dashboard
- **Overview Tab**: Welcome message and business statistics
- **My Businesses Tab**: View all your registered businesses
- **Add Business Tab**: Form to register a new business
- Edit business information
- Delete businesses

## 🗄️ Database Schema

### Users Table
```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

### Businesses Table
```sql
CREATE TABLE businesses (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  description TEXT,
  address TEXT NOT NULL,
  latitude REAL,
  longitude REAL,
  phone TEXT,
  email TEXT,
  website TEXT,
  image_url TEXT,
  rating REAL DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### Reviews Table (For future expansion)
```sql
CREATE TABLE reviews (
  id INTEGER PRIMARY KEY,
  business_id INTEGER NOT NULL,
  rating INTEGER NOT NULL,
  comment TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (business_id) REFERENCES businesses(id)
);
```

## 📁 File Structure Details

### Backend Files

**server.js**
- Express application setup
- CORS and JSON middleware
- Route registration
- Error handling
- Server startup

**database.js**
- SQLite database connection
- Schema initialization
- Promise-based query helpers (dbAll, dbRun, dbGet)
- Table creation for users, businesses, and reviews

**seed.js**
- Sample data generation
- 5 business owner accounts
- 5 sample businesses across categories
- Password hashing
- Database population script

**routes/auth.js**
- POST /register - User registration
- POST /login - User authentication
- GET /profile - Get user profile
- JWT verification middleware
- Password hashing with bcryptjs

**routes/businesses.js**
- GET / - Get all businesses with filters
- GET /:id - Get single business
- POST / - Create business (protected)
- PUT /:id - Update business (protected)
- DELETE /:id - Delete business (protected)
- GET /category/:category - Filter by category
- GET /search/location - Location-based search

### Frontend Files

**index.html**
- Home/landing page
- Featured businesses section
- Categories grid
- Feature highlights
- Search bar

**search.html**
- Advanced search functionality
- Category and search filters
- Pagination
- Location-based search toggle
- Business listings in grid

**business-details.html**
- Detailed business information
- Contact details with links
- Location information
- Google Maps link
- Back navigation

**register.html**
- User registration form
- Email and password validation
- Password confirmation
- Error/success messages
- Link to login page

**login.html**
- User authentication form
- Demo credentials helper
- Error/success messages
- Link to registration
- Session token storage

**dashboard.html**
- Business owner dashboard
- Overview with statistics
- Business management
- Add new business form
- Edit/delete functionality
- Tab-based navigation

**css/styles.css**
- Modern responsive design
- Gradient color scheme (purple/blue)
- Mobile-first approach
- Flexbox and CSS Grid layouts
- Smooth transitions and hover effects
- 480px, 768px, and up breakpoints
- Dark navigation bar
- Card-based layouts

**js/api.js**
- API service layer
- Authentication methods
- Business CRUD operations
- Search functionality
- Centralized API calls

**js/app.js**
- Navigation updates
- Authentication helpers
- Utility functions
- Local storage management
- DOM manipulation helpers
- Geolocation handling

## 🐛 Troubleshooting

### Server won't start

**Error: "Port 5000 already in use"**
- Solution: Change PORT in .env file or kill the process using port 5000
```bash
# Windows PowerShell
Get-Process -Id (Get-NetTCPConnection -LocalPort 5000).OwningProcess | Stop-Process
```

**Error: "Cannot find module 'express'"**
- Solution: Install dependencies
```bash
cd backend
npm install
```

### Database issues

**Error: "Database file is locked"**
- Solution: Make sure you don't have database browsers open and restart the server

**Error: "Table already exists"**
- Solution: Delete business.db file and run seed.js again
```bash
# Windows PowerShell
Remove-Item backend\business.db
node backend/seed.js
```

### Frontend issues

**Page shows "Error loading businesses"**
- Solution: Make sure backend server is running on http://localhost:5000

**CORS error in console**
- Solution: Check if backend is allowing CORS (should be enabled in server.js)

**Login token not working**
- Solution: Clear browser cache and localStorage
```javascript
// In browser console
localStorage.clear()
location.reload()
```

### API Authentication issues

**Error: "Invalid token"**
- Solution: Log in again to get a fresh token
- Tokens expire after 7 days

**Error: "No token provided"**
- Solution: Make sure you're logged in before accessing dashboard
- Check if token is stored in localStorage

## 🔒 Security Notes

⚠️ **IMPORTANT**: This is a demo application. For production:

1. **Change JWT Secret**: Update `JWT_SECRET` in backend/.env
2. **Use HTTPS**: Deploy with SSL/TLS certificates
3. **Environment Variables**: Never commit .env files with real secrets
4. **Password Hashing**: Currently using bcryptjs (bcrypt is preferred for production)
5. **Input Validation**: Implement comprehensive validation on both frontend and backend
6. **Rate Limiting**: Add rate limiting to prevent abuse
7. **Database**: Consider using PostgreSQL instead of SQLite for production
8. **CORS**: Configure CORS to allow only specific domains
9. **Error Handling**: Don't expose internal errors to users
10. **Data Encryption**: Encrypt sensitive data at rest

## 📝 Sample Businesses

The application comes with 5 pre-seeded sample businesses:

1. **John's Premium Coffee** - Coffee Shop in Downtown
2. **Maria's Authentic Italian Kitchen** - Restaurant in Little Italy
3. **Tech Solutions Inc** - IT Services in Innovation District
4. **Green Wellness Spa & Yoga** - Health & Wellness in Wellness District
5. **City Fitness Center** - Gym in Sports Complex

## 🎯 Future Enhancements

Potential features for future development:

- [ ] User reviews and ratings system
- [ ] Business photos gallery
- [ ] Working hours and special hours
- [ ] Social media integration
- [ ] Business analytics and insights
- [ ] SMS and email notifications
- [ ] Advanced search filters (price range, hours, etc.)
- [ ] Favorite/save businesses
- [ ] Business recommendations
- [ ] Admin panel for moderation
- [ ] Mobile app (React Native/Flutter)
- [ ] Real Google Maps API integration
- [ ] Payment integration for premium listings
- [ ] Chat/messaging between users and businesses
- [ ] Business hours calendar
- [ ] Reservation/booking system
- [ ] Multi-language support

## 📞 Support

For issues or questions:
1. Check the Troubleshooting section above
2. Review the API endpoints documentation
3. Check browser console for errors
4. Ensure all prerequisites are installed

## 📄 License

This project is provided as-is for educational purposes.

## 🙏 Acknowledgments

- Built with modern best practices
- Responsive design for all devices
- Clean, maintainable code with comments
- Educational project structure

---

**Enjoy discovering and promoting local businesses! 🎉**

Last Updated: February 2026
