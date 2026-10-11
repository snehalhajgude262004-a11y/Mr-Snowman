package servlet;

import java.math.BigDecimal;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import dao.FoodDAO;
import entity.Food;

@WebListener
public class AppInitListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("The Snowman application started. Checking menu items...");
        FoodDAO foodDAO = new FoodDAO();
        try {
            if (foodDAO.count() == 0) {
                System.out.println("Menu is empty. Seeding default items...");
                
                // Waffles
                foodDAO.save(new Food("Chocolate Waffle", "Golden waffle topped with rich Belgian dark chocolate.", "Waffles", new BigDecimal("129"), "assets/waffle_choco.jpeg"));
                foodDAO.save(new Food("Loaded Waffle", "Crispy waffle topped with chocolate chips, fresh strawberries, and ice cream.", "Waffles", new BigDecimal("189"), "assets/menu_waffle.jpeg"));
                foodDAO.save(new Food("Double Choco Waffle", "Double layered crispy waffle finished with milk and white chocolate drizzle.", "Waffles", new BigDecimal("159"), "assets/waffledouble.jpeg"));

                // Ice Creams
                foodDAO.save(new Food("Classic Vanilla Scoop", "Smooth, creamy vanilla bean scoop ice cream.", "Ice Creams", new BigDecimal("99"), "assets/icecream2.jpeg"));
                foodDAO.save(new Food("Strawberry Scoop", "Rich strawberry milk ice cream crafted with real Mahabaleshwar berries.", "Ice Creams", new BigDecimal("109"), "assets/strawberry_icecream.jpg"));
                foodDAO.save(new Food("Muskmelon Scoop", "Unique fresh muskmelon flavoured ice cream scoop.", "Ice Creams", new BigDecimal("119"), "assets/muskmelon-icecream.jpg"));

                // Buckets
                foodDAO.save(new Food("Strawberry Bucket", "Family sharing bucket loaded with fresh strawberries, cream, and chocolate.", "Buckets", new BigDecimal("349"), "assets/straw_bucket.jpeg"));
                foodDAO.save(new Food("Double Chocolate Bucket", "Bucket packed with chocolate fudge scoop, brownies, and chocolate syrup.", "Buckets", new BigDecimal("379"), "assets/bucket.jpeg"));

                // Berry Treats
                foodDAO.save(new Food("Strawberry Chocolate", "Fresh handpicked strawberries covered in warm melted chocolate sauce.", "Berry Treats", new BigDecimal("169"), "assets/straw_chocolate.jpeg"));
                foodDAO.save(new Food("Fresh Strawberries & Cream", "Classic combination of sweet strawberries and fresh whipped cream.", "Berry Treats", new BigDecimal("149"), "assets/strawberry.jpeg"));
                
                System.out.println("Default menu items seeded successfully.");
            } else {
                System.out.println("Menu already contains items. Skipping seeding.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
    }
}
