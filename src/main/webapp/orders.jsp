<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDAO" %>
<%@ page import="entity.CustomerOrder" %>
<%@ page import="entity.OrderItem" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    String lastOrderNumber = (String) session.getAttribute("lastOrderNumber");

    List<CustomerOrder> orders = java.util.Collections.emptyList();

    if (userEmail != null) {
        orders = new OrderDAO().findByCustomerEmail(userEmail);
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Orders | Mr. SnowMan</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;600;700&family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- Existing Global Styles -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        :root {
            --snow-white: #fffdfd;
            --cream: #fff7f1;
            --pink: #ff6f91;
            --pink-dark: #ef476f;
            --blue: #72d6e8;
            --blue-dark: #36b9d0;
            --purple: #8175d8;
            --chocolate: #593b3b;
            --dark: #403438;
            --muted: #7c7075;
            --yellow: #ffd166;
            --soft-pink: #fff0f4;
            --soft-blue: #eefbfe;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: linear-gradient(180deg, var(--snow-white), var(--cream));
            color: var(--dark);
            font-family: 'Poppins', sans-serif;
        }

        a {
            text-decoration: none;
        }

        /* Hero Section */
        .page-hero.compact-hero {
            position: relative;
            overflow: hidden;
            padding: 65px 0;
            color: var(--chocolate);
            background: linear-gradient(125deg, #fff0f4 0%, #eefbfe 55%, #fff7f1 100%);
            border-bottom: 4px solid var(--blue);
        }

        .compact-hero::before,
        .compact-hero::after {
            position: absolute;
            content: "";
            border-radius: 50%;
            pointer-events: none;
        }

        .compact-hero::before {
            width: 210px;
            height: 210px;
            top: -105px;
            right: 8%;
            background: rgba(255, 111, 145, 0.14);
        }

        .compact-hero::after {
            width: 140px;
            height: 140px;
            right: 25%;
            bottom: -90px;
            background: rgba(114, 214, 232, 0.22);
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .page-hero .section-kicker {
            display: inline-block;
            margin-bottom: 10px;
            color: var(--pink-dark);
            font-size: 0.82rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .page-hero h1 {
            margin: 0 0 12px;
            color: var(--chocolate);
            font-family: 'Fredoka', sans-serif;
            font-size: clamp(2.2rem, 5vw, 3.4rem);
            font-weight: 600;
        }

        .page-hero p {
            max-width: 650px;
            margin: 0;
            color: var(--muted);
            font-size: 0.98rem;
            line-height: 1.8;
        }

        /* Page Spacing */
        .section-pad {
            padding: 55px 0 70px;
        }

        /* Success Message */
        .alert-success {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 18px 22px;
            margin-bottom: 30px;
            color: #246b52;
            background: #edfff7;
            border: 1px solid #c4f1dc;
            border-left: 5px solid #5bc99a;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(89, 59, 59, 0.04);
        }

        .alert-success > i {
            color: #35a978;
            font-size: 1.4rem;
        }

        /* Order Cards */
        .summary-card {
            padding: 28px;
            margin-bottom: 8px;
            background: #ffffff;
            border: 1px solid rgba(89, 59, 59, 0.08);
            border-radius: 23px;
            box-shadow: 0 12px 35px rgba(89, 59, 59, 0.06);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .summary-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 18px 42px rgba(89, 59, 59, 0.10);
        }

        .order-heading {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 15px;
        }

        .order-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            flex-shrink: 0;
            color: var(--pink-dark);
            background: var(--soft-pink);
            border-radius: 14px;
            font-size: 1.25rem;
        }

        .summary-card .section-kicker {
            display: inline-block;
            margin-bottom: 5px;
            color: var(--pink-dark);
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-transform: uppercase;
        }

        .summary-card h2 {
            margin: 0;
            color: var(--chocolate);
            font-family: 'Fredoka', sans-serif;
            font-size: 1.35rem;
            font-weight: 600;
            overflow-wrap: anywhere;
        }

        .order-meta {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 12px;
            color: var(--muted);
            font-size: 0.85rem;
        }

        .order-meta i {
            color: var(--blue-dark);
        }

        /* Status Badge */
        .status-badge {
            display: inline-block;
            padding: 6px 13px;
            color: #5e579c;
            background: #f0efff;
            border: 1px solid #e3e0ff;
            border-radius: 50px;
            font-size: 0.77rem;
            font-weight: 600;
            text-transform: capitalize;
        }

        /* Order Total */
        .order-total-label {
            display: block;
            margin-bottom: 4px;
            color: var(--muted);
            font-size: 0.76rem;
            font-weight: 600;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .price-highlight {
            color: var(--pink-dark);
            font-family: 'Fredoka', sans-serif;
            font-size: 1.8rem;
            font-weight: 600;
            overflow-wrap: anywhere;
        }

        .order-divider {
            margin: 22px 0;
            border: 0;
            border-top: 2px dashed #f2dfe4;
            opacity: 1;
        }

        /* Order Items Table */
        .table-responsive {
            border: 1px solid #f3e9e9;
            border-radius: 15px;
        }

        .table {
            --bs-table-bg: transparent;
            margin: 0;
        }

        .table thead th {
            padding: 15px 13px;
            color: var(--muted);
            background: #fff7f9;
            border-bottom: 1px solid #f1dfe4;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            white-space: nowrap;
        }

        .table tbody td {
            padding: 16px 13px;
            color: var(--dark);
            border-bottom: 1px solid #f4eeee;
            font-size: 0.88rem;
            vertical-align: middle;
        }

        .table tbody tr:last-child td {
            border-bottom: none;
        }

        .product-name {
            color: var(--chocolate);
            font-weight: 600;
        }

        .category-badge {
            display: inline-block;
            padding: 6px 11px;
            color: #367a89;
            background: var(--soft-blue);
            border: 1px solid #d8f3f8;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 500;
            white-space: nowrap;
        }

        .item-total {
            color: var(--chocolate);
            font-weight: 600;
            white-space: nowrap;
        }

        /* Buttons */
        .btn-brand {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 23px;
            color: #ffffff !important;
            background: linear-gradient(135deg, var(--pink), var(--pink-dark));
            border: none;
            border-radius: 13px;
            font-family: 'Poppins', sans-serif;
            font-size: 0.9rem;
            font-weight: 600;
            box-shadow: 0 6px 16px rgba(239, 71, 111, 0.20);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .btn-brand:hover {
            color: #ffffff !important;
            transform: translateY(-2px);
            box-shadow: 0 10px 22px rgba(239, 71, 111, 0.30);
        }

        /* Empty States */
        .empty-state {
            max-width: 600px;
            padding: 55px 30px;
            margin: 35px auto;
            text-align: center;
            background: #ffffff;
            border: 1px solid rgba(89, 59, 59, 0.07);
            border-radius: 25px;
            box-shadow: 0 12px 35px rgba(89, 59, 59, 0.05);
        }

        .empty-state > i {
            display: inline-block;
            margin-bottom: 20px;
            color: var(--pink);
            font-size: 4rem;
        }

        .empty-state h3 {
            margin-bottom: 12px;
            color: var(--chocolate);
            font-family: 'Fredoka', sans-serif;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .empty-state p {
            max-width: 430px;
            margin: 0 auto 25px;
            color: var(--muted);
            font-size: 0.92rem;
            line-height: 1.8;
        }

        @media (max-width: 767px) {
            .page-hero.compact-hero {
                padding: 45px 0;
            }

            .section-pad {
                padding: 35px 0 50px;
            }

            .summary-card {
                padding: 20px;
                border-radius: 19px;
            }

            .order-total-block {
                width: 100%;
                padding-top: 12px;
                border-top: 1px dashed #f2dfe4;
            }

            .empty-state {
                padding: 40px 20px;
                margin: 20px auto;
            }

            .table thead th,
            .table tbody td {
                padding: 13px 10px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                scroll-behavior: auto !important;
                transition-duration: 0.01ms !important;
                animation-duration: 0.01ms !important;
            }
        }
    </style>
</head>

<body>

    <!-- Existing Header -->
    <jsp:include page="/components/header.jsp"/>

    <main>

        <!-- Hero -->
        <section class="page-hero compact-hero">
            <div class="container hero-content">
                <span class="section-kicker">Your sweet moments</span>

                <h1>
                    My Orders
                    <i class="bi bi-heart-fill"
                       style="color: var(--pink); font-size: 0.65em;"></i>
                </h1>

                <p>
                    Every order has a little happiness inside.
                    View your purchases and revisit your favourite treats
                    from Mr. SnowMan.
                </p>
            </div>
        </section>

        <!-- Order History -->
        <section class="section-pad">
            <div class="container">

                <% if (lastOrderNumber != null) { %>
                    <div class="alert alert-success" role="alert">
                        <i class="bi bi-check-circle-fill"></i>

                        <div>
                            <strong>Order placed successfully!</strong>
                            Your reference ID is:
                            <strong><%= lastOrderNumber %></strong>
                        </div>
                    </div>
                <% session.removeAttribute("lastOrderNumber"); } %>

                <% if (userEmail == null) { %>

                    <!-- Not Logged In -->
                    <div class="empty-state">
                        <i class="bi bi-person-lock"></i>

                        <h3>Login to see your orders</h3>

                        <p>
                            Your order history is connected to your customer
                            account. Log in to see your previous purchases
                            and order details.
                        </p>

                        <a href="${pageContext.request.contextPath}/login.jsp"
                           class="btn btn-brand">
                            <i class="bi bi-box-arrow-in-right"></i>
                            Login to Account
                        </a>
                    </div>

                <% } else if (orders.isEmpty()) { %>

                    <!-- No Orders -->
                    <div class="empty-state">
                        <i class="bi bi-bag-heart"></i>

                        <h3>No orders yet!</h3>

                        <p>
                            Your first scoop of happiness is waiting.
                            Explore our menu, choose your favourite treats
                            and place your first order.
                        </p>

                        <a href="${pageContext.request.contextPath}/menu.jsp"
                           class="btn btn-brand">
                            <i class="bi bi-snow"></i>
                            Explore the Menu
                        </a>
                    </div>

                <% } else { %>

                    <!-- Customer Orders -->
                    <div class="row g-4">

                        <% for (CustomerOrder order : orders) { %>

                            <div class="col-12">
                                <article class="summary-card">

                                    <!-- Order Header -->
                                    <div class="d-flex flex-wrap justify-content-between align-items-start gap-4">

                                        <div class="flex-grow-1">
                                            <div class="order-heading">
                                                <span class="order-icon">
                                                    <i class="bi bi-receipt-cutoff"></i>
                                                </span>

                                                <div>
                                                    <span class="section-kicker">
                                                        Order Reference
                                                    </span>

                                                    <h2>
                                                        <%= order.getOrderNumber() %>
                                                    </h2>
                                                </div>
                                            </div>

                                            <div class="order-meta">
                                                <span>
                                                    <i class="bi bi-calendar3 me-1"></i>
                                                    <%= order.getCreatedAt() %>
                                                </span>

                                                <span class="status-badge">
                                                    <%= order.getStatus() %>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="order-total-block text-md-end">
                                            <span class="order-total-label">
                                                <i class="bi bi-basket2 me-1"></i>
                                                <%= order.getTotalQuantity() %> item(s)
                                            </span>

                                            <div class="price-highlight">
                                                Rs. <%= order.getTotalAmount() %>
                                            </div>
                                        </div>

                                    </div>

                                    <hr class="order-divider">

                                    <!-- Order Items -->
                                    <div class="table-responsive">
                                        <table class="table align-middle">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="min-width: 190px;">
                                                        Item
                                                    </th>

                                                    <th scope="col">
                                                        Category
                                                    </th>

                                                    <th scope="col" class="text-center">
                                                        Qty
                                                    </th>

                                                    <th scope="col">
                                                        Unit Price
                                                    </th>

                                                    <th scope="col" class="text-end">
                                                        Total
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <% for (OrderItem item : order.getItems()) { %>
                                                    <tr>
                                                        <td class="product-name">
                                                            <%= item.getProductName() %>
                                                        </td>

                                                        <td>
                                                            <span class="category-badge">
                                                                <%= item.getCategory() %>
                                                            </span>
                                                        </td>

                                                        <td class="text-center fw-semibold">
                                                            <%= item.getQuantity() %>
                                                        </td>

                                                        <td class="text-nowrap">
                                                            Rs. <%= item.getUnitPrice() %>
                                                        </td>

                                                        <td class="text-end item-total">
                                                            Rs. <%= item.getLineTotal() %>
                                                        </td>
                                                    </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>

                                </article>
                            </div>

                        <% } %>

                    </div>

                <% } %>

            </div>
        </section>

    </main>

    <!-- Existing Footer -->
    <jsp:include page="/components/footer.jsp"/>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Existing Website JavaScript -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>
