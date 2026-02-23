# Quick Testing Guide

## 🚀 Starting the Application

### Windows Users
Simply double-click: `START.bat`

### Mac/Linux Users
Run: `bash START.sh` or `chmod +x START.sh && ./START.sh`

### Manual Start
```bash
cd backend
npm start
# or
node server.js
```

You should see:
```
🚀 Server running at http://localhost:5000
📱 Frontend available at http://localhost:5000
🔌 API endpoints: http://localhost:5000/api
```

## 🧪 Testing the Application

### Step 1: Open the Application
- Open your browser
- Go to: http://localhost:5000
- You should see the home page with featured businesses

### Step 2: Test Home Page
✓ Featured businesses display
✓ Categories section shows
✓ Features section visible
✓ Search bar functional
✓ Navigation links work

### Step 3: Test Search Page
1. Click "Search Businesses" in navigation
2. Try these searches:
   - Search: "coffee"
   - Category: "Coffee Shop"
   - Category: "Restaurant"
3. Test pagination with "Next" and "Previous"

### Step 4: Test Business Details
1. Click on any business card
2. View should show:
   ✓ Business image
   ✓ Business name and category
   ✓ Full description
   ✓ Contact information
   ✓ Address and location
   ✓ Links to website and Google Maps

### Step 5: Test User Registration
1. Click "Register" in navigation
2. Fill in the form:
   - Name: "Test Business"
   - Email: "test@business.com"
   - Password: "password123"
   - Confirm: "password123"
3. Click "Create Account"
4. Should redirect to dashboard

### Step 6: Test User Login
1. Click "Logout" to logout first
2. Click "Login" in navigation
3. Use demo credentials:
   - Email: john@coffee.com
   - Password: password123
4. Should redirect to dashboard

### Step 7: Test Dashboard
1. View the Overview tab with statistics
2. Click "My Businesses" tab - see all businesses
3. Click "Add New Business" tab - try the form:
   - Fill all required fields
   - Click "Add Business"
   - Should show success message

### Step 8: Test Location-Based Search
1. Go to Search page
2. Click "📍 Use My Location" button
3. Allow location access in browser
4. Should show businesses near your location

## 🔌 API Testing with Browser Console

Open browser DevTools (F12) and test API calls:

### Test 1: Get All Businesses
```javascript
fetch('http://localhost:5000/api/businesses?limit=5')
  .then(r => r.json())
  .then(d => console.log(d))
```

### Test 2: Get Single Business
```javascript
fetch('http://localhost:5000/api/businesses/1')
  .then(r => r.json())
  .then(d => console.log(d))
```

### Test 3: Check Server Health
```javascript
fetch('http://localhost:5000/api/health')
  .then(r => r.json())
  .then(d => console.log(d))
```

### Test 4: Get Categories
```javascript
fetch('http://localhost:5000/api/businesses/categories')
  .then(r => r.json())
  .then(d => console.log(d))
```

## 📊 Sample Data Verification

The database should contain:

### 5 User Accounts:
- john@coffee.com (Password: password123)
- maria@italian.com (Password: password123)
- tech@solutions.com (Password: password123)
- spa@wellness.com (Password: password123)
- fitness@city.com (Password: password123)

### 5 Businesses:
1. John's Premium Coffee (Coffee Shop)
2. Maria's Authentic Italian Kitchen (Restaurant)
3. Tech Solutions Inc (IT Services)
4. Green Wellness Spa & Yoga (Health & Wellness)
5. City Fitness Center (Gym)

## ✅ Feature Checklist

### Frontend Features
- [ ] Home page loads with featured businesses
- [ ] Navigation bar works and updates based on login status
- [ ] Search page with filters works
- [ ] Business details page displays correctly
- [ ] Registration form validates and creates account
- [ ] Login form authenticates users
- [ ] Dashboard shows user businesses
- [ ] Dashboard can add/edit/delete businesses
- [ ] Location-based search works
- [ ] Responsive design on mobile (resize browser)
- [ ] All links navigate correctly

### Backend Features
- [ ] Server starts without errors
- [ ] Database connects successfully
- [ ] GET /api/businesses returns businesses
- [ ] GET /api/businesses/:id returns single business
- [ ] POST /api/auth/register creates new user
- [ ] POST /api/auth/login returns token
- [ ] POST /api/businesses creates business (with auth)
- [ ] PUT /api/businesses/:id updates business (with auth)
- [ ] DELETE /api/businesses/:id deletes business (with auth)
- [ ] GET /api/businesses/category/:cat filters by category
- [ ] GET /api/businesses/search/location searches by location

## 🐛 Common Issues & Solutions

### Server won't start
```bash
# Check if port 5000 is in use
netstat -ano | findstr :5000

# Kill the process
taskkill /PID <PID> /F

# Try manually deleting business.db and seeding again
rm backend/business.db
node backend/seed.js
```

### Page shows "Cannot reach server"
- Make sure backend is running: `node server.js`
- Check if port 5000 is available
- Check browser console for CORS errors

### Login not working
- Check console for errors
- Make sure you're using correct demo credentials
- Try logging out and clearing browser storage
- In console: `localStorage.clear()`

### Search not returning results
- Make sure database was seeded: `node backend/seed.js`
- Check browser console for API errors
- Verify business names in search match database

## 🎉 Congratulations!

If all tests pass, your Local Business Discovery Web Application is fully functional!

## 📝 Notes

- Default Demo User: john@coffee.com / password123
- Backend runs on: http://localhost:5000
- Frontend served from: /index.html
- API prefix: /api/
- Database: SQLite (business.db)
- JWT Token expires after: 7 days

---

For detailed API documentation, see README.md
