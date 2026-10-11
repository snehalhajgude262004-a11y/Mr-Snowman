<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
if(session.getAttribute("admin")==null){
    response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management | Mr.snowman</title>
    
    <!-- Bootstrap 5.3.3 Core -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <!-- Unified Premium Typography -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,600;0,700;1,400&display=swap" rel="stylesheet">
    
    <!-- Central Admin Workspace Stylesheet -->
    <link rel="stylesheet" href="../css/admin.css">

    <!-- COMPLETE CAFE & BERRY BRAND INTEGRATION THEME -->
    <style>
        /* Base Deep Espresso Background */
        body.admin-body {
            background: radial-gradient(circle at 50% 30%, #1c1816 0%, #0a0808 100%) !important;
            color: #f5f5f4 !important;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }

        .admin-main {
            background: transparent;
            padding: 40px;
        }

        /* Typography Fixes */
        h1 {
            font-family: 'Playfair Display', serif !important;
            color: #ffffff !important;
            font-weight: 700;
            font-size: 2.25rem;
        }

        h2 {
            font-family: 'Playfair Display', serif !important;
            color: #ffffff !important;
            font-weight: 600;
        }

        .admin-kicker {
            color: #d4af37 !important; /* Artisan Gold */
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 2px;
            font-weight: 600;
        }

        /* Frosted Luxury Glass Container Panel */
        .admin-panel {
            background: rgba(36, 30, 27, 0.75) !important;
            backdrop-filter: blur(20px) !important;
            -webkit-backdrop-filter: blur(20px) !important;
            border: 1px solid rgba(212, 175, 55, 0.18) !important;
            border-radius: 24px !important;
            padding: 32px;
            box-shadow: 0 24px 50px rgba(0, 0, 0, 0.45) !important;
            margin-top: 20px;
        }

        /* Premium Gold Count Badge */
        #userCountLabel {
            font-family: 'Poppins', sans-serif;
            font-size: 0.75rem;
            font-weight: 600;
            background: linear-gradient(135deg, #c5a028 0%, #a38118 100%) !important;
            color: #1c1917 !important;
            padding: 6px 16px;
            border-radius: 999px;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(212, 175, 55, 0.2);
            text-transform: uppercase;
            border: none;
        }

        /* Transparent Table Styling & Grid Lines */
        .admin-table {
            background: transparent !important;
            width: 100%;
        }

        .admin-table th {
            font-family: 'Poppins', sans-serif;
            font-size: 0.75rem !important;
            letter-spacing: 1.5px !important;
            font-weight: 600 !important;
            color: #d4af37 !important; /* Artisan Gold Titles */
            text-transform: uppercase;
            border-bottom: 2px solid rgba(212, 175, 55, 0.2) !important;
            padding: 20px 16px !important;
            background: transparent !important;
        }

        .admin-table td {
            font-size: 0.92rem;
            color: #e7e5e4 !important;
            padding: 20px 16px !important;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05) !important;
            background: transparent !important;
        }

        /* Sleek Row Highlight Animations */
        .admin-table tbody tr {
            transition: all 0.2s ease;
            background: transparent !important;
        }
        
        .admin-table tbody tr:hover {
            background-color: rgba(212, 175, 55, 0.04) !important;
        }

        /* Empty Fallback State Configuration */
        .text-muted-custom {
            color: #c7c1bd !important;
        }
    </style>
</head>

<body class="admin-body">

    <!-- SIDEBAR ARCHITECTURE -->
    <aside class="admin-sidebar">
        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="admin-brand sidebar-brand">
            <img src="../assets/logo.jpeg" alt="The Berry.Co logo">
            <span>Mr.Snowman</span>
        </a>

        <nav class="admin-nav">
            <a href="${pageContext.request.contextPath}/admin/dashboard.jsp">
                <i class="bi bi-grid-1x2"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/admin/foods.jsp">
                <i class="bi bi-cup-hot"></i> Food Management
            </a>
            <!-- Perfect Active Highlight Match -->
            <a href="${pageContext.request.contextPath}/admin/users.jsp" class="active">
                <i class="bi bi-people"></i> User Management
            </a>
            <a href="${pageContext.request.contextPath}/admin/orders.jsp">
                <i class="bi bi-receipt"></i> Order Management
            </a>
            
            <!-- Secure Form POST Logout Pipeline -->
            <form action="${pageContext.request.contextPath}/admin/logout" method="post" class="m-0 mt-auto">
                <button type="submit" id="adminLogout">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </button>
            </form>
        </nav>
    </aside>

    <!-- CONTENT DISPLAY HUD -->
    <main class="admin-main">
        <header class="admin-topbar">
            <div>
                <span class="admin-kicker">Patron Base</span>
                <h1 class="mt-1">User Management</h1>
            </div>
        </header>

        <!-- DATA CONTAINER PANEL -->
        <section class="admin-panel">
            <div class="panel-heading d-flex justify-content-between align-items-center mb-4">
                <h2 class="m-0 h4">Registered Patrons</h2>
                <!-- DOM Hook Preserved: id="userCountLabel" -->
                <span id="userCountLabel">0 users</span>
            </div>

            <!-- RESPONSIVE TABLE LAYER -->
            <div class="table-responsive">
                <table class="table admin-table align-middle m-0">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email Address</th>
                            <th>Mobile</th>
                            <th>Delivery Address</th>
                            <th>Joined Date</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <!-- DOM Hook Preserved: id="userTableBody" -->
                    <tbody id="userTableBody">
                        <!-- Target container for dynamic row objects compiled inside admin.js -->
                    </tbody>
                </table>
            </div>

            <!-- EMPTY RESULTS LOOKUP FALLBACK -->
            <!-- DOM Hook Preserved: id="emptyUsers" -->
            <div id="emptyUsers" class="admin-empty d-none text-center py-5">
                <i class="bi bi-people-mute text-muted display-4 d-block mb-3 opacity-30" style="color: #d4af37 !important;"></i>
                <span class="text-muted-custom d-block fw-medium">No customer profiles found.</span>
            </div>
        </section>
    </main>

    <!-- UI Bootstrap Engine -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Live Data Mappings Script Router -->
    <script src="../js/admin.js"></script>
</body>
</html>