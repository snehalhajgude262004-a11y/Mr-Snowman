<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

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
    <title>Order Management | Mr.Snowman</title>

    <!-- Bootstrap 5.3.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Google Fonts: Playfair Display added for consistent cafe branding -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,600;0,700;1,400&display=swap" rel="stylesheet">

    <!-- Custom admin styles pipeline -->
    <link rel="stylesheet" href="../css/admin.css?v=7">

    <style>
        /* Modern Atmosphere Cafe Adjustments */
        body.admin-body {
            background: radial-gradient(circle at center, #1c1816 0%, #0a0808 100%) !important;
            color: #f5f5f4 !important;
        }

        .admin-main {
            background: transparent;
        }

        h1, h2 {
            font-family: 'Playfair Display', serif !important;
            color: #ffffff !important;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .text-muted-custom {
            color: #c7c1bd !important; /* Brighter high-contrast text for dark backgrounds */
        }

        /* Frosted Glass Luxury Panels */
        .admin-panel {
            background: rgba(36, 30, 27, 0.75) !important;
            backdrop-filter: blur(20px) !important;
            -webkit-backdrop-filter: blur(20px) !important;
            border: 1px solid rgba(212, 175, 55, 0.18) !important;
            border-radius: 24px !important;
            padding: 32px;
            box-shadow: 0 24px 50px rgba(0, 0, 0, 0.45) !important;
        }

        /* Gold Badge indicator matching Dashboard metrics */
        #adminOrderCountLabel {
            font-family: 'Poppins', sans-serif;
            font-size: 0.75rem;
            font-weight: 600;
            background: linear-gradient(135deg, #c5a028 0%, #a38118 100%);
            color: #1c1917 !important;
            padding: 6px 16px;
            border-radius: 999px;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(212, 175, 55, 0.2);
            text-transform: uppercase;
        }

        /* Styling helper adjustments for your dynamic order list elements */
        .admin-orders-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        /* Ensures any dynamic items rendered internally align beautifully with the cafe aesthetic */
        .order-card, .admin-order-item { 
            background: rgba(255, 255, 255, 0.03) !important;
            border: 1px solid rgba(255, 255, 255, 0.06) !important;
            border-radius: 16px;
            padding: 24px;
            transition: all 0.25s ease;
        }
        
        .order-card:hover, .admin-order-item:hover {
            border-color: rgba(212, 175, 55, 0.3) !important;
            background: rgba(255, 255, 255, 0.05) !important;
        }
    </style>
</head>

<body class="admin-body">

<!-- SIDEBAR -->
<aside class="admin-sidebar">

    <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="admin-brand sidebar-brand">
        <img src="../assets/logo.jpeg" alt="The Berry.Co logo">
        <span>Mr.Snowman</span>
    </a>

    <nav class="admin-nav">
        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp">
            <i class="bi bi-grid-1x2"></i>
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/admin/foods.jsp">
            <i class="bi bi-cup-hot"></i>
            Food Management
        </a>

        <a href="${pageContext.request.contextPath}/admin/users.jsp">
            <i class="bi bi-people"></i>
            User Management
        </a>

        <!-- Highlighted Active Link for Orders -->
        <a href="${pageContext.request.contextPath}/admin/orders.jsp" class="active">
            <i class="bi bi-receipt"></i>
            Order Management
        </a>

        <button type="button" id="adminLogout">
            <i class="bi bi-box-arrow-right"></i>
            Logout
        </button>
    </nav>

</aside>


<!-- MAIN MANAGEMENT HUB -->
<main class="admin-main">

    <header class="admin-topbar">
        <div>
            <span class="admin-kicker">Live Stream</span>
            <h1 class="mt-1">Order Management</h1>
        </div>
    </header>

    <!-- CONTAINER PANEL -->
    <section class="admin-panel shadow-sm">

        <div class="panel-heading mb-4">
            <h2 class="m-0 h4" style="letter-spacing: -0.5px; font-weight:600;">Customer Orders</h2>
            <!-- Functionality preserved: id="adminOrderCountLabel" -->
            <span id="adminOrderCountLabel">0 orders</span>
        </div>

        <!-- ORDER LIST PIPELINE -->
        <!-- Functionality preserved: id="adminOrdersList" -->
        <div id="adminOrdersList" class="admin-orders-list">
            <!-- Order tracking structures are injected here dynamically via admin.js -->
        </div>

        <!-- EMPTY STATE SCREEN -->
        <!-- Functionality preserved: id="emptyAdminOrders" -->
        <div id="emptyAdminOrders" class="admin-empty d-none text-center py-5">
            <i class="bi bi-receipt-cutoff text-muted display-4 d-block mb-3 opacity-30" style="color: #d4af37 !important;"></i>
            <span class="text-muted-custom d-block fw-medium">No active orders found in the live loop.</span>
            <small class="text-secondary d-block mt-1">Place an order from checkout to see it appear here live.</small>
        </div>

    </section>

</main>

<!-- Bootstrap JS Pipeline -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core script containing data bindings -->
<script src="../js/admin.js"></script>

</body>
</html>