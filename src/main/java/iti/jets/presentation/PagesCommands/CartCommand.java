package iti.jets.presentation.PagesCommands;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import iti.jets.business.CartService;
import iti.jets.business.Dtos.CartItemDto;
import iti.jets.business.entities.Customer;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.util.List;

public class CartCommand extends FrontCommand {

    CartService cartService;

    @Override
    public void init(HttpServletRequest servletRequest, HttpServletResponse servletResponse) throws ServletException, IOException {
        super.init(servletRequest, servletResponse);
        cartService = new CartService();
    }

    @Override
    public void doPostProcess() throws ServletException, IOException {


        String type = request.getParameter("type");
        System.out.println("in do post Cart and type : " + type);
        if (type.equals("2")) {
            String cartItemDtosJson = getBody(request);
            System.out.println("json from client :" + cartItemDtosJson);

            Gson gson = new Gson();
            Type listType = new TypeToken<List<CartItemDto>>() {
            }.getType();
            List<CartItemDto> cartItemDtos = gson.fromJson(cartItemDtosJson, listType);

            System.out.print("body : ");
            cartItemDtos.forEach(System.out::println);
            response.getWriter().print("cart updated");
            cartService.updateCartItems(cartItemDtos);
        }
    }

    @Override
    public void doGetProcess() throws ServletException, IOException {
        System.out.println("starting do get in Cart");
        String type = request.getParameter("type");

        response.setContentType("application/json");
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");


        if (customer != null) {
        System.out.println("customer :" + customer.getCustomerName());
            if (type.equals("1")) {
                List<CartItemDto> cartItemDtos = cartService.getCartItemsByCustomerId(customer.getId());
                String jsonDtos = convertToJson(cartItemDtos);
                System.out.println(jsonDtos);
                response.getWriter().print(jsonDtos);
            } else if (type.equals("3")) {
                int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
                System.out.println("you need to delete cartItem with id :" + cartItemId);
                cartService.deleteCartItem(cartItemId);
            }
        }else {
            System.out.println("customer is null");
        }

        System.out.println("finish do get in Cart");
    }

    public static <T> T convertFromJson(String jsonString, Class<T> classOfT) {
        Gson gson = new Gson();
        return gson.fromJson(jsonString, classOfT);
    }

    public static <T> String convertToJson(T object) {
        Gson gson = new Gson();
        return gson.toJson(object);
    }


    public String getBody(HttpServletRequest request) throws IOException {
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = null;

        try {
            InputStream inputStream = request.getInputStream();
            if (inputStream != null) {
                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                char[] charBuffer = new char[128];
                int bytesRead = -1;
                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
                    stringBuilder.append(charBuffer, 0, bytesRead);
                }
            } else {
                stringBuilder.append("");
            }
        } finally {
            if (bufferedReader != null) {
                bufferedReader.close();
            }
        }

        return stringBuilder.toString();
    }
}
