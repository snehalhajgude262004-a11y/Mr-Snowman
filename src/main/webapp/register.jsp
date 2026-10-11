<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Mr.Snowman</title>

    <!-- Bootstrap 5.3.3 Core -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Premium Unified Typography -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,600;0,700;1,400&display=swap" rel="stylesheet">

    <!-- Global Base Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <!-- Premium Café Overrides & Split-Screen Authentication Layout -->
    <style>
        body.auth-body {
            background-color: #f7f3f0;
            font-family: 'Poppins', sans-serif;
            color: #3f3a36;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .auth-shell {
            width: 100%;
            max-width: 1100px;
            background: #ffffff;
            border-radius: 28px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(76, 5, 25, 0.08);
            border: 1px solid rgba(136, 19, 55, 0.04);
        }

        .auth-panel {
            display: flex;
            flex-wrap: wrap;
            min-height: 680px;
        }

        /* Rich Dessert Visual Split-Screen */
        .auth-visual {
            flex: 1 1 450px;
            background: linear-gradient(135deg, #4c0519 0%, #881337 50%, #2e0814 100%);
            padding: 50px;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            border-right: 4px solid #d4af37;
        }

        /* Decorative Background Overlay Pattern */
        .auth-visual::before {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: radial-gradient(circle at 80% 20%, rgba(244, 63, 94, 0.15) 0%, transparent 50%);
            pointer-events: none;
        }

        .auth-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            color: #ffffff;
            font-family: 'Playfair Display', serif;
            font-size: 1.4rem;
            font-weight: 700;
            z-index: 2;
        }

        .auth-brand img {
            height: 42px;
            width: auto;
            object-fit: contain;
        }

        .auth-visual h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 2.5rem;
            line-height: 1.2;
            margin-top: 10px;
            margin-bottom: 15px;
            color: #ffffff;
        }

        .auth-visual .section-kicker.light {
            color: #f43f5e;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 2px;
            font-weight: 600;
        }

        .auth-visual p {
            color: #fda4af;
            font-size: 1.05rem;
            margin-bottom: 0;
            line-height: 1.6;
        }

        /* Clean Functional Form Wrap */
        .auth-form-wrap {
            flex: 1 2 550px;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: #ffffff;
        }

        .auth-form-wrap h2 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #2e0814;
            font-size: 2rem;
            margin-bottom: 4px;
        }

        .form-subtitle {
            color: #706561;
            font-size: 0.95rem;
            margin-bottom: 30px;
        }

        /* Premium Form Controls */
        .auth-form-wrap label {
            font-size: 0.82rem;
            font-weight: 600;
            color: #574e4a;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
            display: block;
        }

        .auth-form-wrap .form-control {
            border: 1px solid #eee9e6;
            background-color: #fdfbfb;
            border-radius: 12px;
            padding: 12px 16px;
            color: #3f3a36;
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }

        .auth-form-wrap .form-control:focus {
            background-color: #ffffff;
            border-color: #be123c;
            box-shadow: 0 0 0 4px rgba(190, 18, 60, 0.08);
            outline: 0;
        }

        /* Action Controls & Navigation Links */
        .btn-brand {
            background: linear-gradient(135deg, #e11d48 0%, #be123c 100%) !important;
            color: #ffffff !important;
            border: none !important;
            font-weight: 600;
            padding: 14px;
            border-radius: 12px;
            transition: all 0.25s ease !important;
            box-shadow: 0 4px 15px rgba(225, 29, 72, 0.2);
            font-size: 1rem;
        }

        .btn-brand:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(225, 29, 72, 0.35);
            filter: brightness(1.1);
        }

        .auth-switch {
            text-align: center;
            color: #706561;
            font-size: 0.95rem;
        }

        .auth-switch a {
            color: #be123c;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .auth-switch a:hover {
            color: #e11d48;
            text-decoration: underline;
        }

        /* Alert Customizations */
        .alert-danger {
            background-color: #fef2f2;
            border-color: #fee2e2;
            color: #991b1b;
            border-radius: 14px;
            padding: 14px 20px;
            font-size: 0.95rem;
            margin-bottom: 25px;
        }

        /* Responsive Breakpoint Adaptability */
        @media (max-width: 768px) {
            .auth-visual {
                padding: 40px 30px;
                min-height: 250px;
                border-right: none;
                border-bottom: 4px solid #d4af37;
            }
            .auth-form-wrap {
                padding: 40px 30px;
            }
        }
    </style>
</head>
<body class="auth-body">

    <main class="auth-shell">
        <section class="auth-panel register-panel">

            <!-- LEFT BRAND PANEL -->
            <div class="auth-visual">
                <a href="${pageContext.request.contextPath}/index.jsp" class="auth-brand">
                    <img src="${pageContext.request.contextPath}/assets/logo.jpeg" alt="logo">
                    <span>Mr.Snowman</span>
                </a>
                
                <div>
                    <span class="section-kicker light">Create account</span>
                    <h1>Join the sweetest ordering experience.</h1>
                    <p>Create your account for faster ordering and smoother dessert deliveries.</p>
                </div>
            </div>

            <!-- RIGHT REGISTRATION FORM PANEL -->
            <div class="auth-form-wrap">
                
                <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
                %>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        <div><%= error %></div>
                    </div>
                <%
                }
                %>

                <form id="registerForm"
                      class="needs-validation app-form"
                      action="${pageContext.request.contextPath}/customer/register"
                      method="post"
                      novalidate>

                    <h2>Create Account</h2>
                    <p class="form-subtitle">Save details for faster dessert ordering.</p>

                    <div class="row g-3">
                        <div class="col-12">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" placeholder="E.g., Jane Doe" required>
                        </div>

                        <div class="col-md-6">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="name@example.com" required>
                        </div>

                        <div class="col-md-6">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" class="form-control" placeholder="E.g., +1 555-0199" required>
                        </div>

                        <div class="col-12">
                            <label for="address">Delivery Address</label>
                            <input type="text" id="address" name="address" class="form-control" placeholder="Street name, City, Postal Code" required>
                        </div>

                        <div class="col-md-6">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="form-control" minlength="6" placeholder="Min. 6 characters" required>
                        </div>

                        <div class="col-md-6">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" minlength="6" placeholder="Repeat password" required>
                        </div>
                    </div>

                    <button class="btn btn-brand w-100 mt-4" type="submit">
                        Create Account
                    </button>

                    <p class="auth-switch mt-4 mb-0">
                        Already registered? 
                        <a href="${pageContext.request.contextPath}/login.jsp">Login here</a>
                    </p>
                </form>

            </div>
        </section>
    </main>

    <!-- Bootstrap 5.3.3 Core Runtime -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core UI Client Validation Handlers -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>