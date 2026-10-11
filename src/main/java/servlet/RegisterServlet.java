package servlet;

import dao.CustomerDAO;
import entity.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/customer/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (password == null || !password.equals(confirmPassword)) {
            req.setAttribute("error", "Passwords do not match");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        CustomerDAO dao = new CustomerDAO();
        if (dao.findByEmail(email) != null) {
            req.setAttribute("error", "An account already exists with this email.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        Customer customer = new Customer(fullName, email, phone, address, password);
        boolean inserted = dao.registerCustomer(customer);

        if (inserted) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            req.setAttribute("error", "Registration failed. Please try again.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}
