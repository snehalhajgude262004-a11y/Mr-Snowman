<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Mr. SnowMan | Ice Cream Parlour</title>

<!-- Bootstrap 5.3.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;600;700&family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">


<!-- Existing stylesheet - KEEP -->
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


/* ---------------- BODY ---------------- */

body {
    background: #fffdfd;
    color: var(--dark);
    font-family: 'Poppins', sans-serif;
    overflow-x: hidden;
}


/* ---------------- TYPOGRAPHY ---------------- */

h1,
h2,
h3 {
    font-family: 'Fredoka', sans-serif !important;
    color: var(--chocolate) !important;
    font-weight: 600;
}

.section-kicker {
    display: inline-block;
    color: var(--pink-dark) !important;
    text-transform: uppercase;
    font-size: 0.78rem;
    letter-spacing: 2px;
    font-weight: 700;
    margin-bottom: 10px;
}


/* =========================================================
   HERO
   ========================================================= */

.hero-section {
    position: relative;
    padding: 90px 0 80px;
    overflow: hidden;

    background:
        radial-gradient(circle at 10% 20%,
        rgba(255,255,255,0.95) 0,
        rgba(255,255,255,0) 28%),

        radial-gradient(circle at 90% 15%,
        rgba(255,255,255,0.9) 0,
        rgba(255,255,255,0) 25%),

        linear-gradient(135deg,
        #fff1f6 0%,
        #eefcff 48%,
        #fff9ec 100%);
}


/* Decorative blobs */

.hero-section::before {
    content: "";
    position: absolute;
    width: 320px;
    height: 320px;
    background: rgba(255,111,145,0.12);
    border-radius: 50%;
    top: -150px;
    left: -100px;
}

.hero-section::after {
    content: "";
    position: absolute;
    width: 280px;
    height: 280px;
    background: rgba(114,214,232,0.15);
    border-radius: 50%;
    right: -100px;
    bottom: -130px;
}


.hero-section .container {
    position: relative;
    z-index: 2;
}


/* Hero title */

.hero-section h1 {
    color: var(--chocolate) !important;
    font-size: 4rem;
    line-height: 1.08;
    margin-bottom: 22px;
    max-width: 650px;
}


.hero-copy {
    color: var(--muted) !important;
    font-size: 1.05rem;
    line-height: 1.8;
    max-width: 560px;
    margin-bottom: 30px;
}


/* ---------------- BUTTONS ---------------- */

.btn-brand {
    background: linear-gradient(
        135deg,
        var(--pink),
        var(--pink-dark)
    ) !important;

    color: white !important;
    border: none !important;

    font-weight: 600;
    padding: 13px 28px;
    border-radius: 50px;

    box-shadow:
        0 10px 25px rgba(239,71,111,0.22);

    transition: 0.3s ease;
}


.btn-brand:hover {
    transform: translateY(-3px);
    box-shadow:
        0 14px 30px rgba(239,71,111,0.30);
}


.btn-outline-dark {
    border: 2px solid var(--chocolate) !important;
    color: var(--chocolate) !important;
    background: white !important;

    font-weight: 600;
    padding: 11px 27px;
    border-radius: 50px;

    transition: 0.3s ease;
}


.btn-outline-dark:hover {
    background: var(--chocolate) !important;
    color: white !important;
    transform: translateY(-3px);
}


/* =========================================================
   HERO IMAGE / VIDEO
   ========================================================= */

.hero-media {
    position: relative;

    border-radius: 35px;
    overflow: hidden;

    background: white;

    padding: 10px;

    box-shadow:
        0 25px 60px rgba(89,59,59,0.15);

    transform: rotate(1deg);

    transition: 0.4s ease;
}


.hero-media:hover {
    transform: rotate(0deg) translateY(-5px);
}


.hero-media video {
    width: 100%;
    height: 470px;

    object-fit: cover;

    display: block;

    border-radius: 27px;
}


/* =========================================================
   FLOATING SPECIAL BADGE
   ========================================================= */

.floating-order {
    position: absolute;

    bottom: 28px;
    left: 28px;

    background: rgba(255,255,255,0.94);

    backdrop-filter: blur(10px);

    border-radius: 18px;

    padding: 14px 20px;

    display: flex;
    align-items: center;

    gap: 12px;

    box-shadow:
        0 12px 30px rgba(89,59,59,0.15);

    animation: floatSnow 3s ease-in-out infinite;
}


.floating-order i {
    width: 42px;
    height: 42px;

    display: flex;
    align-items: center;
    justify-content: center;

    border-radius: 50%;

    background: #fff0f4;

    color: var(--pink);

    font-size: 1.3rem;
}


.floating-order strong {
    color: var(--pink-dark);

    font-size: 0.7rem;

    text-transform: uppercase;

    letter-spacing: 1px;

    display: block;
}


.floating-order span {
    color: var(--chocolate);

    font-weight: 600;

    font-size: 0.9rem;
}


@keyframes floatSnow {

    0% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-7px);
    }

    100% {
        transform: translateY(0);
    }

}


/* =========================================================
   HERO METRICS
   ========================================================= */

.hero-metrics {
    display: flex;

    gap: 45px;

    margin-top: 42px;

    padding-top: 25px;

    border-top:
        1px solid rgba(89,59,59,0.10);
}


.hero-metrics strong {
    display: block;

    color: var(--pink-dark);

    font-size: 1.7rem;

    font-weight: 700;
}


.hero-metrics span {
    color: var(--muted);

    font-size: 0.75rem;

    text-transform: uppercase;

    letter-spacing: 0.7px;
}


/* =========================================================
   GENERAL SECTION
   ========================================================= */

.section-pad {
    padding: 90px 0;
}


.section-title h2 {
    font-size: 2.6rem;
}


/* =========================================================
   CATEGORY CARDS
   ========================================================= */

.category-card {
    background: white;

    border-radius: 25px;

    padding: 14px;

    text-align: center;

    border:
        1px solid rgba(89,59,59,0.07);

    box-shadow:
        0 12px 35px rgba(89,59,59,0.06);

    transition: 0.35s ease;

    height: 100%;
}


.category-card:hover {
    transform: translateY(-10px);

    box-shadow:
        0 20px 45px rgba(89,59,59,0.12);
}


.category-card img {
    width: 100%;

    height: 190px;

    object-fit: cover;

    border-radius: 19px;

    margin-bottom: 18px;

    transition: 0.4s ease;
}


.category-card:hover img {
    transform: scale(1.03);
}


.category-card h3 {
    font-size: 1.4rem;

    margin-bottom: 8px;
}


.category-card p {
    color: var(--muted);

    font-size: 0.86rem;

    line-height: 1.6;

    margin-bottom: 10px;
}


/* =========================================================
   FEATURED SECTION
   ========================================================= */

.featured-section {

    background:
        linear-gradient(
            180deg,
            #fff7f9 0%,
            #f1fbfd 100%
        );

    border-top:
        1px solid rgba(89,59,59,0.05);

    border-bottom:
        1px solid rgba(89,59,59,0.05);
}


.featured-section h2 {
    font-size: 2.7rem;
}


/* =========================================================
   FOOD CARDS
   ========================================================= */

.food-card {

    background: white;

    border-radius: 25px;

    overflow: hidden;

    border:
        1px solid rgba(89,59,59,0.07);

    box-shadow:
        0 12px 35px rgba(89,59,59,0.06);

    transition: 0.35s ease;

    height: 100%;
}


.food-card:hover {

    transform: translateY(-9px);

    box-shadow:
        0 22px 45px rgba(89,59,59,0.13);
}


.food-card img {

    width: 100%;

    height: 220px;

    object-fit: cover;

    transition: 0.4s ease;
}


.food-card:hover img {
    transform: scale(1.04);
}


.food-card-body {
    padding: 22px;
}


.food-card-body span {

    display: inline-block;

    color: var(--pink-dark);

    background: #fff0f4;

    padding: 5px 11px;

    border-radius: 20px;

    font-size: 0.68rem;

    font-weight: 700;

    text-transform: uppercase;

    letter-spacing: 0.7px;

    margin-bottom: 9px;
}


.food-card h3 {
    font-size: 1.35rem;

    margin-bottom: 17px;
}


.food-meta {

    display: flex;

    justify-content: space-between;

    align-items: center;

    border-top:
        1px dashed #eee2e5;

    padding-top: 15px;
}


.food-meta strong {

    color: var(--chocolate);

    font-size: 1.2rem;
}


/* =========================================================
   ABOUT
   ========================================================= */

.rounded-image {

    width: 100%;

    border-radius: 35px;

    border: 8px solid white;

    box-shadow:
        0 20px 50px rgba(89,59,59,0.13);

    transition: 0.4s ease;
}


.rounded-image:hover {
    transform: translateY(-5px);
}


.about-decoration {

    background:
        linear-gradient(
            135deg,
            #fff0f5,
            #effcff
        );

    border-radius: 25px;

    padding: 25px;

    margin-top: 25px;
}


/* =========================================================
   RESPONSIVE
   ========================================================= */

@media (max-width: 991px) {

    .hero-section {
        padding: 70px 0;
    }

    .hero-section h1 {
        font-size: 3.1rem;
    }

    .hero-media video {
        height: 400px;
    }

}


@media (max-width: 767px) {

    .hero-section {
        padding: 60px 0;
    }

    .hero-section h1 {
        font-size: 2.55rem;
    }

    .hero-copy {
        font-size: 0.95rem;
    }

    .hero-media {
        transform: none;
    }

    .hero-media video {
        height: 330px;
    }

    .hero-metrics {
        gap: 20px;
        flex-wrap: wrap;
    }

    .hero-metrics strong {
        font-size: 1.35rem;
    }

    .section-pad {
        padding: 65px 0;
    }

    .section-title h2,
    .featured-section h2 {
        font-size: 2.15rem;
    }

    .floating-order {
        left: 18px;
        bottom: 18px;
        right: 18px;
    }

}


@media (max-width: 480px) {

    .hero-section h1 {
        font-size: 2.2rem;
    }

    .hero-metrics {
        gap: 18px;
    }

    .hero-metrics span {
        font-size: 0.65rem;
    }

    .hero-media video {
        height: 290px;
    }

}


/* CUSTOMER REVIEWS: uses existing Mr. SnowMan theme */
.reviews-section { background: linear-gradient(180deg, #fffdfd 0%, #fff5f8 52%, #f1fbfd 100%); border-top: 1px solid rgba(89,59,59,.06); border-bottom: 1px solid rgba(89,59,59,.06); }
.reviews-heading { max-width: 680px; margin: 0 auto 42px; }
.reviews-heading h2 { font-size: 2.6rem; margin-bottom: 12px; }
.reviews-heading p { color: var(--muted); line-height: 1.8; margin-bottom: 0; }
.review-card { height: 100%; padding: 28px; background: rgba(255,255,255,.94); border: 1px solid rgba(89,59,59,.08); border-radius: 24px; box-shadow: 0 12px 35px rgba(89,59,59,.07); transition: transform .3s ease, box-shadow .3s ease; }
.review-card:hover { transform: translateY(-7px); box-shadow: 0 20px 42px rgba(89,59,59,.12); }
.review-stars { color: #f4b400; font-size: 1.05rem; letter-spacing: 2px; margin-bottom: 18px; }
.review-quote-icon { color: var(--pink); font-size: 1.5rem; margin-bottom: 10px; }
.review-text { color: var(--muted); font-size: .94rem; line-height: 1.85; margin-bottom: 24px; }
.review-customer { display: flex; align-items: center; gap: 12px; padding-top: 18px; border-top: 1px solid rgba(89,59,59,.09); }
.review-avatar { width: 46px; height: 46px; flex: 0 0 46px; display: flex; align-items: center; justify-content: center; border-radius: 50%; background: #fff0f4; color: var(--pink-dark); font-family: 'Fredoka', sans-serif; font-weight: 600; font-size: 1rem; }
.review-customer h3 { font-family: 'Poppins', sans-serif !important; font-size: .95rem; font-weight: 700; margin: 0 0 4px; }
.review-customer span { display: block; color: var(--muted); font-size: .78rem; }
.reviews-note { color: var(--muted); font-size: .78rem; margin-top: 24px; }
@media (max-width: 767px) { .reviews-heading h2 { font-size: 2.15rem; } .review-card { padding: 24px; } }

</style>

</head>


<body>


<!-- =====================================================
     HEADER
     KEEPING YOUR EXISTING JAVA/JSP HEADER
     ===================================================== -->

<jsp:include page="/components/header.jsp"/>


<main>


<!-- =====================================================
     HERO SECTION
     ===================================================== -->

<section class="hero-section">

    <div class="container">

        <div class="row align-items-center g-5">


            <!-- HERO CONTENT -->

            <div class="col-lg-6">

                <span class="section-kicker">
                    Welcome to Mr. SnowMan
                </span>

                <h1>
                    Happiness served one scoop at a time.
                </h1>

                <p class="hero-copy">
                    Discover creamy ice creams, delicious sundaes,
                    chocolate treats and refreshing desserts crafted
                    to make every moment a little sweeter.
                </p>


                <div class="d-flex flex-wrap gap-3">

                    <a href="${pageContext.request.contextPath}/menu.jsp"
                       class="btn btn-brand btn-lg">

                        <i class="bi bi-cup-straw me-2"></i>
                        Explore Menu

                    </a>


                    <a href="${pageContext.request.contextPath}/contact.jsp"
                       class="btn btn-outline-dark btn-lg">

                        <i class="bi bi-geo-alt me-2"></i>
                        Visit Us

                    </a>

                </div>


                <!-- STATS -->

                <div class="hero-metrics">

                    <div>

                        <strong class="counter"
                                data-target="6800">
                            0
                        </strong>

                        <span>
                            Happy Guests
                        </span>

                    </div>


                    <div>

                        <strong class="counter"
                                data-target="45">
                            0
                        </strong>

                        <span>
                            Sweet Treats
                        </span>

                    </div>


                    <div>

                        <strong class="counter"
                                data-target="15">
                            0
                        </strong>

                        <span>
                            Min Service
                        </span>

                    </div>

                </div>

            </div>


            <!-- HERO MEDIA -->

            <div class="col-lg-6">

                <div class="hero-media">

                    <!-- KEEPING YOUR EXISTING VIDEO -->
                    <video autoplay
                           muted
                           loop
                           playsinline
                           poster="${pageContext.request.contextPath}/assets/straw_chocolate.jpeg">

                        <source
                        src="${pageContext.request.contextPath}/assets/strawberrychoclate-makingvideo.mp4"
                        type="video/mp4">

                    </video>


                    <!-- SPECIAL BADGE -->

                    <div class="floating-order">

                        <i class="bi bi-stars"></i>

                        <div>

                            <strong>
                                Today's Special
                            </strong>

                            <span>
                                Strawberry Chocolate Delight
                            </span>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- =====================================================
     CATEGORIES
     ===================================================== -->

<section class="section-pad">

    <div class="container">


        <div class="section-title text-center mb-5">

            <span class="section-kicker">
                Explore Our Treats
            </span>

            <h2 class="h1">
                Something sweet for every mood.
            </h2>

            <p class="text-muted mt-3">
                Pick your favourite flavour and make your day sweeter.
            </p>

        </div>



        <div class="row g-4">


            <!-- ICE CREAM -->

            <div class="col-md-6 col-lg-3">

                <article class="category-card">

                    <img
                    src="${pageContext.request.contextPath}/assets/icecream-menu.jpeg"
                    alt="Ice Cream">

                    <h3>
                        Ice Cream
                    </h3>

                    <p>
                        Creamy scoops, rich flavours and
                        delightful toppings.
                    </p>

                </article>

            </div>



            <!-- WAFFLES -->

            <div class="col-md-6 col-lg-3">

                <article class="category-card">

                    <img
                    src="${pageContext.request.contextPath}/assets/waffle_choco.jpeg"
                    alt="Waffles">

                    <h3>
                        Waffles
                    </h3>

                    <p>
                        Warm crispy waffles topped with
                        creamy ice cream and chocolate.
                    </p>

                </article>

            </div>



            <!-- STRAWBERRY -->

            <div class="col-md-6 col-lg-3">

                <article class="category-card">

                    <img
                    src="${pageContext.request.contextPath}/assets/homepage_strawberry.jpeg"
                    alt="Strawberry Desserts">

                    <h3>
                        Strawberry
                    </h3>

                    <p>
                        Fresh strawberry creations made
                        for berry lovers.
                    </p>

                </article>

            </div>



            <!-- DESSERT BUCKETS -->

            <div class="col-md-6 col-lg-3">

                <article class="category-card">

                    <img
                    src="${pageContext.request.contextPath}/assets/straw_bucket.jpeg"
                    alt="Dessert Buckets">

                    <h3>
                        Dessert Buckets
                    </h3>

                    <p>
                        Loaded dessert buckets perfect
                        for sharing with friends.
                    </p>

                </article>

            </div>


        </div>

    </div>

</section>



<!-- =====================================================
     SIGNATURE TREATS
     ===================================================== -->

<section class="featured-section section-pad">

    <div class="container">

        <div class="row align-items-center g-5">


            <!-- LEFT -->

            <div class="col-lg-5">

                <span class="section-kicker">
                    Mr. SnowMan Favourites
                </span>

                <h2 class="h1 mb-3">
                    Our sweetest picks for you.
                </h2>

                <p class="text-muted mb-4 fs-5">
                    From creamy strawberry desserts to
                    loaded chocolate waffles, discover the
                    treats our customers love the most.
                </p>


                <a href="${pageContext.request.contextPath}/menu.jsp"
                   class="btn btn-brand py-3 px-4">

                    <i class="bi bi-ice-cream2 me-2"></i>
                    View Full Menu

                </a>

            </div>



            <!-- FOOD CARDS -->

            <div class="col-lg-7">

                <div class="row g-4">


                    <!-- STRAWBERRY CHOCOLATE -->

                    <div class="col-sm-6">

                        <article class="food-card">

                            <img
                            src="${pageContext.request.contextPath}/assets/home_strawchoc.jpeg"
                            alt="Strawberry Chocolate">

                            <div class="food-card-body">

                                <span>
                                    Customer Favourite
                                </span>

                                <h3>
                                    Strawberry Chocolate
                                </h3>

                                <div class="food-meta">

                                    <strong>
                                        Rs.169
                                    </strong>

                                    <button
                                    class="btn btn-sm btn-brand px-3">

                                        <i class="bi bi-plus-lg"></i>
                                        Add

                                    </button>

                                </div>

                            </div>

                        </article>

                    </div>



                    <!-- LOADED WAFFLE -->

                    <div class="col-sm-6">

                        <article class="food-card">

                            <img
                            src="${pageContext.request.contextPath}/assets/home_waffle.jpeg"
                            alt="Loaded Waffle">

                            <div class="food-card-body">

                                <span>
                                    House Favourite
                                </span>

                                <h3>
                                    Loaded Waffle
                                </h3>

                                <div class="food-meta">

                                    <strong>
                                        Rs.189
                                    </strong>

                                    <button
                                    class="btn btn-sm btn-brand px-3">

                                        <i class="bi bi-plus-lg"></i>
                                        Add

                                    </button>

                                </div>

                            </div>

                        </article>

                    </div>


                </div>

            </div>

        </div>

    </div>

</section>




<!-- CUSTOMER REVIEWS: display-only sample content; no backend changes -->
<section class="reviews-section section-pad" id="customer-reviews" aria-labelledby="reviews-title">
    <div class="container">
        <div class="reviews-heading text-center">
            <span class="section-kicker">Sweet Words</span>
            <h2 id="reviews-title">What Our Customers Say</h2>
            <p>Every scoop comes with a little happiness. Here are a few kind words from our ice-cream-loving community.</p>
        </div>
        <div class="row g-4">
            <div class="col-md-6 col-lg-4">
                <article class="review-card">
                    <div class="review-stars" aria-label="5 out of 5 stars">★★★★★</div>
                    <div class="review-quote-icon"><i class="bi bi-quote" aria-hidden="true"></i></div>
                    <p class="review-text">The ice cream was so creamy and delicious! The flavours were lovely, and the presentation made the whole treat feel extra special.</p>
                    <div class="review-customer"><div class="review-avatar" aria-hidden="true">AS</div><div><h3>Aarohi S.</h3><span>Ice cream lover</span></div></div>
                </article>
            </div>
            <div class="col-md-6 col-lg-4">
                <article class="review-card">
                    <div class="review-stars" aria-label="5 out of 5 stars">★★★★★</div>
                    <div class="review-quote-icon"><i class="bi bi-quote" aria-hidden="true"></i></div>
                    <p class="review-text">A lovely place to enjoy dessert with friends. The waffles and sundaes are delicious, and the cheerful vibe makes me want to come back.</p>
                    <div class="review-customer"><div class="review-avatar" aria-hidden="true">RK</div><div><h3>Rohan K.</h3><span>Dessert enthusiast</span></div></div>
                </article>
            </div>
            <div class="col-md-6 col-lg-4">
                <article class="review-card">
                    <div class="review-stars" aria-label="5 out of 5 stars">★★★★★</div>
                    <div class="review-quote-icon"><i class="bi bi-quote" aria-hidden="true"></i></div>
                    <p class="review-text">So many tempting flavours to choose from! The service felt welcoming, and it was the perfect sweet break after a busy day.</p>
                    <div class="review-customer"><div class="review-avatar" aria-hidden="true">MP</div><div><h3>Meera P.</h3><span>Regular visitor</span></div></div>
                </article>
            </div>
        </div>
       
</section>



<section class="section-pad">

    <div class="container">

        <div class="row align-items-center g-5">


            <!-- IMAGE -->

            <div class="col-lg-6">

                <img
                src="${pageContext.request.contextPath}/assets/snowmanfounders.jpeg"
                alt="Mr. SnowMan"
                class="rounded-image img-fluid">

            </div>



            <!-- CONTENT -->

            <div class="col-lg-6">

                <span class="section-kicker">
                    About Mr. SnowMan
                </span>

                <h2 class="h1 mb-3">
                    Made with love. Served with a smile.
                </h2>

                <p class="text-muted fs-5 lh-base">

                    Mr. SnowMan is a cheerful ice-cream
                    destination created for people who believe
                    every day deserves something sweet.

                </p>

                <p class="text-muted lh-base">

                    From creamy scoops and colourful sundaes
                    to delicious waffles and strawberry
                    creations, we bring together fresh
                    ingredients and irresistible flavours
                    for every dessert lover.

                </p>


                <div class="about-decoration">

                    <div class="row g-3">

                        <div class="col-4 text-center">

                            <i class="bi bi-snow2 fs-3"
                               style="color:#72d6e8;">
                            </i>

                            <div class="small fw-semibold mt-2">
                                Fresh
                            </div>

                        </div>


                        <div class="col-4 text-center">

                            <i class="bi bi-heart-fill fs-3"
                               style="color:#ff6f91;">
                            </i>

                            <div class="small fw-semibold mt-2">
                                Made With Love
                            </div>

                        </div>


                        <div class="col-4 text-center">

                            <i class="bi bi-emoji-smile-fill fs-3"
                               style="color:#ffd166;">
                            </i>

                            <div class="small fw-semibold mt-2">
                                Happiness
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


</main>





<jsp:include page="/components/footer.jsp"/>



<!-- Bootstrap -->
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


<!-- Existing JavaScript -->
<script
src="${pageContext.request.contextPath}/js/main.js">
</script>


</body>
</html>