package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("adminEmail");
        String password = request.getParameter("adminPassword");
        System.out.println(">>> ADMIN LOGIN SERVLET CALLED <<<");

        if (email != null) {
            email = email.trim();
        }

        if (password != null) {
            password = password.trim();
        }

        // Debugging
        System.out.println("Email received: [" + email + "]");
        System.out.println("Password matches: " + "admin123".equals(password));
        if ("admin@gmail.com".equalsIgnoreCase(email)
                && "admin123".equals(password)) {

            System.out.println("Login Successful");

            request.getSession().setAttribute("admin", email);

            response.sendRedirect(
                    request.getContextPath() + "/admin/dashboard");

        } else {

            System.out.println("Login Failed");

            request.setAttribute("error", "Invalid Admin Credentials");

            request.getRequestDispatcher("/admin/adminLogin.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/adminLogin.jsp")
               .forward(request, response);
    }
}