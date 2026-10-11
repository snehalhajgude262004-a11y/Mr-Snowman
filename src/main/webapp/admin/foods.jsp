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
    <title>Food Management | Mr.Snowman</title>

    <!-- Bootstrap 5.3.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Your external custom admin styles (With cache buster ?v=2) -->
    <link rel="stylesheet" href="../css/admin.css?v=2">

    <style>
        /* Extra precise fine-tuning matching your premium admin.css theme specs */
        .admin-modal {
            border: 1px solid var(--admin-line);
            border-radius: 20px;
            box-shadow: 0 30px 60px rgba(28, 25, 23, 0.15);
            background: var(--admin-surface);
            overflow: hidden;
        }
        .modal-header {
            border-bottom: 1px solid var(--admin-line);
            background-color: #faf9f6;
            padding: 20px 32px;
        }
        .modal-title {
            font-size: 1.35rem;
            font-weight: 700;
            color: var(--admin-ink);
            letter-spacing: -0.5px;
        }
        .modal-body {
            padding: 32px;
        }
        .modal-footer {
            border-top: 1px solid var(--admin-line);
            background-color: #faf9f6;
            padding: 20px 32px;
        }
        #foodCountLabel {
            font-size: 0.85rem;
            font-weight: 600;
            background-color: rgba(212, 175, 55, 0.1);
            color: var(--admin-brand-dark);
            padding: 6px 14px;
            border-radius: 999px;
            letter-spacing: 0.5px;
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

        <!-- Highlighted Active Link using admin.css parameters -->
        <a href="${pageContext.request.contextPath}/admin/foods.jsp" class="active">
            <i class="bi bi-cup-hot"></i>
            Food Management
        </a>

        <a href="${pageContext.request.contextPath}/admin/users.jsp">
            <i class="bi bi-people"></i>
            User Management
        </a>

        <a href="${pageContext.request.contextPath}/admin/orders.jsp">
            <i class="bi bi-receipt"></i>
            Order Management
        </a>

        <button type="button" id="adminLogout">
            <i class="bi bi-box-arrow-right"></i>
            Logout
        </button>
    </nav>

</aside>


<!-- MAIN WRAPPER CONTAINER -->
<main class="admin-main">

    <header class="admin-topbar">
        <div>
            <span class="admin-kicker">Menu Database</span>
            <h1>Food Management</h1>
        </div>

        <button class="btn btn-admin d-inline-flex align-items-center gap-2" 
                type="button" 
                data-bs-toggle="modal" 
                data-bs-target="#foodModal">
            <i class="bi bi-plus-lg"></i>
            Add Food Item
        </button>
    </header>


    <!-- MANAGEMENT TABLE CONTAINER PANEL -->
    <section class="admin-panel">

        <div class="panel-heading">
            <h2 class="m-0 font-weight-700 h4">Food Items</h2>
            <!-- Functionality preserved: id="foodCountLabel" -->
            <span id="foodCountLabel">0 items</span>
        </div>

        <div class="table-responsive">
            <table class="table admin-table align-middle m-0">
                <thead>
                    <tr>
                        <th style="width: 100px;">Image</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th class="text-end" style="width: 140px;">Actions</th>
                    </tr>
                </thead>
                <!-- Functionality preserved: id="foodTableBody" for dynamic JavaScript insertion -->
                <tbody id="foodTableBody">
                    <!-- Data from DB injected automatically via admin.js -->
                </tbody>
            </table>
        </div>

        <!-- Functionality preserved: Empty status indicator wrapper -->
        <div id="emptyFoods" class="admin-empty d-none">
            <i class="bi bi-inbox text-muted display-6 d-block mb-3"></i>
            <span class="fw-medium">No food items found in the menu database.</span>
        </div>

    </section>

</main>


<!-- INPUT MODAL INTERFACE CONTAINER -->
<div class="modal fade" id="foodModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content admin-modal">

            <!-- Functionality preserved: Form routes, dynamic paths, validations, hidden settings -->
            <form id="foodForm" 
                  class="needs-validation" 
                  action="${pageContext.request.contextPath}/admin/food/save" 
                  method="post" 
                  novalidate>
                
                <input type="hidden" name="formAction" value="saveFood">

                <div class="modal-header">
                    <!-- Functionality preserved: id="foodModalTitle" -->
                    <h2 class="modal-title" id="foodModalTitle">Add Food Item</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <!-- Functionality preserved: id="foodId" hidden identifier -->
                    <input type="hidden" id="foodId" name="foodId">

                    <div class="row g-4">
                        <div class="col-md-6">
                            <label for="foodImage" class="form-label small fw-semibold text-secondary">Image Reference URL</label>
                            <!-- Functionality preserved: name="imageUrl" / id="foodImage" -->
                            <input type="text" 
                                   class="form-control" 
                                   id="foodImage" 
                                   name="imageUrl" 
                                   placeholder="assets/waffle.jpeg" 
                                   required>
                        </div>

                        <div class="col-md-6">
                            <label for="foodName" class="form-label small fw-semibold text-secondary">Dish Designation Name</label>
                            <!-- Functionality preserved: name="foodName" / id="foodName" -->
                            <input type="text" 
                                   class="form-control" 
                                   id="foodName" 
                                   name="foodName" 
                                   placeholder="e.g., Classic Strawberry Waffle" 
                                   required>
                        </div>

                        <div class="col-12">
                            <label for="foodDescription" class="form-label small fw-semibold text-secondary">Menu Item Description</label>
                            <!-- Functionality preserved: name="description" / id="foodDescription" -->
                            <textarea class="form-control" 
                                      id="foodDescription" 
                                      name="description" 
                                      rows="3" 
                                      placeholder="Provide a delightful culinary description..." 
                                      required></textarea>
                        </div>

                        <div class="col-md-6">
                            <label for="foodCategory" class="form-label small fw-semibold text-secondary">Menu Group Category</label>
                            <!-- Functionality preserved: name="category" / id="foodCategory" -->
                            <select class="form-select" id="foodCategory" name="category" required>
                                <option value="">Choose category</option>
                                <option value="Waffles">Waffles</option>
                                <option value="Ice Creams">Ice Creams</option>
                                <option value="Buckets">Buckets</option>
                                <option value="Berry Treats">Berry Treats</option>
                                <option value="Shakes">Shakes</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="foodPrice" class="form-label small fw-semibold text-secondary">Pricing Rate</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light text-muted font-monospace">₹</span>
                                <!-- Functionality preserved: name="price" / id="foodPrice" -->
                                <input type="number" 
                                       class="form-control" 
                                       id="foodPrice" 
                                       name="price" 
                                       min="1" 
                                       step="0.01" 
                                       placeholder="0.00" 
                                       required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-dark px-4" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-admin px-4">Save Food Item</button>
                </div>

            </form>
        </div>
    </div>
</div>

<!-- Bundle Javascripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Functionality preserved: Exact local scripts pipeline -->
<script src="../js/admin.js"></script>

</body>
</html>