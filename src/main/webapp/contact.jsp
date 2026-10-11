<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Contact Us | Mr. SnowMan</title>

    <!-- Bootstrap 5.3.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Leckerli+One&display=swap"
          rel="stylesheet">

    <!-- Main Stylesheet -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        :root {
            --snow-purple: #493B5F;
            --snow-pink: #F83D8E;
            --snow-rose: #BC5278;
            --snow-light-pink: #FFF0F6;
            --snow-ice-blue: #EAF7FF;
            --snow-cream: #FFF9F0;
            --snow-text: #41384A;
        }

        * {
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(
                180deg,
                #FFF9FC 0%,
                #F7F3FC 55%,
                #FFF9F0 100%
            );
            font-family: 'Poppins', sans-serif;
            color: var(--snow-text);
            margin: 0;
        }

        /* Hero section */

        .page-hero {
            position: relative;
            overflow: hidden;
            padding: 75px 0;
            background: linear-gradient(
                135deg,
                var(--snow-purple) 0%,
                var(--snow-rose) 55%,
                var(--snow-pink) 100%
            );
            color: #ffffff;
            border-bottom: 4px solid #F8C8D8;
        }

        .page-hero::before {
            content: "";
            position: absolute;
            width: 250px;
            height: 250px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.07);
            top: -100px;
            right: 10%;
        }

        .page-hero::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.06);
            bottom: -100px;
            left: 5%;
        }

        .hero-content,
        .hero-image-wrapper {
            position: relative;
            z-index: 1;
        }

        .section-kicker {
            display: inline-block;
            color: #FFE1ED;
            text-transform: uppercase;
            font-size: 0.82rem;
            letter-spacing: 2px;
            font-weight: 600;
            margin-bottom: 14px;
        }

        .page-hero h1 {
            font-family: 'Leckerli One', cursive;
            font-size: clamp(2.3rem, 5vw, 3.7rem);
            line-height: 1.25;
            color: #ffffff;
            margin-bottom: 20px;
        }

        .page-hero p {
            color: #FFF0F6;
            max-width: 600px;
            font-size: 1rem;
            line-height: 1.9;
            margin-bottom: 0;
        }

        .hero-image-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .page-hero-img {
            max-height: 300px;
            object-fit: contain;
            border: 4px solid rgba(255, 255, 255, 0.3);
            border-radius: 24px;
            box-shadow: 0 18px 40px rgba(30, 15, 40, 0.25);
            transition: transform 0.35s ease;
        }

        .page-hero-img:hover {
            transform: translateY(-5px) scale(1.02);
        }

        .hero-decoration {
            position: absolute;
            color: rgba(255, 255, 255, 0.2);
            font-size: 2rem;
        }

        .hero-decoration.one {
            top: 20px;
            right: 25px;
        }

        .hero-decoration.two {
            bottom: 25px;
            left: 20px;
        }

        /* Main contact section */

        .contact-section {
            padding: 70px 0;
        }

        .section-heading {
            color: var(--snow-purple);
            font-family: 'Leckerli One', cursive;
            font-size: clamp(1.9rem, 4vw, 2.7rem);
        }

        .section-description {
            color: #81758A;
            line-height: 1.8;
        }

        /* Contact cards */

        .contact-stack {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .contact-card {
            display: flex;
            align-items: center;
            gap: 18px;
            padding: 22px;
            background: #ffffff;
            border: 1px solid #F1E6F0;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(73, 59, 95, 0.05);
            transition: transform 0.3s ease,
                        box-shadow 0.3s ease,
                        border-color 0.3s ease;
            min-width: 0;
        }

        .contact-card:hover {
            transform: translateY(-4px);
            border-color: #F3B7D0;
            box-shadow: 0 15px 30px rgba(73, 59, 95, 0.1);
        }

        .contact-icon {
            flex: 0 0 54px;
            width: 54px;
            height: 54px;
            border-radius: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
        }

        .contact-card:nth-child(1) .contact-icon {
            background: #F1EAFE;
            color: #7955B5;
        }

        .contact-card:nth-child(2) .contact-icon {
            background: #FFF0F6;
            color: #E83E8C;
        }

        .contact-card:nth-child(3) .contact-icon {
            background: #EAF7FF;
            color: #2878B5;
        }

        .contact-card:nth-child(4) .contact-icon {
            background: #FFF5DF;
            color: #C58A24;
        }

        .contact-card h3 {
            font-size: 0.8rem;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            color: #93869A;
            margin: 0 0 5px;
        }

        .contact-card a {
            color: var(--snow-purple);
            text-decoration: none;
            font-size: 0.93rem;
            font-weight: 600;
            overflow-wrap: anywhere;
            transition: color 0.2s ease;
        }

        .contact-card a:hover {
            color: var(--snow-pink);
        }

        /* Contact form */

        .contact-form {
            background: #ffffff;
            border: 1px solid #F1E6F0;
            border-radius: 26px;
            padding: 38px;
            box-shadow: 0 15px 40px rgba(73, 59, 95, 0.07);
        }

        .contact-form h2 {
            font-family: 'Leckerli One', cursive;
            color: var(--snow-purple);
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .form-intro {
            color: #897D91;
            font-size: 0.92rem;
            line-height: 1.8;
            margin-bottom: 28px;
        }

        .form-label {
            color: #554A60;
            font-size: 0.88rem;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-control {
            padding: 13px 15px;
            color: var(--snow-purple);
            background: #FFFBFE;
            border: 1.5px solid #EAE1ED;
            border-radius: 13px;
            font-size: 0.92rem;
            transition: border-color 0.25s ease,
                        box-shadow 0.25s ease;
        }

        .form-control:focus {
            background: #ffffff;
            border-color: var(--snow-pink);
            box-shadow: 0 0 0 4px rgba(248, 61, 142, 0.12);
        }

        .form-control::placeholder {
            color: #B2A7B9;
        }

        textarea.form-control {
            min-height: 140px;
            resize: vertical;
        }

        .btn-brand {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            padding: 14px 28px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(
                135deg,
                var(--snow-pink),
                var(--snow-rose)
            );
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
            font-size: 0.95rem;
            font-weight: 600;
            box-shadow: 0 7px 18px rgba(248, 61, 142, 0.22);
            transition: transform 0.25s ease,
                        box-shadow 0.25s ease;
        }

        .btn-brand:hover {
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 10px 24px rgba(248, 61, 142, 0.32);
        }

        .contact-note {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-top: 22px;
            padding: 15px;
            border-radius: 14px;
            background: var(--snow-ice-blue);
            color: #52677B;
            font-size: 0.82rem;
            line-height: 1.7;
        }

        .contact-note i {
            color: #4385B6;
            font-size: 1.1rem;
        }

        /* Toast */

        .toast {
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        /* Responsive */

        @media (max-width: 991px) {
            .page-hero {
                padding: 60px 0;
            }

            .hero-image-wrapper {
                margin-top: 10px;
            }

            .page-hero-img {
                max-height: 240px;
            }

            .contact-section {
                padding: 50px 0;
            }
        }

        @media (max-width: 575px) {
            .page-hero {
                padding: 48px 0;
            }

            .page-hero h1 {
                font-size: 2.25rem;
            }

            .contact-section {
                padding: 35px 0;
            }

            .contact-form {
                padding: 24px 18px;
                border-radius: 20px;
            }

            .contact-form h2 {
                font-size: 1.8rem;
            }

            .contact-card {
                padding: 17px;
                gap: 14px;
            }

            .contact-icon {
                flex-basis: 46px;
                width: 46px;
                height: 46px;
                border-radius: 13px;
                font-size: 1.3rem;
            }

            .btn-brand {
                width: 100%;
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

    <!-- HEADER -->
    <jsp:include page="/components/header.jsp" />

    <main>

        <!-- HERO -->
        <section class="page-hero">
            <div class="container">
                <div class="row align-items-center g-5">

                    <div class="col-lg-7 hero-content">
                        <span class="section-kicker">
                            We'd Love to Hear From You
                        </span>

                        <h1>Let's Make Your Day a Little Sweeter!</h1>

                        <p>
                            Have a question, celebration request, or a favourite
                            ice cream idea? Send us a message. We'd love to help
                            make your Mr. SnowMan experience special.
                        </p>
                    </div>

                    <div class="col-lg-5 hero-image-wrapper">
                        <div class="text-center">
                            <!-- Replace with your actual Mr. SnowMan image if available -->
                            

                            <div class="mt-3 text-white-50 small">
                                <i class="bi bi-snow2 me-1"></i>
                                A little sweetness in every scoop
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <i class="bi bi-snow2 hero-decoration one" aria-hidden="true"></i>
            <i class="bi bi-stars hero-decoration two" aria-hidden="true"></i>
        </section>

        <!-- CONTACT CONTENT -->
        <section class="contact-section">
            <div class="container">

                <div class="text-center mb-5">
                    <span class="section-kicker" style="color: #BC5278;">
                        Stay Connected
                    </span>

                    <h2 class="section-heading">We’re Just a Message Away</h2>

                    <p class="section-description mt-3 mb-0">
                        Questions, feedback, or ice cream cravings?
                        Get in touch with us.
                    </p>
                </div>

                <div class="row g-4 g-xl-5">

                    <!-- CONTACT INFORMATION -->
                    <div class="col-lg-5">
                        <div class="contact-stack">

                            <article class="contact-card">
                                <div class="contact-icon">
                                    <i class="bi bi-geo-alt-fill"></i>
                                </div>

                                <div>
                                    <h3>Visit Us</h3>
                                    <a
                                        href="https://maps.app.goo.gl/DdtdB3qwbXoHemuEA"
                                        target="_blank"
                                        rel="noopener noreferrer">
                                        Pune, Maharashtra
                                    </a>
                                </div>
                            </article>

                            <article class="contact-card">
                                <div class="contact-icon">
                                    <i class="bi bi-telephone-fill"></i>
                                </div>

                                <div>
                                    <h3>Call Us</h3>
                                    <a href="tel:+919356801408">
                                        +91 9356801408
                                    </a>
                                </div>
                            </article>

                            <article class="contact-card">
                                <div class="contact-icon">
                                    <i class="bi bi-envelope-fill"></i>
                                </div>

                                <div>
                                    <h3>Email Us</h3>
                                    <a href="mailto:mrsnowman@gmail.com">
                                        mrsnowman@gmail.com
                                    </a>
                                </div>
                            </article>

                            <article class="contact-card">
                                <div class="contact-icon">
                                    <i class="bi bi-instagram"></i>
                                </div>

                                <div>
                                    <h3>Follow Us</h3>
                                    <a
                                        href="https://instagram.com/snowman"
                                        target="_blank"
                                        rel="noopener noreferrer">
                                        @snowman
                                    </a>
                                </div>
                            </article>

                        </div>

                        <div class="contact-note">
                            <i class="bi bi-heart-fill"></i>
                            <div>
                                <strong>Made with love and sprinkles!</strong>
                                <br>
                                We appreciate your feedback and look forward
                                to hearing from you.
                            </div>
                        </div>
                    </div>

                    <!-- CONTACT FORM -->
                    <div class="col-lg-7">
                        <form
                            id="contactForm"
                            class="needs-validation app-form contact-form"
                            action="${pageContext.request.contextPath}/contact/submit"
                            method="post"
                            novalidate>

                            <input
                                type="hidden"
                                name="formAction"
                                value="contactMessage">

                            <h2>Send Us a Message</h2>

                            <p class="form-intro">
                                Fill in the details below and let us know
                                how we can help you.
                            </p>

                            <div class="row g-3">

                                <div class="col-md-6">
                                    <label for="name" class="form-label">
                                        Full Name
                                    </label>

                                    <input
                                        type="text"
                                        class="form-control"
                                        id="name"
                                        name="fullName"
                                        placeholder="Enter your name"
                                        autocomplete="name"
                                        required>

                                    <div class="invalid-feedback">
                                        Please enter your full name.
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="phone" class="form-label">
                                        Phone Number
                                    </label>

                                    <input
                                        type="tel"
                                        class="form-control"
                                        id="phone"
                                        name="phone"
                                        placeholder="Enter your phone number"
                                        autocomplete="tel"
                                        required>

                                    <div class="invalid-feedback">
                                        Please enter your phone number.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="email" class="form-label">
                                        Email Address
                                    </label>

                                    <input
                                        type="email"
                                        class="form-control"
                                        id="email"
                                        name="email"
                                        placeholder="Enter your email address"
                                        autocomplete="email"
                                        required>

                                    <div class="invalid-feedback">
                                        Please enter a valid email address.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="message" class="form-label">
                                        Your Message
                                    </label>

                                    <textarea
                                        class="form-control"
                                        id="message"
                                        name="message"
                                        rows="5"
                                        placeholder="Tell us what's on your mind..."
                                        required></textarea>

                                    <div class="invalid-feedback">
                                        Please enter your message.
                                    </div>
                                </div>

                            </div>

                            <button class="btn-brand mt-4" type="submit">
                                <i class="bi bi-send-fill"></i>
                                Send Message
                            </button>

                        </form>
                    </div>

                </div>
            </div>
        </section>

    </main>

    <!-- FOOTER -->
    <jsp:include page="/components/footer.jsp" />

    <!-- FEEDBACK TOAST -->
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div
            id="formToast"
            class="toast align-items-center text-bg-dark border-0"
            role="alert"
            aria-live="polite"
            aria-atomic="true">

            <div class="d-flex">
                <div class="toast-body fw-medium">
                    Form submitted.
                </div>

                <button
                    type="button"
                    class="btn-close btn-close-white me-2 m-auto"
                    data-bs-dismiss="toast"
                    aria-label="Close">
                </button>
            </div>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Existing Project JavaScript -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

    <!-- Bootstrap Form Validation -->
    <script>
        (() => {
            'use strict';

            const forms = document.querySelectorAll('.needs-validation');

            Array.from(forms).forEach((form) => {
                form.addEventListener('submit', (event) => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                });
            });
        })();
    </script>

</body>
</html>
