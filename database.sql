<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Digital Help Desk</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            color: #333;
        }
        
        .header {
            background: linear-gradient(135deg, #4CAF50 0%, #2E7D32 100%);
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .header h1 {
            font-size: 1.8rem;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .logout-btn {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .logout-btn:hover {
            background: rgba(255, 255, 255, 0.3);
        }
        
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 20px;
        }
        
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            text-align: center;
            transition: transform 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card i {
            font-size: 2.5rem;
            color: #4CAF50;
            margin-bottom: 15px;
        }
        
        .card h3 {
            margin-bottom: 10px;
            color: #2E7D32;
        }
        
        .card .number {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
        }
        
        .data-section {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }
        
        .data-section h2 {
            color: #2E7D32;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            background-color: #f8f9fa;
            color: #2E7D32;
            font-weight: 600;
        }
        
        tr:hover {
            background-color: #f5f5f5;
        }
        
        .action-btn {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }
        
        .action-btn.delete {
            background: #f44336;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }
        
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        
        .add-btn {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
        }
        
        .tabs {
            display: flex;
            margin-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .tab {
            padding: 10px 20px;
            cursor: pointer;
            border-bottom: 3px solid transparent;
        }
        
        .tab.active {
            border-bottom: 3px solid #4CAF50;
            color: #4CAF50;
            font-weight: 600;
        }
        
        .tab-content {
            display: none;
        }
        
        .tab-content.active {
            display: block;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1><i class="fas fa-tachometer-alt"></i> Admin Dashboard</h1>
        <div class="user-info">
            <span>Welcome, <span id="currentUser">Admin</span></span>
            <button class="logout-btn" id="logoutBtn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </div>
    </div>
    
    <div class="container">
        <div class="dashboard-cards">
            <div class="card">
                <i class="fas fa-users"></i>
                <h3>Total Volunteers</h3>
                <div class="number" id="volunteerCount">0</div>
            </div>
            <div class="card">
                <i class="fas fa-hand-holding-heart"></i>
                <h3>Help Sessions Today</h3>
                <div class="number" id="sessionsToday">0</div>
            </div>
            <div class="card">
                <i class="fas fa-calendar-check"></i>
                <h3>Scheduled Appointments</h3>
                <div class="number" id="appointmentsCount">0</div>
            </div>
            <div class="card">
                <i class="fas fa-file-alt"></i>
                <h3>Forms Processed</h3>
                <div class="number" id="formsCount">0</div>
            </div>
        </div>
        
        <div class="tabs">
            <div class="tab active" data-tab="users">User Management</div>
            <div class="tab" data-tab="sessions">Help Sessions</div>
            <div class="tab" data-tab="appointments">Appointments</div>
            <div class="tab" data-tab="forms">Form Submissions</div>
        </div>
        
        <div class="tab-content active" id="users-tab">
            <div class="data-section">
                <h2><i class="fas fa-users"></i> Volunteer Management</h2>
                <button class="add-btn" id="addVolunteerBtn"><i class="fas fa-plus"></i> Add New Volunteer</button>
                
                <table id="volunteersTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Specialization</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Volunteer data will be populated by JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="tab-content" id="sessions-tab">
            <div class="data-section">
                <h2><i class="fas fa-hand-holding-heart"></i> Help Session Log</h2>
                
                <table id="sessionsTable">
                    <thead>
                        <tr>
                            <th>Session ID</th>
                            <th>Date</th>
                            <th>Volunteer</th>
                            <th>Senior Name</th>
                            <th>Service Type</th>
                            <th>Duration</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Session data will be populated by JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="tab-content" id="appointments-tab">
            <div class="data-section">
                <h2><i class="fas fa-calendar-check"></i> Scheduled Appointments</h2>
                
                <table id="appointmentsTable">
                    <thead>
                        <tr>
                            <th>Appointment ID</th>
                            <th>Date & Time</th>
                            <th>Senior Name</th>
                            <th>Contact</th>
                            <th>Service Needed</th>
                            <th>Assigned To</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Appointment data will be populated by JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="tab-content" id="forms-tab">
            <div class="data-section">
                <h2><i class="fas fa-file-alt"></i> Form Submissions</h2>
                
                <table id="formsTable">
                    <thead>
                        <tr>
                            <th>Form ID</th>
                            <th>Submission Date</th>
                            <th>Senior Name</th>
                            <th>Form Type</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Form data will be populated by JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal for adding new volunteer -->
    <div id="volunteerModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); justify-content: center; align-items: center;">
        <div style="background: white; padding: 30px; border-radius: 10px; width: 90%; max-width: 500px;">
            <h2 style="margin-bottom: 20px;">Add New Volunteer</h2>
            <form id="volunteerForm">
                <div class="form-group">
                    <label for="volunteerName">Full Name</label>
                    <input type="text" id="volunteerName" required>
                </div>
                <div class="form-group">
                    <label for="volunteerEmail">Email</label>
                    <input type="email" id="volunteerEmail" required>
                </div>
                <div class="form-group">
                    <label for="volunteerPhone">Phone</label>
                    <input type="tel" id="volunteerPhone" required>
                </div>
                <div class="form-group">
                    <label for="volunteerSpecialization">Specialization</label>
                    <select id="volunteerSpecialization" required>
                        <option value="">Select Specialization</option>
                        <option value="Smartphone Help">Smartphone Help</option>
                        <option value="Online Forms">Online Forms</option>
                        <option value="Digital Banking">Digital Banking</option>
                        <option value="Telemedicine">Telemedicine</option>
                        <option value="General Support">General Support</option>
                    </select>
                </div>
                <div style="display: flex; gap: 10px; margin-top: 20px;">
                    <button type="submit" class="add-btn">Add Volunteer</button>
                    <button type="button" id="cancelVolunteerBtn" style="background: #f44336; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Check if user is logged in
        if (!sessionStorage.getItem('isLoggedIn')) {
            window.location.href = 'login.html';
        }
        
        // Set current user
        document.getElementById('currentUser').textContent = sessionStorage.getItem('currentUser') || 'Admin';
        
        // Logout functionality
        document.getElementById('logoutBtn').addEventListener('click', function() {
            sessionStorage.removeItem('isLoggedIn');
            sessionStorage.removeItem('currentUser');
            window.location.href = 'login.html';
        });
        
        // Tab functionality
        document.querySelectorAll('.tab').forEach(tab => {
            tab.addEventListener('click', function() {
                // Remove active class from all tabs
                document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
                // Add active class to clicked tab
                this.classList.add('active');
                
                // Hide all tab content
                document.querySelectorAll('.tab-content').forEach(content => {
                    content.classList.remove('active');
                });
                
                // Show the corresponding tab content
                const tabId = this.getAttribute('data-tab');
                document.getElementById(`${tabId}-tab`).classList.add('active');
            });
        });
        
        // Initialize sample data (in a real app, this would come from a database)
        function initializeSampleData() {
            // Volunteers data
            if (!localStorage.getItem('volunteers')) {
                const sampleVolunteers = [
                    { id: 1, name: "Sarah Johnson", email: "sarah@example.com", phone: "(555) 123-4567", specialization: "Smartphone Help" },
                    { id: 2, name: "Michael Chen", email: "michael@example.com", phone: "(555) 234-5678", specialization: "Online Forms" },
                    { id: 3, name: "Emily Rodriguez", email: "emily@example.com", phone: "(555) 345-6789", specialization: "Digital Banking" },
                    { id: 4, name: "David Wilson", email: "david@example.com", phone: "(555) 456-7890", specialization: "Telemedicine" }
                ];
                localStorage.setItem('volunteers', JSON.stringify(sampleVolunteers));
            }
            
            // Help sessions data
            if (!localStorage.getItem('helpSessions')) {
                const sampleSessions = [
                    { id: 1, date: "2023-10-15", volunteer: "Sarah Johnson", senior: "Robert Smith", service: "Smartphone Help", duration: "45 min", status: "Completed" },
                    { id: 2, date: "2023-10-16", volunteer: "Michael Chen", senior: "Margaret Brown", service: "Online Forms", duration: "60 min", status: "Completed" },
                    { id: 3, date: "2023-10-17", volunteer: "Emily Rodriguez", senior: "James Wilson", service: "Digital Banking", duration: "30 min", status: "Scheduled" }
                ];
                localStorage.setItem('helpSessions', JSON.stringify(sampleSessions));
            }
            
            // Appointments data
            if (!localStorage.getItem('appointments')) {
                const sampleAppointments = [
                    { id: 1, datetime: "2023-10-18 10:00", senior: "Linda Davis", contact: "(555) 567-8901", service: "Telemedicine", assigned: "David Wilson", status: "Scheduled" },
                    { id: 2, datetime: "2023-10-19 14:30", senior: "Thomas Miller", contact: "(555) 678-9012", service: "Online Forms", assigned: "Michael Chen", status: "Scheduled" }
                ];
                localStorage.setItem('appointments', JSON.stringify(sampleAppointments));
            }
            
            // Form submissions data
            if (!localStorage.getItem('formSubmissions')) {
                const sampleForms = [
                    { id: 1, date: "2023-10-10", senior: "Patricia Taylor", type: "Government Form", status: "Processed" },
                    { id: 2, date: "2023-10-12", senior: "Richard Anderson", type: "Medical Form", status: "In Progress" },
                    { id: 3, date: "2023-10-14", senior: "Jennifer Martinez", type: "Financial Form", status: "Pending" }
                ];
                localStorage.setItem('formSubmissions', JSON.stringify(sampleForms));
            }
        }
        
        // Load and display data
        function loadDashboardData() {
            initializeSampleData();
            
            // Load volunteers
            const volunteers = JSON.parse(localStorage.getItem('volunteers') || '[]');
            document.getElementById('volunteerCount').textContent = volunteers.length;
            
            const volunteersTable = document.getElementById('volunteersTable').getElementsByTagName('tbody')[0];
            volunteersTable.innerHTML = '';
            
            volunteers.forEach(volunteer => {
                const row = volunteersTable.insertRow();
                row.innerHTML = `
                    <td>${volunteer.id}</td>
                    <td>${volunteer.name}</td>
                    <td>${volunteer.email}</td>
                    <td>${volunteer.phone}</td>
                    <td>${volunteer.specialization}</td>
                    <td>
                        <button class="action-btn">Edit</button>
                        <button class="action-btn delete">Delete</button>
                    </td>
                `;
            });
            
            // Load help sessions
            const sessions = JSON.parse(localStorage.getItem('helpSessions') || '[]');
            document.getElementById('sessionsToday').textContent = sessions.filter(s => s.date === new Date().toISOString().split('T')[0]).length;
            
            const sessionsTable = document.getElementById('sessionsTable').getElementsByTagName('tbody')[0];
            sessionsTable.innerHTML = '';
            
            sessions.forEach(session => {
                const row = sessionsTable.insertRow();
                row.innerHTML = `
                    <td>${session.id}</td>
                    <td>${session.date}</td>
                    <td>${session.volunteer}</td>
                    <td>${session.senior}</td>
                    <td>${session.service}</td>
                    <td>${session.duration}</td>
                    <td>${session.status}</td>
                `;
            });
            
            // Load appointments
            const appointments = JSON.parse(localStorage.getItem('appointments') || '[]');
            document.getElementById('appointmentsCount').textContent = appointments.length;
            
            const appointmentsTable = document.getElementById('appointmentsTable').getElementsByTagName('tbody')[0];
            appointmentsTable.innerHTML = '';
            
            appointments.forEach(appointment => {
                const row = appointmentsTable.insertRow();
                row.innerHTML = `
                    <td>${appointment.id}</td>
                    <td>${appointment.datetime}</td>
                    <td>${appointment.senior}</td>
                    <td>${appointment.contact}</td>
                    <td>${appointment.service}</td>
                    <td>${appointment.assigned}</td>
                    <td>${appointment.status}</td>
                `;
            });
            
            // Load form submissions
            const forms = JSON.parse(localStorage.getItem('formSubmissions') || '[]');
            document.getElementById('formsCount').textContent = forms.length;
            
            const formsTable = document.getElementById('formsTable').getElementsByTagName('tbody')[0];
            formsTable.innerHTML = '';
            
            forms.forEach(form => {
                const row = formsTable.insertRow();
                row.innerHTML = `
                    <td>${form.id}</td>
                    <td>${form.date}</td>
                    <td>${form.senior}</td>
                    <td>${form.type}</td>
                    <td>${form.status}</td>
                    <td>
                        <button class="action-btn">View</button>
                        <button class="action-btn">Update</button>
                    </td>
                `;
            });
        }
        
        // Volunteer modal functionality
        document.getElementById('addVolunteerBtn').addEventListener('click', function() {
            document.getElementById('volunteerModal').style.display = 'flex';
        });
        
        document.getElementById('cancelVolunteerBtn').addEventListener('click', function() {
            document.getElementById('volunteerModal').style.display = 'none';
            document.getElementById('volunteerForm').reset();
        });
        
        document.getElementById('volunteerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const name = document.getElementById('volunteerName').value;
            const email = document.getElementById('volunteerEmail').value;
            const phone = document.getElementById('volunteerPhone').value;
            const specialization = document.getElementById('volunteerSpecialization').value;
            
            // Get existing volunteers
            const volunteers = JSON.parse(localStorage.getItem('volunteers') || '[]');
            
            // Create new volunteer
            const newVolunteer = {
                id: volunteers.length > 0 ? Math.max(...volunteers.map(v => v.id)) + 1 : 1,
                name: name,
                email: email,
                phone: phone,
                specialization: specialization
            };
            
            // Add to volunteers array
            volunteers.push(newVolunteer);
            
            // Save to localStorage
            localStorage.setItem('volunteers', JSON.stringify(volunteers));
            
            // Close modal and reset form
            document.getElementById('volunteerModal').style.display = 'none';
            document.getElementById('volunteerForm').reset();
            
            // Reload data
            loadDashboardData();
            
            alert('Volunteer added successfully!');
        });
        
        // Load data when page loads
        window.addEventListener('load', loadDashboardData);
    </script>
</body>
</html>