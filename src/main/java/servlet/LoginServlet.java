
package servlet;

import dao.CustomerDAO;
import entity.Customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/customer/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // 1. Check for Admin Login first
        if (email != null && password != null
                && "admin@gmail.com".equalsIgnoreCase(email.trim())
                && "admin123".equals(password.trim())) {

            HttpSession session = req.getSession(true);

            session.setAttribute("admin", email.trim());

            // Redirect admin to the dashboard
            resp.sendRedirect(
                    req.getContextPath() + "/admin/dashboard");
            return;
        }

        // 2. Otherwise, check Customer Login
        CustomerDAO dao = new CustomerDAO();

        Customer customer = dao.findByEmailAndPassword(
                email,
                password
        );

        if (customer != null) {

            HttpSession session = req.getSession(true);

            session.setAttribute(
                    "userEmail",
                    customer.getEmail()
            );

            session.setAttribute(
                    "userName",
                    customer.getFullName()
            );

            session.setAttribute(
                    "customerId",
                    customer.getId()
            );

            // Redirect customer to the home page
            resp.sendRedirect(
                    req.getContextPath() + "/index.jsp"
            );

        } else {

            req.setAttribute(
                    "error",
                    "Invalid email or password!"
            );

            req.getRequestDispatcher("/login.jsp")
                    .forward(req, resp);
        }
    }
}