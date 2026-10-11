package servlet;

import dao.FoodDAO;
import entity.Food;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/food/save")
public class FoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FoodDAO foodDAO = new FoodDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Food food = new Food();

            food.setName(request.getParameter("foodName"));
            food.setDescription(request.getParameter("description"));
            food.setCategory(request.getParameter("category"));

            String price = request.getParameter("price");
            food.setPrice(new BigDecimal(price));

            food.setImageUrl(request.getParameter("imageUrl"));

            String id = request.getParameter("foodId");

            if (id != null && !id.trim().isEmpty()) {
                food.setId(Integer.parseInt(id));
            }

            foodDAO.save(food);

            response.sendRedirect(request.getContextPath() + "/admin/foods.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(request.getContextPath()
                    + "/admin/foods.jsp?error=true");
        }
    }
}