package servlet;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import entity.CustomerOrder;
import entity.OrderItem;

@WebServlet("/order/place")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String[] itemIds =
                req.getParameterValues("itemId");

        String[] itemNames =
                req.getParameterValues("itemName");

        String[] itemCategories =
                req.getParameterValues("itemCategory");

        String[] itemPrices =
                req.getParameterValues("itemPrice");

        String[] itemQuantities =
                req.getParameterValues("itemQuantity");


        if (!hasValidItems(
                itemIds,
                itemNames,
                itemPrices,
                itemQuantities)) {

            req.setAttribute(
                    "error",
                    "Cart is empty"
            );

            req.getRequestDispatcher(
                    "/checkout.jsp"
            ).forward(
                    req,
                    resp
            );

            return;
        }


        CustomerOrder order =
                new CustomerOrder();


        order.setCustomerName(
                req.getParameter(
                        "customerName"
                )
        );


        String email =
                (String) req
                .getSession()
                .getAttribute(
                        "userEmail"
                );

        if (
                email == null
                ||
                email.isEmpty()
        ) {

            email =
                    req.getParameter(
                            "customerEmail"
                    );

        }

        order.setCustomerEmail(
                email
        );


        order.setCustomerMobile(
                req.getParameter(
                        "customerMobile"
                )
        );

        order.setCity(
                req.getParameter(
                        "city"
                )
        );

        order.setState(
                req.getParameter(
                        "state"
                )
        );

        order.setPincode(
                req.getParameter(
                        "pincode"
                )
        );

        order.setDeliveryAddress(
                req.getParameter(
                        "deliveryAddress"
                )
        );

        order.setCardHolderName(
                req.getParameter(
                        "cardHolderName"
                )
        );

        order.setCardLastFour(
                lastFour(
                        req.getParameter(
                                "cardNumber"
                        )
                )
        );

        order.setStatus(
                "PLACED"
        );


        int totalQty = 0;

        BigDecimal total =
                BigDecimal.ZERO;


        for (
                int i = 0;
                i < itemIds.length;
                i++
        ) {

            int quantity =
                    parseInt(
                            itemQuantities[i]
                    );

            BigDecimal price =
                    parsePrice(
                            itemPrices[i]
                    );

            BigDecimal lineTotal =
                    price.multiply(
                            BigDecimal.valueOf(
                                    quantity
                            )
                    );

            OrderItem item =
                    new OrderItem();

            item.setProductCode(
                    itemIds[i]
            );

            item.setProductName(
                    itemNames[i]
            );

            item.setCategory(
                    valueAt(
                            itemCategories,
                            i
                    )
            );

            item.setQuantity(
                    quantity
            );

            item.setUnitPrice(
                    price
            );

            item.setLineTotal(
                    lineTotal
            );

            order.addItem(
                    item
            );

            totalQty += quantity;

            total =
                    total.add(
                            lineTotal
                    );
        }


        order.setTotalQuantity(
                totalQty
        );

        order.setTotalAmount(
                total
        );


        boolean saved =
                new OrderDAO()
                .save(
                        order
                );


        if (saved) {

            req.getSession()
            .setAttribute(
                    "lastOrderNumber",
                    order.getOrderNumber()
            );

            resp.sendRedirect(
                    req.getContextPath()
                    + "/orders.jsp"
            );

        }

        else {

            req.setAttribute(
                    "error",
                    "Failed to place order"
            );

            req.getRequestDispatcher(
                    "/checkout.jsp"
            )
            .forward(
                    req,
                    resp
            );

        }

    }



    private boolean hasValidItems(
            String[] ids,
            String[] names,
            String[] prices,
            String[] qty) {

        return ids != null
                &&
                names != null
                &&
                prices != null
                &&
                qty != null
                &&
                ids.length > 0;
    }



    private String valueAt(
            String[] arr,
            int i) {

        if (
                arr == null
                ||
                i >= arr.length
        ) {
            return "";
        }

        return arr[i];
    }



    private int parseInt(
            String value) {

        try {

            return Integer.parseInt(
                    value
            );

        }

        catch (
                Exception e
        ) {

            return 1;

        }

    }



    private BigDecimal parsePrice(
            String value) {

        try {

            return new BigDecimal(
                    value
            );

        }

        catch (
                Exception e
        ) {

            return BigDecimal.ZERO;

        }

    }



    private String lastFour(
            String card) {

        if (
                card == null
        ) {

            return "0000";

        }

        String digits =
                card.replaceAll(
                        "\\D",
                        ""
                );

        if (
                digits.length()
                <= 4
        ) {

            return digits;

        }

        return digits.substring(
                digits.length()
                - 4
        );

    }

}