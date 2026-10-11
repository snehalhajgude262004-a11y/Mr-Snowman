<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String userName = (String) session.getAttribute("userName");
%>

<!-- Integrated Navigation Layout Stylesheet Overrides -->
<style>
    /* Premium Glassmorphism Navbar Layer Setup */
    .app-navbar {
        background: rgba(255, 255, 255, 0.85) !important;
        backdrop-filter: blur(15px) !important;
        -webkit-backdrop-filter: blur(15px) !important;
        border-bottom: 1px solid rgba(136, 19, 55, 0.06);
        box-shadow: 0 4px 25px rgba(46, 8, 20, 0.04);
        transition: all 0.3s ease;
    }

    .navbar-brand {
        font-family: 'Playfair Display', serif;
        font-weight: 700;
        font-size: 1.25rem;
        color: #4c0519 !important; /* Deep Premium Berry */
    }

    .brand-logo {
        height: 36px;
        width: auto;
        object-fit: contain;
    }

    /* Vibrant Navigation Item Anchors */
    .app-navbar .nav-link {
        color: #574e4a !important;
        font-weight: 500;
        font-size: 0.95rem;
        padding: 8px 16px !important;
        border-radius: 8px;
        transition: all 0.2s ease;
    }

    .app-navbar .nav-link:hover {
        color: #be123c !important; /* Bright Berry Accent */
        background: rgba(244, 63, 94, 0.05);
    }

    /* Embedded Dynamic Basket Counter Badge */
    .nav-cart-count {
        background: linear-gradient(135deg, #e11d48 0%, #be123c 100%);
        color: #ffffff;
        font-size: 0.75rem;
        font-weight: 600;
        padding: 2px 8px;
        border-radius: 20px;
        margin-left: 4px;
        display: inline-block;
        vertical-align: middle;
        box-shadow: 0 2px 8px rgba(225, 29, 72, 0.3);
    }

    /* High-Energy Action Button Configuration */
    .app-navbar .btn-brand {
        background: linear-gradient(135deg, #e11d48 0%, #be123c 100%) !important;
        color: #ffffff !important;
        border: none !important;
        font-weight: 600;
        padding: 8px 18px !important;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(225, 29, 72, 0.2);
        transition: all 0.2s ease;
    }

    .app-navbar .btn-brand:hover {
        transform: translateY(-1px);
        box-shadow: 0 6px 15px rgba(225, 29, 72, 0.35);
        filter: brightness(1.1);
    }

    /* Premium Profile Dropdown Restyling */
    .dropdown-menu {
        border: 1px solid rgba(136, 19, 55, 0.08) !important;
        border-radius: 14px !important;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08) !important;
        padding: 8px !important;
    }

    .dropdown-item {
        border-radius: 8px;
        padding: 8px 16px !important;
        font-size: 0.92rem;
        color: #574e4a !important;
        font-weight: 500;
    }

    .dropdown-item:hover {
        background-color: #fff1f2 !important;
        color: #be123c !important;
    }

    .dropdown-item.text-danger:hover {
        background-color: #fef2f2 !important;
        color: #991b1b !important;
    }

    /* CRUCIAL LAYOUT SPACING REPAIR FIX
       Pushes content frames down safely underneath the 70px tall fixed layout ribbon */
    body {
        padding-top: 72px !important;
    }
    @media (max-width: 991px) {
        body { padding-top: 68px !important; }
    }
</style>

<nav class="navbar navbar-expand-lg fixed-top app-navbar">
    <div class="container">

        <!-- LOGO -->
        <a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/assets/logo.jpeg" alt="The Berry.Co logo" class="brand-logo">
            <span>Mr . Snowman</span>
        </a>

        <!-- TOGGLE -->
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav ms-auto align-items-lg-center mt-2 mt-lg-0 gap-1">

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center" href="${pageContext.request.contextPath}/cart.jsp">
                        Cart <span class="nav-cart-count">0</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/orders.jsp">My Orders</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
                </li>

                <%
                if(userName == null){
                %>
                    <li class="nav-item ms-lg-2">
                        <a class="nav-link text-center" href="${pageContext.request.contextPath}/login.jsp">Login</a>
                    </li>

                    <li class="nav-item ms-lg-2 mt-2 mt-lg-0">
                        <a class="btn btn-brand btn-sm d-block text-center text-white" href="${pageContext.request.contextPath}/register.jsp">
                            Register
                        </a>
                    </li>
                <%
                } else {
                %>
                    <li class="nav-item dropdown ms-lg-2">
                        <a class="nav-link dropdown-toggle d-flex align-items-center gap-1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle me-1 text-secondary"></i> <%= userName %>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end animated fadeInFast">
                            <li>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/orders.jsp">
                                    <i class="bi bi-clock-history me-2"></i> My Orders
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/profile.jsp">
                                    <i class="bi bi-person-gear me-2"></i> My Account
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">
                                    <i class="bi bi-box-arrow-right me-2"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </li>
                <%
                }
                %>

            </ul>
        </div>

    </div>
</nav>