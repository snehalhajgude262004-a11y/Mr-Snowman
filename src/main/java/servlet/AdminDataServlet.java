package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDAO;
import dao.FoodDAO;
import dao.OrderDAO;
import entity.Customer;
import entity.Food;
import entity.CustomerOrder;
import entity.OrderItem;

@WebServlet("/admin/api/*")
public class AdminDataServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CustomerDAO customerDAO = new CustomerDAO();
    private FoodDAO foodDAO = new FoodDAO();
    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Session security check
        if (req.getSession().getAttribute("admin") == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.setContentType("application/json");
            resp.getWriter().write("{\"error\": \"Unauthorized\"}");
            return;
        }
        super.service(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        if ("/stats".equals(pathInfo)) {
            long usersCount = customerDAO.count();
            long ordersCount = orderDAO.count();
            BigDecimal revenue = orderDAO.getTotalRevenue();
            long foodsCount = foodDAO.count();

            // Set attributes on context as well for dashboard fallback
            getServletContext().setAttribute("users", usersCount);
            getServletContext().setAttribute("orders", ordersCount);
            getServletContext().setAttribute("revenue", revenue);
            getServletContext().setAttribute("foods", foodsCount);

            out.print(String.format("{\"users\": %d, \"orders\": %d, \"revenue\": %.2f, \"foods\": %d}",
                    usersCount, ordersCount, revenue.doubleValue(), foodsCount));

        } else if ("/users".equals(pathInfo)) {
            List<Customer> customers = customerDAO.getAllCustomers();
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < customers.size(); i++) {
                Customer c = customers.get(i);
                json.append("{")
                    .append("\"id\": ").append(c.getId()).append(", ")
                    .append("\"fullName\": \"").append(escapeJson(c.getFullName())).append("\", ")
                    .append("\"email\": \"").append(escapeJson(c.getEmail())).append("\", ")
                    .append("\"phone\": \"").append(escapeJson(c.getPhone())).append("\", ")
                    .append("\"address\": \"").append(escapeJson(c.getAddress())).append("\"")
                    .append("}");
                if (i < customers.size() - 1) {
                    json.append(", ");
                }
            }
            json.append("]");
            out.print(json.toString());

        } else if ("/orders".equals(pathInfo)) {
            List<CustomerOrder> orders = orderDAO.getAllOrders();
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < orders.size(); i++) {
                CustomerOrder o = orders.get(i);
                json.append("{")
                    .append("\"id\": ").append(o.getId()).append(", ")
                    .append("\"orderNumber\": \"").append(escapeJson(o.getOrderNumber())).append("\", ")
                    .append("\"customerName\": \"").append(escapeJson(o.getCustomerName())).append("\", ")
                    .append("\"customerEmail\": \"").append(escapeJson(o.getCustomerEmail())).append("\", ")
                    .append("\"customerMobile\": \"").append(escapeJson(o.getCustomerMobile())).append("\", ")
                    .append("\"city\": \"").append(escapeJson(o.getCity())).append("\", ")
                    .append("\"state\": \"").append(escapeJson(o.getState())).append("\", ")
                    .append("\"pincode\": \"").append(escapeJson(o.getPincode())).append("\", ")
                    .append("\"deliveryAddress\": \"").append(escapeJson(o.getDeliveryAddress())).append("\", ")
                    .append("\"totalQuantity\": ").append(o.getTotalQuantity()).append(", ")
                    .append("\"totalAmount\": ").append(o.getTotalAmount()).append(", ")
                    .append("\"status\": \"").append(escapeJson(o.getStatus())).append("\", ")
                    .append("\"createdAt\": \"").append(o.getCreatedAt() != null ? o.getCreatedAt().toString() : "").append("\", ")
                    .append("\"items\": [");
                
                List<OrderItem> items = o.getItems();
                for (int j = 0; j < items.size(); j++) {
                    OrderItem item = items.get(j);
                    json.append("{")
                        .append("\"id\": ").append(item.getId()).append(", ")
                        .append("\"productCode\": \"").append(escapeJson(item.getProductCode())).append("\", ")
                        .append("\"productName\": \"").append(escapeJson(item.getProductName())).append("\", ")
                        .append("\"category\": \"").append(escapeJson(item.getCategory())).append("\", ")
                        .append("\"quantity\": ").append(item.getQuantity()).append(", ")
                        .append("\"unitPrice\": ").append(item.getUnitPrice()).append(", ")
                        .append("\"lineTotal\": ").append(item.getLineTotal())
                        .append("}");
                    if (j < items.size() - 1) {
                        json.append(", ");
                    }
                }
                json.append("]}");
                if (i < orders.size() - 1) {
                    json.append(", ");
                }
            }
            json.append("]");
            out.print(json.toString());

        } else if ("/foods".equals(pathInfo)) {
            List<Food> foods = foodDAO.getAll();
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < foods.size(); i++) {
                Food f = foods.get(i);
                json.append("{")
                    .append("\"id\": ").append(f.getId()).append(", ")
                    .append("\"name\": \"").append(escapeJson(f.getName())).append("\", ")
                    .append("\"description\": \"").append(escapeJson(f.getDescription())).append("\", ")
                    .append("\"category\": \"").append(escapeJson(f.getCategory())).append("\", ")
                    .append("\"price\": ").append(f.getPrice()).append(", ")
                    .append("\"imageUrl\": \"").append(escapeJson(f.getImageUrl())).append("\"")
                    .append("}");
                if (i < foods.size() - 1) {
                    json.append(", ");
                }
            }
            json.append("]");
            out.print(json.toString());
        }
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        if ("/orders/status".equals(pathInfo)) {
            try {
                int id = Integer.parseInt(req.getParameter("id"));
                String status = req.getParameter("status");
                boolean success = orderDAO.updateStatus(id, status);
                out.print("{\"success\": " + success + "}");
            } catch (Exception e) {
                out.print("{\"success\": false, \"error\": \"" + escapeJson(e.getMessage()) + "\"}");
            }

        } else if ("/foods/save".equals(pathInfo)) {
            try {
                String idStr = req.getParameter("foodId");
                String name = req.getParameter("foodName");
                String description = req.getParameter("description");
                String category = req.getParameter("category");
                BigDecimal price = new BigDecimal(req.getParameter("price"));
                String imageUrl = req.getParameter("imageUrl");

                Food food = new Food();
                if (idStr != null && !idStr.trim().isEmpty()) {
                    food.setId(Integer.parseInt(idStr));
                }
                food.setName(name);
                food.setDescription(description);
                food.setCategory(category);
                food.setPrice(price);
                food.setImageUrl(imageUrl);

                boolean success = foodDAO.save(food);
                if (success) {
                    // Redirect back to food management page after saving (fallback for HTML form submission)
                    resp.sendRedirect(req.getContextPath() + "/admin/foods.jsp");
                    return;
                } else {
                    out.print("{\"success\": false}");
                }
            } catch (Exception e) {
                out.print("{\"success\": false, \"error\": \"" + escapeJson(e.getMessage()) + "\"}");
            }
        }
        out.flush();
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        if ("/users".equals(pathInfo)) {
            try {
                int id = Integer.parseInt(req.getParameter("id"));
                boolean success = customerDAO.deleteCustomer(id);
                out.print("{\"success\": " + success + "}");
            } catch (Exception e) {
                out.print("{\"success\": false, \"error\": \"" + escapeJson(e.getMessage()) + "\"}");
            }

        } else if ("/foods".equals(pathInfo)) {
            try {
                int id = Integer.parseInt(req.getParameter("id"));
                boolean success = foodDAO.delete(id);
                out.print("{\"success\": " + success + "}");
            } catch (Exception e) {
                out.print("{\"success\": false, \"error\": \"" + escapeJson(e.getMessage()) + "\"}");
            }
        } else if ("/orders".equals(pathInfo)) {
            try {
                int id = Integer.parseInt(req.getParameter("id"));
                boolean success = orderDAO.deleteOrder(id);
                out.print("{\"success\": " + success + "}");
            } catch (Exception e) {
                out.print("{\"success\": false, \"error\": \"" + escapeJson(e.getMessage()) + "\"}");
            }
        }
        out.flush();
    }

    private String escapeJson(String str) {
        if (str == null) return "";
        return str.replace("\\", "\\\\")
                  .replace("\"", "\\\"")
                  .replace("\b", "\\b")
                  .replace("\f", "\\f")
                  .replace("\n", "\\n")
                  .replace("\r", "\\r")
                  .replace("\t", "\\t");
    }
}
