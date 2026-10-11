<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | Mr.Snowman</title>

    <!-- Bootstrap 5.3.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts: Poppins & Playfair Display -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

    <!-- Linking your premium updated admin.css with a cache-buster (?v=2) to force browser update -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css?v=2">
</head>

<body class="admin-login-body">

<div class="admin-login-shell">

    <div class="admin-login-card">
        
        <!-- Left Visual Side (Using classes defined in your premium admin.css) -->
        <div class="admin-login-visual">
            <div class="admin-brand">
                <span>Mr.Snowman</span>
            </div>
            <div>
                <h1>Crafting Premium Culinary Experiences.</h1>
                <p>Welcome back to the control room. Manage menus, review active orders, and monitor dashboard performances in real-time.</p>
            </div>
            <div class="admin-kicker">
                Management Portal
            </div>
        </div>

        <!-- Right Form Side -->
        <div class="admin-form">
            <h2 class="mb-2">Admin Sign In</h2>
            <p class="text-muted small mb-4">Please authenticate using your system credentials.</p>

            <!-- Functionality preserved: Error message scriptlet -->
            <% if(request.getAttribute("error") != null){ %>
                <div class="alert alert-danger p-3 mb-4 rounded-3 small fw-medium">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <!-- Functionality preserved: Exact matching action and method -->
            <form action="${pageContext.request.contextPath}/admin/login" method="post">

                <div class="mb-3">
                    <label class="form-label small fw-semibold">Email Address</label>
                    <!-- Functionality preserved: name="adminEmail" -->
                    <input type="email"
                           name="adminEmail"
                           class="form-control"
                           placeholder="admin@berryco.com"
                           required>
                </div>

                <div class="mb-4">
                    <label class="form-label small fw-semibold">Password</label>
                    <!-- Functionality preserved: name="adminPassword" -->
                    <input type="password"
                           name="adminPassword"
                           class="form-control"
                           placeholder="••••••••"
                           required>
                </div>

                <button type="submit" class="btn btn-admin w-100 shadow-sm">
                    Submit
                </button>

            </form>
        </div>

    </div>

</div>

</body>
</html>