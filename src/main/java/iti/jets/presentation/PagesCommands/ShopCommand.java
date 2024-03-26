package iti.jets.presentation.PagesCommands;

import iti.jets.business.ProductService;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;

import java.io.IOException;

public class ShopCommand extends FrontCommand {


    ProductService productService = new ProductService();
    @Override
    public void doPostProcess() throws ServletException, IOException {
        System.out.println("ShopCommand.doPostProcess()");
        System.out.println(request.getRequestURI());

        /*
        List<ProductDtoYousif> productDtos = productService.retrieveProducts();
        Gson gson = new Gson();
        String json = gson.toJson(productDtos);
//        response.setContentType("text/html");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        System.out.println("before sending json");
        out.println(json);

         */
    }

    @Override
    public void doGetProcess() throws ServletException, IOException {
        System.out.println("ShopCommand.doGetProcess()");
        request.setAttribute("countOfPages", productService.getPagesCount());
        System.out.println("countOfPages" + productService.getPagesCount());
        forward("/shop.jsp");
//        String email = request.getParameter("email");
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        System.out.println("before sending email");
//        out.println(email);
    }
}
