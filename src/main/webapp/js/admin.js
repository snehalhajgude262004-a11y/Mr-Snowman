document.addEventListener("DOMContentLoaded", function () {
    setActiveMenu();
    setupLogout();
    setupForms();

    // Check which page we are on and load appropriate data
    const path = window.location.pathname;
    if (path.includes("dashboard.jsp")) {
        loadDashboardStats();
    } else if (path.includes("users.jsp")) {
        loadUsersTable();
    } else if (path.includes("orders.jsp")) {
        loadOrdersList();
    } else if (path.includes("foods.jsp")) {
        loadFoodsTable();
        setupFoodModal();
    }
});

/* ACTIVE SIDEBAR */
function setActiveMenu() {
    let page = window.location.pathname.split("/").pop();
    let links = document.querySelectorAll(".admin-nav a");
    links.forEach(function (link) {
        let href = link.getAttribute("href");
        if (href && href.includes(page)) {
            link.classList.add("active");
        } else {
            link.classList.remove("active");
        }
    });
}

/* ADMIN LOGOUT */
function setupLogout() {
    let logoutBtn = document.getElementById("adminLogout");
    if (!logoutBtn) return;
    logoutBtn.addEventListener("click", function (e) {
        e.preventDefault();
        let ok = confirm("Logout from Admin?");
        if (ok) {
            // Submit the logout form programmatically
            const form = logoutBtn.closest("form");
            if (form) {
                form.submit();
            } else {
                window.location.href = "../logout";
            }
        }
    });
}

/* API CALL HELPERS */
const API_BASE = "../admin/api";

function money(value) {
    return "Rs. " + Number(value || 0).toFixed(0);
}

/* DASHBOARD STATS */
function loadDashboardStats() {
    fetch(`${API_BASE}/stats`)
        .then(res => res.json())
        .then(data => {
            const usersEl = document.querySelector(".card h6:contains('Users') + h2, .card h6:nth-of-type(1) + h2");
            // Match based on text since indices might vary
            document.querySelectorAll(".card").forEach(card => {
                const title = card.querySelector("h6").textContent.trim();
                const valueEl = card.querySelector("h2");
                if (title === "Users") valueEl.textContent = data.users;
                if (title === "Orders") valueEl.textContent = data.orders;
                if (title === "Revenue") valueEl.textContent = money(data.revenue);
                if (title === "Foods") valueEl.textContent = data.foods;
            });
        })
        .catch(err => console.error("Error loading stats:", err));
}

// Custom polyfill for element text selection if querySelector fails
document.querySelectorAll(".card").forEach(card => {
    const title = card.querySelector("h6").textContent.trim();
});

/* USERS MANAGEMENT */
function loadUsersTable() {
    const tbody = document.getElementById("userTableBody");
    const countLabel = document.getElementById("userCountLabel");
    const emptyMsg = document.getElementById("emptyUsers");
    if (!tbody) return;

    fetch(`${API_BASE}/users`)
        .then(res => res.json())
        .then(users => {
            tbody.innerHTML = "";
            if (countLabel) countLabel.textContent = `${users.length} users`;

            if (users.length === 0) {
                if (emptyMsg) emptyMsg.classList.remove("d-none");
                return;
            } else {
                if (emptyMsg) emptyMsg.classList.add("d-none");
            }

            users.forEach(user => {
                const tr = document.createElement("tr");
                tr.innerHTML = `
                    <td><strong>${escapeHtml(user.fullName)}</strong></td>
                    <td>${escapeHtml(user.email)}</td>
                    <td>${escapeHtml(user.phone)}</td>
                    <td>${escapeHtml(user.address)}</td>
                    <td>Customer</td>
                    <td class="text-end">
                        <button class="btn btn-sm btn-outline-danger btn-delete-user" data-id="${user.id}">
                            <i class="bi bi-trash"></i> Delete
                        </button>
                    </td>
                `;
                tbody.appendChild(tr);
            });

            // Attach delete listeners
            tbody.querySelectorAll(".btn-delete-user").forEach(btn => {
                btn.addEventListener("click", function () {
                    if (confirm("Are you sure you want to delete this user?")) {
                        deleteUser(this.dataset.id);
                    }
                });
            });
        })
        .catch(err => console.error("Error loading users:", err));
}

function deleteUser(id) {
    fetch(`${API_BASE}/users?id=${id}`, { method: "DELETE" })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                loadUsersTable();
            } else {
                alert("Failed to delete user. The user may have existing orders.");
            }
        })
        .catch(err => console.error("Error deleting user:", err));
}

/* FOODS MANAGEMENT */
let foodsList = [];

function loadFoodsTable() {
    const tbody = document.getElementById("foodTableBody");
    const countLabel = document.getElementById("foodCountLabel");
    const emptyMsg = document.getElementById("emptyFoods");
    if (!tbody) return;

    fetch(`${API_BASE}/foods`)
        .then(res => res.json())
        .then(foods => {
            foodsList = foods;
            tbody.innerHTML = "";
            if (countLabel) countLabel.textContent = `${foods.length} items`;

            if (foods.length === 0) {
                if (emptyMsg) emptyMsg.classList.remove("d-none");
                return;
            } else {
                if (emptyMsg) emptyMsg.classList.add("d-none");
            }

            foods.forEach(food => {
                const tr = document.createElement("tr");
                tr.innerHTML = `
                    <td><img src="../${escapeHtml(food.imageUrl)}" class="img-thumbnail" style="width: 50px; height: 50px; object-fit: cover;"></td>
                    <td><strong>${escapeHtml(food.name)}</strong></td>
                    <td class="text-muted" style="max-width: 250px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${escapeHtml(food.description)}</td>
                    <td><span class="badge bg-secondary">${escapeHtml(food.category)}</span></td>
                    <td><strong>${money(food.price)}</strong></td>
                    <td class="text-end">
                        <button class="btn btn-sm btn-outline-dark btn-edit-food me-1" data-id="${food.id}">
                            <i class="bi bi-pencil"></i> Edit
                        </button>
                        <button class="btn btn-sm btn-outline-danger btn-delete-food" data-id="${food.id}">
                            <i class="bi bi-trash"></i>
                        </button>
                    </td>
                `;
                tbody.appendChild(tr);
            });

            // Attach edit listeners
            tbody.querySelectorAll(".btn-edit-food").forEach(btn => {
                btn.addEventListener("click", function () {
                    openEditFoodModal(this.dataset.id);
                });
            });

            // Attach delete listeners
            tbody.querySelectorAll(".btn-delete-food").forEach(btn => {
                btn.addEventListener("click", function () {
                    if (confirm("Are you sure you want to delete this food item?")) {
                        deleteFood(this.dataset.id);
                    }
                });
            });
        })
        .catch(err => console.error("Error loading foods:", err));
}

function deleteFood(id) {
    fetch(`${API_BASE}/foods?id=${id}`, { method: "DELETE" })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                loadFoodsTable();
            } else {
                alert("Failed to delete food item.");
            }
        })
        .catch(err => console.error("Error deleting food:", err));
}

function setupFoodModal() {
    const foodForm = document.getElementById("foodForm");
    const addBtn = document.querySelector(".btn-admin[data-bs-target='#foodModal']");
    if (!foodForm) return;

    if (addBtn) {
        addBtn.addEventListener("click", function () {
            document.getElementById("foodModalTitle").textContent = "Add Food Item";
            foodForm.reset();
            document.getElementById("foodId").value = "";
        });
    }
}

function openEditFoodModal(id) {
    const food = foodsList.find(f => f.id == id);
    if (!food) return;

    document.getElementById("foodModalTitle").textContent = "Edit Food Item";
    document.getElementById("foodId").value = food.id;
    document.getElementById("foodName").value = food.name;
    document.getElementById("foodDescription").value = food.description;
    document.getElementById("foodCategory").value = food.category;
    document.getElementById("foodPrice").value = food.price;
    document.getElementById("foodImage").value = food.imageUrl;

    const modalEl = document.getElementById("foodModal");
    if (modalEl && window.bootstrap) {
        const modal = bootstrap.Modal.getOrCreateInstance(modalEl);
        modal.show();
    }
}

/* ORDERS MANAGEMENT */
function loadOrdersList() {
    const container = document.getElementById("adminOrdersList");
    const countLabel = document.getElementById("adminOrderCountLabel");
    const emptyMsg = document.getElementById("emptyAdminOrders");
    if (!container) return;

    fetch(`${API_BASE}/orders`)
        .then(res => res.json())
        .then(orders => {
            container.innerHTML = "";
            if (countLabel) countLabel.textContent = `${orders.length} orders`;

            if (orders.length === 0) {
                if (emptyMsg) emptyMsg.classList.remove("d-none");
                return;
            } else {
                if (emptyMsg) emptyMsg.classList.add("d-none");
            }

            orders.forEach(order => {
                const card = document.createElement("article");
                card.className = "card mb-4 order-admin-card shadow-sm";
                
                // Formulate items table
                let itemsHtml = "";
                order.items.forEach(item => {
                    itemsHtml += `
                        <tr>
                            <td><strong>${escapeHtml(item.productName)}</strong> <span class="text-muted">(${escapeHtml(item.category)})</span></td>
                            <td>${item.quantity}</td>
                            <td>${money(item.unitPrice)}</td>
                            <td class="text-end"><strong>${money(item.lineTotal)}</strong></td>
                        </tr>
                    `;
                });

                // Set status selects class based on value
                let badgeClass = "bg-warning text-dark";
                if (order.status === "SHIPPED") badgeClass = "bg-info text-white";
                if (order.status === "DELIVERED" || order.status === "COMPLETED") badgeClass = "bg-success text-white";
                if (order.status === "CANCELLED") badgeClass = "bg-danger text-white";

                const formattedDate = order.createdAt ? order.createdAt.replace("T", " ").substring(0, 19) : "Date N/A";

                card.innerHTML = `
                    <div class="card-header d-flex justify-content-between align-items-center bg-light">
                        <div>
                            <span class="text-muted">Order Number:</span>
                            <strong class="text-brand fs-5">${escapeHtml(order.orderNumber)}</strong>
                            <span class="ms-3 text-muted">Placed: ${formattedDate}</span>
                        </div>
                        <div>
                            <span class="badge ${badgeClass} fs-6">${escapeHtml(order.status)}</span>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 border-end">
                                <h5>Customer Details</h5>
                                <p class="mb-1"><strong>Name:</strong> ${escapeHtml(order.customerName)}</p>
                                <p class="mb-1"><strong>Email:</strong> ${escapeHtml(order.customerEmail)}</p>
                                <p class="mb-1"><strong>Mobile:</strong> ${escapeHtml(order.customerMobile)}</p>
                                <p class="mb-1"><strong>City/State:</strong> ${escapeHtml(order.city)}, ${escapeHtml(order.state)}</p>
                                <p class="mb-0"><strong>Address:</strong> ${escapeHtml(order.deliveryAddress)} (Pincode: ${escapeHtml(order.pincode)})</p>
                            </div>
                            <div class="col-md-5 border-end">
                                <h5>Order Items</h5>
                                <table class="table table-sm table-borderless">
                                    <thead>
                                        <tr>
                                            <th>Item</th>
                                            <th>Qty</th>
                                            <th>Price</th>
                                            <th class="text-end">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${itemsHtml}
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-3 text-md-end d-flex flex-column justify-content-between">
                                <div>
                                    <h5 class="text-muted">Total Summary</h5>
                                    <p class="mb-1"><strong>Qty:</strong> ${order.totalQuantity} items</p>
                                    <h3 class="text-brand font-weight-bold">${money(order.totalAmount)}</h3>
                                </div>
                                <div class="mt-3">
                                    <label class="form-label text-start d-block text-muted">Update Status</label>
                                    <select class="form-select select-order-status mb-2" data-id="${order.id}">
                                        <option value="PLACED" ${order.status === "PLACED" ? "selected" : ""}>PLACED</option>
                                        <option value="SHIPPED" ${order.status === "SHIPPED" ? "selected" : ""}>SHIPPED</option>
                                        <option value="DELIVERED" ${order.status === "DELIVERED" ? "selected" : ""}>DELIVERED</option>
                                        <option value="CANCELLED" ${order.status === "CANCELLED" ? "selected" : ""}>CANCELLED</option>
                                    </select>
                                    <button class="btn btn-sm btn-outline-danger btn-delete-order w-100" data-id="${order.id}">
                                        <i class="bi bi-trash"></i> Delete Order
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                container.appendChild(card);
            });

            // Attach status change listeners
            container.querySelectorAll(".select-order-status").forEach(select => {
                select.addEventListener("change", function () {
                    updateOrderStatus(this.dataset.id, this.value);
                });
            });

            // Attach delete listeners
            container.querySelectorAll(".btn-delete-order").forEach(btn => {
                btn.addEventListener("click", function () {
                    if (confirm("Are you sure you want to delete this order?")) {
                        deleteOrder(this.dataset.id);
                    }
                });
            });
        })
        .catch(err => console.error("Error loading orders:", err));
}

function updateOrderStatus(id, status) {
    const params = new URLSearchParams();
    params.append("id", id);
    params.append("status", status);

    fetch(`${API_BASE}/orders/status`, {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: params
    })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                loadOrdersList();
            } else {
                alert("Failed to update status.");
            }
        })
        .catch(err => console.error("Error updating order status:", err));
}

function deleteOrder(id) {
    fetch(`${API_BASE}/orders?id=${id}`, { method: "DELETE" })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                loadOrdersList();
            } else {
                alert("Failed to delete order.");
            }
        })
        .catch(err => console.error("Error deleting order:", err));
}

/* GENERAL VALIDATIONS & UTILS */
function setupForms() {
    let forms = document.querySelectorAll(".needs-validation");
    Array.from(forms).forEach(function (form) {
        form.addEventListener("submit", function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add("was-validated");
        }, false);
    });
}

function escapeHtml(str) {
    if (!str) return "";
    return str.replace(/&/g, "&amp;")
              .replace(/</g, "&lt;")
              .replace(/>/g, "&gt;")
              .replace(/"/g, "&quot;")
              .replace(/'/g, "&#039;");
}