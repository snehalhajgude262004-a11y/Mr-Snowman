<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Cart | Mr. SnowMan</title>

    <!-- Bootstrap 5.3.3 -->
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

        /* Page Hero */
        .compact-hero {
            position: relative;
            overflow: hidden;
            padding: 65px 0;
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
            right: 8%;
            top: -100px;
            background: rgba(255, 111, 145, 0.13);
        }

        .compact-hero::after {
            width: 150px;
            height: 150px;
            right: 22%;
            bottom: -100px;
            background: rgba(114, 214, 232, 0.22);
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .section-kicker {
            display: inline-block;
            margin-bottom: 10px;
            color: var(--pink-dark);
            font-size: 0.82rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .compact-hero h1 {
            margin-bottom: 12px;
            color: var(--chocolate);
            font-family: 'Fredoka', sans-serif;
            font-size: clamp(2.2rem, 5vw, 3.5rem);
            font-weight: 600;
        }

        .compact-hero p {
            max-width: 650px;
            margin: 0;
            color: var(--muted);
            font-size: 0.98rem;
            line-height: 1.8;
        }

        /* Main Cart Layout */
        .cart-section {
            padding: 55px 0 70px;
        }

        .cart-list-shell,
        .summary-card {
            height: 100%;
            padding: 28px;
            background: #ffffff;
            border: 1px solid rgba(89, 59, 59, 0.08);
            border-radius: 24px;
            box-shadow: 0 12px 35px rgba(89, 59, 59, 0.06);
            transition: box-shadow 0.25s ease, transform 0.25s ease;
        }

        .cart-list-shell:hover,
        .summary-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 18px 42px rgba(89, 59, 59, 0.10);
        }

        .cart-list-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding-bottom: 20px;
            margin-bottom: 22px;
            border-bottom: 2px dashed #f5dce4;
        }

        .cart-list-header h2,
        .summary-card h2 {
            margin: 0;
            color: var(--chocolate);
            font-family: 'Fredoka', sans-serif;
            font-weight: 600;
        }

        .cart-list-header h2 {
            font-size: 1.65rem;
        }

        .cart-list-header h2 i {
            margin-right: 8px;
            color: var(--pink);
        }

        /* Buttons */
        .btn-brand {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 22px;
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

        .btn-outline-dark {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            padding: 9px 15px;
            color: var(--chocolate) !important;
            background: #ffffff;
            border: 1.5px solid #e8d8d9 !important;
            border-radius: 11px;
            font-weight: 500;
            transition: background 0.25s ease, border-color 0.25s ease,
                        transform 0.25s ease;
        }

        .btn-outline-dark:hover {
            color: var(--chocolate) !important;
            background: var(--soft-blue) !important;
            border-color: var(--blue) !important;
            transform: translateY(-1px);
        }

        /* Cart Items Area */
        .cart-items {
            min-width: 0;
        }

        /* These styles apply if cart.js renders these common classes. */
        .cart-item {
            display: flex;
            align-items: center;
            gap: 18px;
            padding: 18px 0;
            border-bottom: 1px solid #f3e9e9;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .cart-item img {
            width: 90px;
            height: 90px;
            flex-shrink: 0;
            object-fit: cover;
            border-radius: 16px;
            background: var(--soft-pink);
        }

        .cart-item h3,
        .cart-item h4 {
            color: var(--chocolate);
            font-family: 'Fredoka', sans-serif;
            font-size: 1.1rem;
            font-weight: 500;
        }

        .cart-item p {
            color: var(--muted);
            font-size: 0.88rem;
        }

        /* Order Summary */
        .summary-card {
            position: sticky;
            top: 25px;
            height: auto;
            background: linear-gradient(160deg, #ffffff 60%, #fff7f9);
        }

        .summary-card h2 {
            padding-bottom: 18px;
            margin-bottom: 8px !important;
            border-bottom: 2px dashed #f5dce4;
            font-size: 1.7rem;
        }

        .summary-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 43px;
            height: 43px;
            margin-bottom: 14px;
            color: var(--pink-dark);
            background: var(--soft-pink);
            border-radius: 14px;
            font-size: 1.3rem;
        }

        .summary-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding: 17px 0;
            border-bottom: 1px dashed #eadfe0;
            font-size: 0.92rem;
        }

        .summary-row span {
            color: var(--muted);
        }

        .summary-row strong {
            color: var(--chocolate);
            font-size: 1.05rem;
            font-weight: 700;
            text-align: right;
            overflow-wrap: anywhere;
        }

        #cartTotalPrice {
            color: var(--pink-dark);
            font-size: 1.25rem;
        }

        #checkoutButton {
            min-height: 49px;
            width: 100%;
        }

        #clearCartButton {
            min-height: 46px;
        }

        .summary-note {
            margin: 17px 0 0;
            color: var(--muted);
            font-size: 0.78rem;
            line-height: 1.7;
            text-align: center;
        }

        /* Empty Cart */
        .empty-state {
            padding: 45px 15px;
            text-align: center;
        }

        .empty-state > i {
            display: inline-block;
            margin-bottom: 18px;
            color: var(--pink);
            font-size: 4.3rem;
        }

        .empty-state h3 {
            margin-bottom: 10px;
            color: var(--chocolate);
            font-family: 'Fredoka', sans-serif;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .empty-state p {
            max-width: 400px;
            margin-right: auto;
            margin-left: auto;
            line-height: 1.8;
        }

        /* Mobile Responsiveness */
        @media (max-width: 767px) {
            .compact-hero {
                padding: 45px 0;
            }

            .cart-section {
                padding: 35px 0 50px;
            }

            .cart-list-shell,
            .summary-card {
                padding: 20px;
                border-radius: 19px;
            }

            .cart-list-header {
                align-items: flex-start;
                flex-direction: column;
            }

            .cart-list-header .btn {
                width: 100%;
            }

            .summary-card {
                position: static;
            }

            .cart-item {
                align-items: flex-start;
                flex-wrap: wrap;
            }

            .cart-item img {
                width: 75px;
                height: 75px;
            }
        }

        @media (max-width: 400px) {
            .cart-list-shell,
            .summary-card {
                padding: 16px;
            }

            .empty-state {
                padding: 35px 5px;
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

        <!-- Page Hero -->
        <section class="page-hero compact-hero">
            <div class="container hero-content">
                <span class="section-kicker">A little scoop of happiness</span>

                <h1>Your Sweet Cart <i class="bi bi-heart-fill"
                    style="color: var(--pink); font-size: 0.7em;"></i></h1>

                <p>
                    Your favourite treats are waiting for you.
                    Review your order, update your cart and get ready
                    for a little sweetness!
                </p>
            </div>
        </section>

        <!-- Cart Section -->
        <section class="cart-section">
            <div class="container">
                <div class="row g-4">

                    <!-- Cart Items -->
                    <div class="col-lg-8">
                        <div class="cart-list-shell">

                            <div class="cart-list-header">
                                <h2>
                                    <i class="bi bi-bag-heart-fill"></i>
                                    Cart Items
                                </h2>

                                <a href="${pageContext.request.contextPath}/menu.jsp"
                                   class="btn btn-outline-dark btn-sm">
                                    <i class="bi bi-plus-lg"></i>
                                    Add More Treats
                                </a>
                            </div>

                            <!-- Required by existing cart JavaScript -->
                            <div id="cartItems" class="cart-items"></div>

                            <!-- Empty Cart -->
                            <div id="emptyCart" class="empty-state d-none">
                                <i class="bi bi-bag-x"></i>

                                <h3>Oops! Your cart is empty</h3>

                                <p class="text-muted mb-4">
                                    Your next favourite scoop is waiting.
                                    Explore our menu and pick something delicious!
                                </p>

                                <a href="${pageContext.request.contextPath}/menu.jsp"
                                   class="btn btn-brand">
                                    <i class="bi bi-snow"></i>
                                    Explore the Menu
                                </a>
                            </div>

                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="col-lg-4">
                        <aside class="summary-card">

                            <div class="summary-icon">
                                <i class="bi bi-receipt"></i>
                            </div>

                            <h2 class="h4 mb-4">Order Summary</h2>

                            <div class="summary-row">
                                <span>
                                    <i class="bi bi-basket2 me-2"></i>
                                    Total Quantity
                                </span>

                                <strong id="cartTotalQty">0</strong>
                            </div>

                            <div class="summary-row mb-4">
                                <span>
                                    <i class="bi bi-currency-rupee me-2"></i>
                                    Total Price
                                </span>

                                <strong id="cartTotalPrice">Rs. 0</strong>
                            </div>

                            <a href="${pageContext.request.contextPath}/checkout.jsp"
                               id="checkoutButton"
                               class="btn btn-brand mt-2">
                                Proceed to Checkout
                                <i class="bi bi-arrow-right"></i>
                            </a>

                            <button type="button"
                                    id="clearCartButton"
                                    class="btn btn-outline-dark w-100 mt-3">
                                <i class="bi bi-trash3"></i>
                                Clear Cart
                            </button>

                            <p class="summary-note">
                                <i class="bi bi-heart-fill me-1"
                                   style="color: var(--pink);"></i>
                                Made sweeter with every scoop.
                            </p>

                        </aside>
                    </div>

                </div>
            </div>
        </section>

    </main>

    <!-- Existing Footer -->
    <jsp:include page="/components/footer.jsp"/>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Existing Cart / Website JavaScript -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>
