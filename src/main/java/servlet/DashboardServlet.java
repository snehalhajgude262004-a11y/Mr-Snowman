package servlet;

import dao.CustomerDAO;
import dao.FoodDAO;
import dao.OrderDAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.math.BigDecimal;

@WebServlet("/admin/dashboard")
public class DashboardServlet extends HttpServlet {

    private CustomerDAO customerDAO = new CustomerDAO();
    private FoodDAO foodDAO = new FoodDAO();
    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("users", customerDAO.count());
        request.setAttribute("foods", foodDAO.count());
        request.setAttribute("orders", orderDAO.count());

        BigDecimal revenue = orderDAO.getTotalRevenue();
        request.setAttribute("revenue", revenue);

        request.getRequestDispatcher("/admin/dashboard.jsp")
               .forward(request, response);
    }
}