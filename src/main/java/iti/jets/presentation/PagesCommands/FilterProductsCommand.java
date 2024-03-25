package iti.jets.presentation.PagesCommands;

import iti.jets.business.Dtos.ProductDtoYousif;
import iti.jets.business.ProductService;
import iti.jets.presentation.FrontCommand;
import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class FilterProductsCommand extends FrontCommand {

    ProductService productService = new ProductService();
    @Override
    public void doPostProcess() throws ServletException, IOException {

    }

    @Override
    public void doGetProcess() throws ServletException, IOException {
        System.out.println("inside FilterProductsCommand doGetProcess");
        // Extract parameters from the request
        BigDecimal minPrice = BigDecimal.valueOf(Integer.parseInt(request.getParameter("minPrice")));
        BigDecimal maxPrice = request.getParameter("maxPrice").equals("Infinity")? BigDecimal.valueOf(-1) : BigDecimal.valueOf(Integer.parseInt(request.getParameter("maxPrice")));
        String categories = request.getParameter("categories");
        int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

        // Print the extracted parameters
        System.out.println("Minimum Price: " + minPrice);
        System.out.println("Maximum Price: " + maxPrice);
        System.out.println("Categories: " + categories);
        System.out.println("Page Number: " + pageNumber);

        List<ProductDtoYousif> productDtoYousifs = productService.retrieveFilteredProducts(categories,minPrice,maxPrice,pageNumber,6);
        List<String> productsJson = new ArrayList<>();
        for(ProductDtoYousif productDtoYousif : productDtoYousifs){
            productsJson.add(productToJson(productDtoYousif));
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        System.out.println("before sending json");
        out.print(productsJson);
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
