<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | Mr.Snowman</title>

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

    <!-- Vibrant Cafe Theme & Advanced Form Overrides -->
    <style>
        body {
            background: linear-gradient(180deg, #fdfbfb 0%, #f7f3f0 100%);
            font-family: 'Poppins', sans-serif;
            color: #3f3a36;
        }

        /* Vibrant Dessert Page Hero */
        .compact-hero {
            background: linear-gradient(135deg, #4c0519 0%, #881337 50%, #2e0814 100%);
            padding: 60px 0;
            color: #ffffff;
            border-bottom: 4px solid #d4af37;
            box-shadow: 0 10px 30px rgba(76, 5, 25, 0.15);
        }

        .compact-hero h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #ffffff;
        }

        .compact-hero .section-kicker {
            color: #f43f5e;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 2px;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 8px;
        }

        .compact-hero p {
            color: #fda4af;
            max-width: 600px;
            font-size: 1rem;
            margin: 0;
        }

        /* Luxurious Form Panel Sheets */
        .checkout-form, .summary-card {
            background: #ffffff;
            border: 1px solid rgba(136, 19, 55, 0.08);
            border-radius: 24px;
            padding: 35px;
            box-shadow: 0 15px 35px rgba(136, 19, 55, 0.03);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .checkout-form h2, .summary-card h2 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #4c0519;
            margin-bottom: 25px;
            position: relative;
        }

        /* Premium Form Control Aesthetics */
        .form-label {
            font-weight: 500;
            color: #574e4a;
            font-size: 0.88rem;
            margin-bottom: 6px;
        }

        .form-control {
            border: 2px solid #eee9e6 !important;
            border-radius: 12px !important;
            padding: 12px 16px !important;
            font-size: 0.95rem;
            color: #2e0814;
            background-color: #faf8f7;
            transition: all 0.25s ease !important;
        }

        .form-control:focus {
            background-color: #ffffff;
            border-color: #be123c !important;
            box-shadow: 0 0 0 4px rgba(190, 18, 60, 0.1) !important;
        }

        /* Card Details Payment Sub-Box */
        .payment-box {
            background: linear-gradient(145deg, #fffcfb 0%, #fdf6f4 100%);
            border: 1px dashed rgba(190, 18, 60, 0.2);
            border-radius: 18px;
            padding: 25px;
        }

        .payment-box h2 {
            font-size: 1.4rem;
            color: #881337;
        }

        /* Interactive Action Buttons */
        .btn-brand {
            background: linear-gradient(135deg, #e11d48 0%, #be123c 100%) !important;
            color: #ffffff !important;
            border: none !important;
            font-weight: 600;
            letter-spacing: 0.5px;
            padding: 14px 28px;
            border-radius: 14px;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1) !important;
            box-shadow: 0 5px 15px rgba(225, 29, 72, 0.3);
        }

        .btn-brand:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(225, 29, 72, 0.45);
            filter: brightness(1.1);
        }

        .btn-outline-dark {
            border: 2px solid #4c0519 !important;
            color: #4c0519 !important;
            background: transparent !important;
            font-weight: 500;
            border-radius: 12px;
            padding: 11px;
            transition: all 0.25s ease !important;
        }

        .btn-outline-dark:hover {
            background: #4c0519 !important;
            color: #ffffff !important;
            transform: translateY(-1px);
        }

        /* Order Summary Alignment */
        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 14px 0;
            border-bottom: 1px dashed #e2dcd8;
            font-size: 0.95rem;
        }

        .total-line {
            border-bottom: none;
            padding-top: 18px;
        }

        .total-line strong {
            color: #be123c;
            font-size: 1.3rem;
            font-weight: 700;
        }

        /* Stunning Success Modal Overhaul */
        .success-modal {
            border: none !important;
            border-radius: 28px !important;
            padding: 40px 30px !important;
            background: #ffffff !important;
            box-shadow: 0 25px 60px rgba(76, 5, 25, 0.25) !important;
        }

        .success-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #4ade80 0%, #16a34a 100%);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            margin: 0 auto 24px auto;
            box-shadow: 0 10px 20px rgba(22, 163, 74, 0.2);
            animation: scaleIn 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .order-id-box {
            background: #fef2f2;
            border: 1px solid #fee2e2;
            padding: 10px 20px;
            border-radius: 12px;
            color: #991b1b;
            font-weight: 500;
            display: inline-block;
            margin-top: 15px;
        }

        @keyframes scaleIn {
            0% { transform: scale(0); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }
    </style>
</head>

<body>

    <!-- HEADER -->
    <jsp:include page="/components/header.jsp"/>

    <main>
        <!-- HERO DESK -->
        <section class="page-hero compact-hero">
            <div class="container">
                <span class="section-kicker">Checkout</span>
                <h1>Confirm delivery and payment details.</h1>
                <p>Complete the form to place your order.</p>
            </div>
        </section>

        <!-- OPERATIONS PANEL -->
        <section class="py-5">
            <div class="container">
                <div class="row g-4">

                    <!-- CENTRAL FORM MODULE -->
                    <div class="col-lg-8">
                        <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                        %>
                        <div class="alert alert-danger mb-4 rounded-3"><%= error %></div>
                        <%
                        }
                        %>

                        <form id="checkoutForm" class="needs-validation app-form checkout-form" action="${pageContext.request.contextPath}/order/place" method="post" novalidate>
                            <input type="hidden" name="formAction" value="placeOrder">
                            <input type="hidden" id="checkoutCartPayload" name="cartPayload">

                            <h2>Delivery Details</h2>

                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Name</label>
                                    <input type="text" class="form-control" id="checkoutName" name="customerName" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Email</label>
                                    <input type="email" class="form-control" id="checkoutEmail" name="customerEmail" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Mobile</label>
                                    <input type="tel" class="form-control" id="checkoutMobile" name="customerMobile" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">City</label>
                                    <input type="text" class="form-control" id="checkoutCity" name="city" required>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Address</label>
                                    <textarea class="form-control" id="checkoutAddress" name="deliveryAddress" rows="3" required></textarea>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">State</label>
                                    <input type="text" class="form-control" id="checkoutState" name="state" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Pincode</label>
                                    <input type="text" class="form-control" id="checkoutPincode" name="pincode" maxlength="6" required>
                                </div>
                            </div>

                            <!-- CARD MANAGEMENT SUBSECTION -->
                            <div class="payment-box mt-5">
                                <h2>Card Details</h2>
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label class="form-label">Name on card</label>
                                        <input type="text" class="form-control" id="cardName" name="cardHolderName" required>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Card Number</label>
                                        <input type="text" class="form-control" id="cardNumber" name="cardNumber" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Expiry Date</label>
                                        <input type="text" class="form-control" id="cardExpiry" name="cardExpiry" placeholder="MM/YY" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">CVV</label>
                                        <input type="password" class="form-control" id="cardCvv" name="cardCvv" maxlength="3" required>
                                    </div>
                                </div>
                            </div>

                            <button class="btn btn-brand btn-lg w-100 mt-4 py-3" type="submit">
                                Place Order
                            </button>
                        </form>
                    </div>

                    <!-- FINANCIAL SIDEBAR SUMMARY -->
                    <div class="col-lg-4">
                        <aside class="summary-card sticky-lg-top checkout-summary" style="top: 30px;">
                            <h2 class="h4">Order Summary</h2>
                            
                            <!-- Dynamic target placeholder for main.js injections -->
                            <div id="checkoutItems" class="checkout-items my-3"></div>

                            <div class="summary-row">
                                <span>Total Quantity</span>
                                <strong id="checkoutTotalQty" class="text-dark">0</strong>
                            </div>

                            <div class="summary-row total-line mb-4">
                                <span>Total Price</span>
                                <strong id="checkoutTotalPrice">Rs. 0</strong>
                            </div>

                            <a href="${pageContext.request.contextPath}/cart.jsp" class="btn btn-outline-dark w-100">
                                Back to Cart
                            </a>
                        </aside>
                    </div>

                </div>
            </div>
        </section>
    </main>

    <!-- STATUS CONFIRMATION MODAL -->
    <div class="modal fade" id="orderSuccessModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content success-modal">
                <div class="modal-body text-center">
                    <div class="success-icon">
                        <i class="bi bi-check-lg"></i>
                    </div>
                    <h2 class="h3 mb-2">Order Placed Successfully!</h2>
                    <p class="text-muted">Your delicious Mr.Snowman order has been recorded.</p>
                    
                    <div class="order-id-box mb-2">
                        Order ID: <strong id="successOrderId">BCO-000000</strong>
                    </div>

                    <button type="button" id="successModalButton" class="btn btn-brand w-100 mt-4 py-2">
                        Continue to Menu
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <jsp:include page="/components/footer.jsp"/>

    <!-- Bootstrap Runtime Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Dynamic Logic Script Mappings -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>