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
    <title>Admin Dashboard | Mr.Snowman</title>

    <!-- Bootstrap 5.3.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2 family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,600;0,700;1,400&display=swap" rel="stylesheet">

    <!-- Chart.js CDN for the analytical graph -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Custom admin styles pipeline -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css?v=6">

    <style>
        /* Modern Atmosphere Cafe Background Architecture */
        body.admin-body {
            background: radial-gradient(circle at center, #1c1816 0%, #0a0808 100%) !important;
            color: #f5f5f4 !important;
        }

        .admin-main {
            background: transparent;
        }

        /* Enhanced High-Contrast Typography */
        h1, h4, .stat-value {
            font-family: 'Playfair Display', serif !important;
            color: #ffffff !important;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .text-muted-custom {
            color: #c7c1bd !important; /* Brighter, high-contrast text for high readability over dark background */
        }

        /* Frosted Glass Luxury Panels */
        .admin-stat-card, .admin-panel-card {
            background: rgba(36, 30, 27, 0.75) !important;
            backdrop-filter: blur(20px) !important;
            -webkit-backdrop-filter: blur(20px) !important;
            border: 1px solid rgba(212, 175, 55, 0.18) !important;
            border-radius: 20px !important;
            padding: 24px;
            box-shadow: 0 24px 50px rgba(0, 0, 0, 0.45) !important;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .admin-stat-card:hover {
            transform: translateY(-5px);
            border-color: rgba(212, 175, 55, 0.4) !important;
            box-shadow: 0 30px 60px rgba(212, 175, 55, 0.08) !important;
        }

        /* Gold Branding Accent Elements */
        .stat-icon-box {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            background: linear-gradient(135deg, rgba(212, 175, 55, 0.15) 0%, rgba(212, 175, 55, 0.05) 100%);
            color: #d4af37;
            border: 1px solid rgba(212, 175, 55, 0.25);
        }

        .stat-title {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: #e2ddd9 !important; /* Clearly readable title strings */
            font-weight: 600;
        }

        .stat-value {
            letter-spacing: -0.5px;
        }

        /* Live Pulse Dot */
        .live-dot {
            width: 8px;
            height: 8px;
            background-color: #10b981;
            border-radius: 50%;
            display: inline-block;
            box-shadow: 0 0 12px #10b981;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.7); }
            70% { transform: scale(1); box-shadow: 0 0 0 8px rgba(16, 185, 129, 0); }
            100% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(16, 185, 129, 0); }
        }

        /* Chart Canvas Layout Styling */
        .chart-container {
            position: relative;
            width: 100%;
            height: 320px;
        }
    </style>
</head>

<body class="admin-body">

<!-- SIDEBAR -->
<aside class="admin-sidebar">
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="admin-brand sidebar-brand">
        <img src="${pageContext.request.contextPath}/assets/logo.jpeg" alt="The Berry.Co logo">
        <span>Mr.Snowman</span>
    </a>

    <nav class="admin-nav">
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="active">
            <i class="bi bi-grid-1x2"></i>
            Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/admin/users.jsp">
            <i class="bi bi-people"></i>
            User Management
        </a>
        <a href="${pageContext.request.contextPath}/admin/orders.jsp">
            <i class="bi bi-receipt"></i>
            Order Management
        </a>
        <a href="${pageContext.request.contextPath}/admin/foods.jsp">
            <i class="bi bi-cup-hot"></i>
            Food Management
        </a>
        <a href="${pageContext.request.contextPath}/logout">
            <i class="bi bi-box-arrow-right"></i>
            Logout
        </a>
    </nav>
</aside>


<!-- MAIN VIEW PORTAL -->
<main class="admin-main">
    <div class="container-fluid px-0">

        <!-- DASHBOARD HEADER -->
        <header class="admin-topbar">
            <div>
                <span class="admin-kicker">Operational Center</span>
                <h1 class="mt-1">Dashboard Overview</h1>
                <p class="text-muted-custom small mb-0 mt-1 d-flex align-items-center gap-2">
                    <span class="live-dot"></span> <span class="fw-medium">Core System Status: Active & Operational</span>
                </p>
            </div>

            <a class="btn btn-outline-light px-4 d-inline-flex align-items-center gap-2" 
               style="border-radius: 12px; border-color: rgba(255,255,255,0.25); font-weight: 500;"
               href="${pageContext.request.contextPath}/index.jsp" target="_blank">
                <i class="bi bi-arrow-up-right text-warning"></i>
                View Storefront
            </a>
        </header>

        <!-- STATS CARDS ARCHITECTURE -->
        <div class="row g-4">

            <!-- USERS -->
            <div class="col-md-3">
                <div class="admin-stat-card">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <span class="stat-title">Total Patrons</span>
                        <div class="stat-icon-box">
                            <i class="bi bi-people"></i>
                        </div>
                    </div>
                    <h2 class="stat-value display-6 m-0 fw-bold">
                        <%= request.getAttribute("users")==null ? 0 : request.getAttribute("users") %>
                    </h2>
                </div>
            </div>

            <!-- ORDERS -->
            <div class="col-md-3">
                <div class="admin-stat-card">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <span class="stat-title">Live Orders</span>
                        <div class="stat-icon-box">
                            <i class="bi bi-receipt"></i>
                        </div>
                    </div>
                    <h2 class="stat-value display-6 m-0 fw-bold">
                        <%= request.getAttribute("orders")==null ? 0 : request.getAttribute("orders") %>
                    </h2>
                </div>
            </div>

            <!-- REVENUE -->
            <div class="col-md-3">
                <div class="admin-stat-card">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <span class="stat-title">Gross Revenue</span>
                        <div class="stat-icon-box">
                            <i class="bi bi-currency-rupee"></i>
                        </div>
                    </div>
                    <h2 class="stat-value display-6 m-0 fw-bold" style="color: #10b981 !important;">
                        ₹<%= request.getAttribute("revenue")==null ? 0 : request.getAttribute("revenue") %>
                    </h2>
                </div>
            </div>

            <!-- FOODS -->
            <div class="col-md-3">
                <div class="admin-stat-card">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <span class="stat-title">Menu Registry</span>
                        <div class="stat-icon-box">
                            <i class="bi bi-cup-hot"></i>
                        </div>
                    </div>
                    <h2 class="stat-value display-6 m-0 fw-bold">
                        <%= request.getAttribute("foods")==null ? 0 : request.getAttribute("foods") %>
                    </h2>
                </div>
            </div>

        </div>

        <!-- NEW ATTRACIVE ANALYTICS GRAPH COMPONENT -->
        <div class="admin-panel-card mt-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h4 class="h5 mb-1 fw-bold" style="letter-spacing: -0.3px;">Store Activity Analytics</h4>
                    <p class="text-muted-custom small mb-0">Visualizing real-time transaction performance velocity metrics.</p>
                </div>
                <span class="badge px-3 py-2 text-dark bg-warning-subtle fw-semibold" style="border: 1px solid rgba(212,175,55,0.3); border-radius: 8px; color: #d4af37 !important;">
                    <i class="bi bi-graph-up-arrow me-1"></i> Live Stream Data
                </span>
            </div>
            
            <!-- Graphic Element Container Area -->
            <div class="chart-container">
                <canvas id="cafePerformanceChart"></canvas>
            </div>
        </div>

    </div>
</main>

<!-- Bootstrap JS Pipeline -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Render Interactive Custom Luxury Graph Scheme -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const ctx = document.getElementById('cafePerformanceChart').getContext('2d');
        
        // Define beautiful luxury gold gradient fills for the chart line
        const goldGradient = ctx.createLinearGradient(0, 0, 0, 300);
        goldGradient.addColorStop(0, 'rgba(212, 175, 55, 0.4)');
        goldGradient.addColorStop(1, 'rgba(212, 175, 55, 0.0)');

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['08:00 AM', '10:00 AM', '12:00 PM', '02:00 PM', '04:00 PM', '06:00 PM', '08:00 PM', '10:00 PM'],
                datasets: [{
                    label: 'Hourly Order Volume (₹)',
                    data: [1200, 3100, 7400, 5200, 4800, 9100, 12500, 6200],
                    borderColor: '#d4af37',
                    borderWidth: 3,
                    pointBackgroundColor: '#ffffff',
                    pointBorderColor: '#b49322',
                    pointHoverRadius: 7,
                    pointRadius: 4,
                    fill: true,
                    backgroundColor: goldGradient,
                    tension: 0.4  // Makes the graph smooth and curvy
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false // Hide default legends for modern minimalism look
                    }
                },
                scales: {
                    x: {
                        grid: {
                            color: 'rgba(255, 255, 255, 0.03)'
                        },
                        ticks: {
                            color: '#a8a29e',
                            font: { family: 'Poppins', size: 11 }
                        }
                    },
                    y: {
                        grid: {
                            color: 'rgba(255, 255, 255, 0.05)'
                        },
                        ticks: {
                            color: '#a8a29e',
                            font: { family: 'Poppins', size: 11 }
                        }
                    }
                }
            }
        });
    });
</script>

</body>
</html>