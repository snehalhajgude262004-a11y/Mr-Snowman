<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside class="admin-sidebar">

    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/admin/dashboard.jsp"
       class="admin-brand sidebar-brand">

        <img src="${pageContext.request.contextPath}/assets/logo.jpeg"
             alt="The Berry.Co logo">

        <span>Mr.Snowman</span>

    </a>

    <!-- Sidebar Navigation -->
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

        <a href="${pageContext.request.contextPath}/admin/orders.jsp">
            <i class="bi bi-receipt"></i>
            Order Management
        </a>

        <!-- Logout -->
        <button type="button" id="adminLogout">

            <i class="bi bi-box-arrow-right"></i>

            Logout

        </button>

    </nav>

</aside>