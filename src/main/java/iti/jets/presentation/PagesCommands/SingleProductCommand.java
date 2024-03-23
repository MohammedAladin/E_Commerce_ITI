package iti.jets.presentation.PagesCommands;

import iti.jets.business.Dtos.ProductDtoYousif;
import iti.jets.business.ProductService;
import iti.jets.presentation.FrontCommand;
import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;

public class SingleProductCommand extends FrontCommand {

    ProductService productService = new ProductService();
    @Override
    public void doPostProcess() throws ServletException, IOException {

    }

    @Override
    public void doGetProcess() throws ServletException, IOException {

        System.out.println("SingleProductCommand.doGetProcess()");
        System.out.println("hello my product id is "+request.getParameter("productId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDtoYousif productDtoYousif = productService.retrieveProductById(productId);
        String productJson = productToJson(productDtoYousif);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        System.out.println("before sending json");
        out.print(productJson);
        out.flush();
        System.out.println("after sending json");
    }
        private String productToJson( ProductDtoYousif productDtoYousif) {
            JsonObjectBuilder jsonObjectBuilder = Json.createObjectBuilder();
            jsonObjectBuilder.add( "productId", productDtoYousif.getId() )
            .add("productName", productDtoYousif.getProductName())
            .add("productDescription", productDtoYousif.getProductDescription())
            // Assuming productImage is converted to Base64 for JSON
            .add("productImage", Base64.getEncoder().encodeToString(productDtoYousif.getProductImage()))
            .add("price", productDtoYousif.getPrice())
            .add("stockCount", productDtoYousif.getStockCount())
            .add("category", productDtoYousif.getCategory().getCategoryName());
            return jsonObjectBuilder.build().toString();
        }
}
