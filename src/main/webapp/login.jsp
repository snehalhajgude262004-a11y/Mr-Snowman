<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Mr.Snowman</title>

    <!-- Bootstrap 5.3.3 Core -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Premium Typography Pipeline -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,600;0,700;1,400&display=swap" rel="stylesheet">

    <!-- Global Base Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <!-- Vibrant Cafe Overrides & Split-Panel System Styling -->
    <style>
        body.auth-body {
            background: radial-gradient(circle at 10% 20%, #fef2f2 0%, #f5ece9 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* Modern Premium Container Frame */
        .auth-shell {
            width: 100%;
            max-width: 1050px;
            background: #ffffff;
            border-radius: 30px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(76, 5, 25, 0.08);
            border: 1px solid rgba(136, 19, 55, 0.05);
        }

        .auth-panel {
            display: flex;
            flex-direction: row;
            min-height: 620px;
        }

        @media (max-width: 991px) {
            .auth-panel { flex-direction: column; }
            .auth-visual { padding: 40px !important; min-height: auto !important; }
        }

        /* Rich Asymmetric Visual Left Panel */
        .auth-visual {
            flex: 1;
            background: linear-gradient(135deg, #2e0814 0%, #4c0519 50%, #881337 100%);
            padding: 50px;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            border-right: 4px solid #d4af37;
        }

        /* Floating Interactive Brand Mark */
        .auth-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            color: #ffffff;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 1.4rem;
            transition: transform 0.3s ease;
        }
        
        .auth-brand:hover {
            transform: scale(1.02);
            color: #ffffff;
        }

        .auth-brand img {
            height: 42px;
            width: auto;
            object-fit: contain;
            filter: drop-shadow(0 4px 8px rgba(0,0,0,0.15));
        }

        .auth-visual h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 2.5rem;
            line-height: 1.2;
            color: #ffffff !important;
            margin-top: 20px;
            margin-bottom: 15px;
        }

        .section-kicker.light {
            color: #f43f5e !important;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 2px;
            font-weight: 600;
        }

        .auth-visual p {
            color: #fda4af;
            font-size: 1rem;
            max-width: 380px;
            margin: 0;
            line-height: 1.6;
        }

        /* Clean High-Contrast Login Input Form Block */
        .auth-form-wrap {
            flex: 1.1;
            padding: 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: #ffffff;
        }

        @media (max-width: 576px) {
            .auth-form-wrap { padding: 35px 25px; }
        }

        .auth-form-wrap h2 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #4c0519 !important;
            font-size: 2.2rem;
            margin-bottom: 6px;
        }

        .form-subtitle {
            color: #8c827e;
            font-size: 0.95rem;
            margin-bottom: 35px;
        }

        /* Luxurious Input Group Infrastructure */
        .form-label {
            font-weight: 500;
            color: #574e4a;
            font-size: 0.88rem;
            margin-bottom: 8px;
        }

        .input-group {
            border-radius: 12px;
            overflow: hidden;
            border: 2px solid #eee9e6;
            transition: all 0.25s ease;
            background-color: #faf8f7;
        }

        .input-group-text {
            background: transparent;
            border: none;
            color: #a19590;
            padding-left: 18px;
            font-size: 1.1rem;
        }

        .input-group .form-control {
            border: none !important;
            background: transparent !important;
            padding: 12px 16px 12px 8px !important;
            font-size: 0.95rem;
            color: #2e0814;
        }

        .input-group .form-control:focus {
            box-shadow: none !important;
        }

        /* Container highlights on core field focus events */
        .input-group:focus-within {
            border-color: #be123c;
            background-color: #ffffff;
            box-shadow: 0 0 0 4px rgba(190, 18, 60, 0.1);
        }

        /* High-Energy Action Button */
        .btn-brand {
            background: linear-gradient(135deg, #e11d48 0%, #be123c 100%) !important;
            color: #ffffff !important;
            border: none !important;
            font-weight: 600;
            letter-spacing: 0.5px;
            padding: 14px;
            border-radius: 12px;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1) !important;
            box-shadow: 0 5px 15px rgba(225, 29, 72, 0.25);
        }

        .btn-brand:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 22px rgba(225, 29, 72, 0.4);
            filter: brightness(1.1);
        }

        /* Secondary Navigation Link Mappings */
        .auth-switch {
            text-align: center;
            font-size: 0.9rem;
            color: #706561;
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
    </style>
</head>

<body class="auth-body">

    <main class="auth-shell">
        <section class="auth-panel">

            <!-- LEFT BRAND PANEL -->
            <div class="auth-visual">
                <a href="${pageContext.request.contextPath}/index.jsp" class="auth-brand">
                    <img src="${pageContext.request.contextPath}/assets/logo.jpeg" alt=" logo">
                    <span>Mr.Snowman</span>
                </a>

                <div class="mt-5 mt-lg-0">
                    <span class="section-kicker light">Customer Login</span>
                    <h1>Welcome back to your dessert table.</h1>
                    <p>Sign in to continue your dessert order and save your favourite treats.</p>
                </div>
            </div>

            <!-- RIGHT FORM PANEL -->
            <div class="auth-form-wrap">

                <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
                %>
                <div class="alert alert-danger mb-4 rounded-3"><%= error %></div>
                <%
                }
                %>

                <form id="loginForm" class="needs-validation app-form" action="${pageContext.request.contextPath}/customer/login" method="post" novalidate>
                    <h2>Login</h2>
                    <p class="form-subtitle">Access your account and continue ordering.</p>

                    <!-- EMAIL INPUT MODULE -->
                    <div class="mb-4">
                        <label class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-envelope"></i>
                            </span>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                    </div>

                    <!-- PASSWORD INPUT MODULE -->
                    <div class="mb-4">
                        <label class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-lock"></i>
                            </span>
                            <input type="password" class="form-control" name="password" minlength="6" required>
                        </div>
                    </div>

                    <button class="btn btn-brand w-100 mt-2 py-3" type="submit">
                        Login to Account
                    </button>

                    <p class="auth-switch mt-4 mb-0">
                        New here? 
                        <a href="${pageContext.request.contextPath}/register.jsp">
                            Create an account
                        </a>
                    </p>
                </form>

            </div>

        </section>
    </main>

    <!-- Bootstrap Engine Runtime Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core Application Logic Router Mapping -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>