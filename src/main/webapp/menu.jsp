<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="dao.FoodDAO, entity.Food, java.util.List" %>

<%
    FoodDAO foodDAO = new FoodDAO();
    List<Food> foods = foodDAO.getAll();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Menu | Mr. SnowMan Ice Cream Parlour</title>

    <!-- Existing Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Mr. SnowMan Typography -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;600;700&family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- Keep Existing Stylesheet -->
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
        }

        body {
            margin: 0;
            background: var(--snow-white);
            color: var(--dark);
            font-family: 'Poppins', sans-serif;
            overflow-x: hidden;
        }

        h1, h2, h3 {
            font-family: 'Fredoka', sans-serif !important;
            color: var(--chocolate) !important;
            font-weight: 600;
        }

        /* Menu hero */
        .page-hero {
            position: relative;
            overflow: hidden;
            padding: 75px 0;
            background: linear-gradient(
                135deg,
                #fff0f5 0%,
                #effcff 55%,
                #fff8eb 100%
            );
        }

        .page-hero::before {
            content: "";
            position: absolute;
            width: 270px;
            height: 270px;
            border-radius: 50%;
            background: rgba(255, 111, 145, 0.12);
            top: -140px;
            left: -75px;
        }

        .page-hero::after {
            content: "";
            position: absolute;
            width: 240px;
            height: 240px;
            border-radius: 50%;
            background: rgba(114, 214, 232, 0.18);
            bottom: -140px;
            right: -50px;
        }

        .page-hero .container {
            position: relative;
            z-index: 1;
        }

        .section-kicker {
            display: inline-block;
            margin-bottom: 12px;
            color: var(--pink-dark);
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .page-hero h1 {
            margin-bottom: 18px;
            font-size: clamp(2.3rem, 4vw, 3.6rem);
            line-height: 1.15;
        }

        .page-hero p {
            max-width: 620px;
            margin: 0;
            color: var(--muted);
            font-size: 1rem;
            line-height: 1.9;
        }

        .page-hero-img {
            width: 100%;
            max-width: 420px;
            height: 300px;
            object-fit: cover;
            border: 8px solid white;
            border-radius: 32px;
            box-shadow: 0 20px 45px rgba(89, 59, 59, 0.13);
            transition: transform 0.35s ease;
        }

        .page-hero-img:hover {
            transform: translateY(-5px) rotate(1deg);
        }

        .hero-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-top: 24px;
            padding: 10px 16px;
            border: 1px solid rgba(114, 214, 232, 0.4);
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.8);
            color: var(--chocolate);
            font-size: 0.83rem;
            font-weight: 600;
        }

        .hero-tag i {
            color: var(--blue-dark);
        }

        /* Menu section */
        .section-pad {
            padding: 75px 0 90px;
        }

        .menu-heading {
            margin-bottom: 10px;
            font-size: 2.5rem;
        }

        .menu-subtitle {
            color: var(--muted);
            font-size: 0.95rem;
            line-height: 1.8;
        }

        /* Filter toolbar */
        .menu-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 18px;
            margin: 35px 0 40px;
            padding: 18px 22px;
            border: 1px solid #f4e9ec;
            border-radius: 22px;
            background: white;
            box-shadow: 0 12px 35px rgba(89, 59, 59, 0.05);
        }

        .filter-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .btn-filter {
            padding: 10px 17px !important;
            border: 1px solid transparent !important;
            border-radius: 50px !important;
            background: transparent !important;
            color: var(--muted) !important;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .btn-filter:hover,
        .btn-filter.active {
            border-color: #ffd7e1 !important;
            background: #fff0f4 !important;
            color: var(--pink-dark) !important;
            font-weight: 600;
        }

        /* Cart link - same destination */
        .cart-summary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 12px 20px;
            border-radius: 50px;
            background: linear-gradient(135deg, var(--pink), var(--pink-dark));
            box-shadow: 0 8px 20px rgba(239, 71, 111, 0.2);
            color: white !important;
            font-size: 0.88rem;
            font-weight: 600;
            white-space: nowrap;
            transition: transform 0.25s ease;
        }

        .cart-summary:hover {
            transform: translateY(-3px);
        }

        .cart-summary i {
            color: white;
            font-size: 1.1rem;
        }

        /* Dynamic food cards */
        .food-card {
            height: 100%;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            border: 1px solid #f2e8eb;
            border-radius: 25px;
            background: white;
            box-shadow: 0 12px 35px rgba(89, 59, 59, 0.055);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .food-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 22px 45px rgba(89, 59, 59, 0.12);
        }

        .food-card img {
            display: block;
            width: 100%;
            height: 240px;
            object-fit: cover;
            background: #fff4f7;
            transition: transform 0.45s ease;
        }

        .food-card:hover img {
            transform: scale(1.035);
        }

        .food-card-body {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
            padding: 23px;
        }

        .food-card-body > span {
            align-self: flex-start;
            display: inline-block;
            max-width: 100%;
            margin-bottom: 10px;
            padding: 6px 11px;
            overflow-wrap: anywhere;
            border-radius: 50px;
            background: #fff0f4;
            color: var(--pink-dark);
            font-size: 0.7rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .food-card h3 {
            margin-bottom: 10px;
            font-size: 1.4rem;
            line-height: 1.35;
            overflow-wrap: anywhere;
        }

        .food-card-body p {
            flex-grow: 1;
            margin-bottom: 20px;
            color: var(--muted);
            font-size: 0.88rem;
            line-height: 1.75;
            overflow-wrap: anywhere;
        }

        .food-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: auto;
            padding-top: 17px;
            border-top: 1px dashed #eee2e5;
        }

        .food-meta strong {
            color: var(--chocolate);
            font-size: 1.25rem;
            font-weight: 700;
        }

        /* Buttons */
        .btn-brand {
            padding: 10px 19px;
            border: none !important;
            border-radius: 50px;
            background: linear-gradient(135deg, var(--pink), var(--pink-dark)) !important;
            box-shadow: 0 6px 15px rgba(239, 71, 111, 0.18);
            color: white !important;
            font-size: 0.85rem;
            font-weight: 600;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .btn-brand:hover {
            transform: translateY(-2px);
            box-shadow: 0 9px 20px rgba(239, 71, 111, 0.28);
        }

        .btn-brand:focus-visible,
        .btn-filter:focus-visible,
        .cart-summary:focus-visible {
            outline: 3px solid var(--blue-dark);
            outline-offset: 3px;
        }

        /* Empty menu */
        .empty-menu {
            padding: 55px 20px;
            border: 1px dashed #f0cbd5;
            border-radius: 25px;
            background: #fff8fa;
        }

        .empty-menu i {
            color: var(--pink);
            font-size: 2.5rem;
        }

        .empty-menu h3 {
            margin-top: 15px;
            font-size: 1.5rem;
        }

        .empty-menu p {
            margin-bottom: 0;
            color: var(--muted);
        }

        /* Cart toast */
        .toast {
            overflow: hidden;
            border: none !important;
            border-radius: 18px !important;
            background: white !important;
            box-shadow: 0 15px 40px rgba(89, 59, 59, 0.18) !important;
            color: var(--chocolate) !important;
        }

        .toast .toast-body {
            padding: 16px;
            color: var(--chocolate) !important;
        }

        .toast .btn-close {
            filter: none !important;
        }

        /* Responsive layout */
        @media (max-width: 991px) {
            .page-hero {
                padding: 60px 0;
            }

            .page-hero-img {
                max-width: 100%;
                height: 280px;
            }

            .section-pad {
                padding: 60px 0 70px;
            }

            .menu-toolbar {
                align-items: flex-start;
            }
        }

        @media (max-width: 767px) {
            .page-hero h1 {
                font-size: 2.5rem;
            }

            .page-hero p {
                font-size: 0.92rem;
            }

            .menu-heading {
                font-size: 2.1rem;
            }

            .menu-toolbar {
                padding: 16px;
                margin: 25px 0 30px;
            }

            .filter-buttons {
                width: 100%;
            }

            .btn-filter {
                padding: 8px 12px !important;
                font-size: 0.78rem;
            }

            .cart-summary {
                width: 100%;
            }

            .food-card img {
                height: 220px;
            }

            .food-card-body {
                padding: 19px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                scroll-behavior: auto !important;
                animation-duration: 0.01ms !important;
                transition-duration: 0.01ms !important;
            }
        }
    </style>
</head>

<body>

    <!-- Existing header -->
    <jsp:include page="/components/header.jsp"/>

    <main>

        <!-- MENU HERO -->
        <section class="page-hero">
            <div class="container">
                <div class="row align-items-center g-5">

                    <div class="col-lg-7">
                        <span class="section-kicker">
                            Welcome to Mr. SnowMan
                        </span>

                        <h1>
                            Your happy place for all things sweet.
                        </h1>

                        <p>
                            Explore creamy ice creams, delicious waffles,
                            strawberry delights and irresistible desserts.
                            Find your favourite treat and make every day sweeter.
                        </p>

                        <div class="hero-tag">
                            <i class="bi bi-snow2"></i>
                            A little scoop of happiness
                        </div>
                    </div>

                    <div class="col-lg-5 text-center">
                        <!-- Keep existing asset path -->
                        <img
                            src="${pageContext.request.contextPath}/assets/peru.jpeg"
                            class="page-hero-img img-fluid"
                            alt="Delicious dessert at Mr. SnowMan">
                    </div>

                </div>
            </div>
        </section>

        <!-- DYNAMIC MENU -->
        <section class="section-pad">
            <div class="container">

                <div class="text-center">
                    <span class="section-kicker">Made for your cravings</span>

                    <h2 class="menu-heading">
                        Explore Our Menu
                    </h2>

                    <p class="menu-subtitle">
                        Discover your favourite flavours, one delicious treat at a time.
                    </p>
                </div>

                <!-- Filters and cart: existing data-filter values preserved -->
                <div class="menu-toolbar">

                    <div class="filter-buttons">

                        <button type="button"
                                class="btn btn-filter active"
                                data-filter="all">
                            All Treats
                        </button>

                        <button type="button"
                                class="btn btn-filter"
                                data-filter="waffles">
                            Waffles
                        </button>

                        <button type="button"
                                class="btn btn-filter"
                                data-filter="icecream">
                            Ice Creams
                        </button>

                        <button type="button"
                                class="btn btn-filter"
                                data-filter="buckets">
                            Dessert Buckets
                        </button>

                        <button type="button"
                                class="btn btn-filter"
                                data-filter="berry">
                            Berry Treats
                        </button>

                    </div>

                    <!-- Existing cart destination preserved -->
                    <a href="${pageContext.request.contextPath}/cart.jsp"
                       class="cart-summary text-decoration-none">

                        <i class="bi bi-bag-heart-fill"></i>

                        <span>
                            My Cart (<span id="cartCount">0</span>)
                        </span>

                    </a>

                </div>

                <!-- Existing database-driven menu grid -->
                <div class="row g-4 menu-grid">

                    <%
                        if (foods == null || foods.isEmpty()) {
                    %>

                        <div class="col-12">
                            <div class="empty-menu text-center">
                                <i class="bi bi-snow2"></i>

                                <h3>Something sweet is on its way!</h3>

                                <p>
                                    There are no menu items available right now.
                                    Please check back soon.
                                </p>
                            </div>
                        </div>

                    <%
                        } else {
                            for (Food f : foods) {

                                String filterCategory = "";
                                String cat = f.getCategory().toLowerCase();

                                if (cat.contains("waffle")) {
                                    filterCategory = "waffles";
                                } else if (cat.contains("ice")) {
                                    filterCategory = "icecream";
                                } else if (cat.contains("bucket")) {
                                    filterCategory = "buckets";
                                } else if (cat.contains("berry")) {
                                    filterCategory = "berry";
                                } else {
                                    filterCategory = cat.replaceAll(" ", "");
                                }
                    %>

                        <div class="col-md-6 col-lg-4 menu-item"
                             data-category="<%= filterCategory %>">

                            <article class="food-card h-100">

                                <!-- Dynamic database image path preserved -->
                                <img
                                    src="${pageContext.request.contextPath}/<%= f.getImageUrl() %>"
                                    alt="<%= f.getName() %>"
                                    loading="lazy">

                                <div class="food-card-body">

                                    <span>
                                        <%= f.getCategory() %>
                                    </span>

                                    <h3>
                                        <%= f.getName() %>
                                    </h3>

                                    <p>
                                        <%= f.getDescription() %>
                                    </p>

                                    <div class="food-meta">

                                        <strong>
                                            Rs.<%= f.getPrice().setScale(0).toString() %>
                                        </strong>

                                        <!-- Preserve existing cart integration attributes -->
                                        <button
                                            type="button"
                                            class="btn btn-sm btn-brand add-to-cart"
                                            data-id="food-<%= f.getId() %>"
                                            data-name="<%= f.getName() %>"
                                            data-price="<%= f.getPrice().toString() %>"
                                            data-image="<%= f.getImageUrl() %>"
                                            data-category="<%= f.getCategory() %>">

                                            <i class="bi bi-bag-plus me-1"></i>
                                            Add to Cart

                                        </button>

                                    </div>
                                </div>

                            </article>

                        </div>

                    <%
                            }
                        }
                    %>

                </div>

            </div>
        </section>

    </main>

    <!-- Existing footer -->
    <jsp:include page="/components/footer.jsp"/>

    <!-- Existing cart notification -->
    <div class="toast-container position-fixed bottom-0 end-0 p-3">

        <div id="cartToast"
             class="toast align-items-center border-0"
             role="alert"
             aria-live="assertive"
             aria-atomic="true">

            <div class="d-flex">

                <div class="toast-body fw-medium">
                    <i class="bi bi-check-circle-fill me-2"
                       style="color: #36b9d0;"></i>
                    Sweet choice! Item added to your cart.
                </div>

                <button type="button"
                        class="btn-close me-2 m-auto"
                        data-bs-dismiss="toast"
                        aria-label="Close">
                </button>

            </div>

        </div>
    </div>

    <!-- Existing JavaScript: do not replace with new cart logic -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>
```