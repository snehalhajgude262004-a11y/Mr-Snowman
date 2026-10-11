(() => {
    const CART_KEY = "berrycoCart";
    const money = (value) => "Rs. " + Number(value || 0).toFixed(0);

    const readCart = () => {
        try {
            return JSON.parse(localStorage.getItem(CART_KEY)) || [];
        } catch (error) {
            return [];
        }
    };

    const writeCart = (cart) => {
        localStorage.setItem(CART_KEY, JSON.stringify(cart));
        updateCartCount();
    };

    const cartTotals = (cart) => cart.reduce((totals, item) => {
        totals.quantity += Number(item.quantity || 0);
        totals.price += Number(item.price || 0) * Number(item.quantity || 0);
        return totals;
    }, { quantity: 0, price: 0 });

    const updateCartCount = () => {
        const total = cartTotals(readCart()).quantity;
        document.querySelectorAll("#cartCount, .nav-cart-count").forEach((el) => {
            el.textContent = total;
        });
    };

    const showToast = () => {
        const toastEl = document.getElementById("cartToast");
        if (toastEl && window.bootstrap) {
            bootstrap.Toast.getOrCreateInstance(toastEl).show();
        }
    };

    const addToCart = (button) => {
        const cart = readCart();
        const id = button.dataset.id;
        const existing = cart.find((item) => item.id === id);

        if (existing) {
            existing.quantity += 1;
        } else {
            cart.push({
                id,
                name: button.dataset.name,
                price: Number(button.dataset.price || 0),
                image: button.dataset.image || "",
                category: button.dataset.category || "",
                quantity: 1
            });
        }

        writeCart(cart);
        showToast();
    };

    const renderCartPage = () => {
        const cartItems = document.getElementById("cartItems");
        if (!cartItems) return;

        const emptyCart = document.getElementById("emptyCart");
        const checkoutButton = document.getElementById("checkoutButton");
        const cart = readCart();

        cartItems.innerHTML = "";
        if (cart.length === 0) {
            if (emptyCart) emptyCart.classList.remove("d-none");
            if (checkoutButton) checkoutButton.classList.add("disabled");
        } else {
            if (emptyCart) emptyCart.classList.add("d-none");
            if (checkoutButton) checkoutButton.classList.remove("disabled");
        }

        cart.forEach((item) => {
            const row = document.createElement("article");
            row.className = "cart-item";
            row.innerHTML = '<img src="' + item.image + '" alt="' + item.name + '">' +
                '<div class="cart-item-main"><h3>' + item.name + '</h3><p>' + item.category + '</p><strong>' + money(item.price) + '</strong></div>' +
                '<div class="cart-item-actions">' +
                '<button type="button" class="btn btn-outline-dark btn-sm" data-cart-action="decrease" data-id="' + item.id + '">-</button>' +
                '<span>' + item.quantity + '</span>' +
                '<button type="button" class="btn btn-outline-dark btn-sm" data-cart-action="increase" data-id="' + item.id + '">+</button>' +
                '<button type="button" class="btn btn-link text-danger" data-cart-action="remove" data-id="' + item.id + '">Remove</button>' +
                '</div>';
            cartItems.appendChild(row);
        });

        const totals = cartTotals(cart);
        const qty = document.getElementById("cartTotalQty");
        const price = document.getElementById("cartTotalPrice");
        if (qty) qty.textContent = totals.quantity;
        if (price) price.textContent = money(totals.price);
    };

    const changeCartItem = (id, action) => {
        let cart = readCart();
        const item = cart.find((entry) => entry.id === id);
        if (!item) return;

        if (action === "increase") item.quantity += 1;
        if (action === "decrease") item.quantity -= 1;
        if (action === "remove" || item.quantity <= 0) {
            cart = cart.filter((entry) => entry.id !== id);
        }

        writeCart(cart);
        renderCartPage();
        renderCheckoutPage();
    };

    const renderCheckoutPage = () => {
        const checkoutItems = document.getElementById("checkoutItems");
        if (!checkoutItems) return;

        const cart = readCart();
        checkoutItems.innerHTML = "";

        cart.forEach((item) => {
            const row = document.createElement("div");
            row.className = "summary-row";
            row.innerHTML = '<span>' + item.name + ' x ' + item.quantity + '</span><strong>' + money(item.price * item.quantity) + '</strong>';
            checkoutItems.appendChild(row);
        });

        const totals = cartTotals(cart);
        const qty = document.getElementById("checkoutTotalQty");
        const price = document.getElementById("checkoutTotalPrice");
        if (qty) qty.textContent = totals.quantity;
        if (price) price.textContent = money(totals.price);
    };

    const attachCheckoutSubmit = () => {
        const form = document.getElementById("checkoutForm");
        if (!form) return;

        form.addEventListener("submit", (event) => {
            const cart = readCart();
            form.querySelectorAll(".cart-submit-field").forEach((field) => field.remove());

            if (cart.length === 0) {
                event.preventDefault();
                window.location.href = "cart.jsp";
                return;
            }

            cart.forEach((item) => {
                const fields = {
                    itemId: item.id,
                    itemName: item.name,
                    itemCategory: item.category,
                    itemPrice: item.price,
                    itemQuantity: item.quantity
                };

                Object.entries(fields).forEach(([name, value]) => {
                    const input = document.createElement("input");
                    input.type = "hidden";
                    input.name = name;
                    input.value = value;
                    input.className = "cart-submit-field";
                    form.appendChild(input);
                });
            });
            
            // Clear cart from local storage on successful submission
            setTimeout(() => {
                writeCart([]);
            }, 100);
        });
    };

    const attachFilters = () => {
        document.querySelectorAll(".btn-filter").forEach((button) => {
            button.addEventListener("click", () => {
                document.querySelectorAll(".btn-filter").forEach((btn) => btn.classList.remove("active"));
                button.classList.add("active");
                const filter = button.dataset.filter;
                document.querySelectorAll(".menu-item").forEach((item) => {
                    item.style.display = filter === "all" || item.dataset.category.toLowerCase().replace(" ", "") === filter ? "" : "none";
                });
            });
        });
    };

    document.addEventListener("click", (event) => {
        const addButton = event.target.closest(".add-to-cart");
        if (addButton) addToCart(addButton);

        const cartAction = event.target.closest("[data-cart-action]");
        if (cartAction) changeCartItem(cartAction.dataset.id, cartAction.dataset.cartAction);

        if (event.target.closest("#clearCartButton")) {
            writeCart([]);
            renderCartPage();
        }
    });

    document.addEventListener("DOMContentLoaded", () => {
        updateCartCount();
        renderCartPage();
        renderCheckoutPage();
        attachCheckoutSubmit();
        attachFilters();
    });
})();
