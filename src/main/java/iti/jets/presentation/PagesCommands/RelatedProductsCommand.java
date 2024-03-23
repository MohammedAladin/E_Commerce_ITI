package iti.jets.presentation.PagesCommands;

import iti.jets.business.Dtos.ProductDtoYousif;
import iti.jets.business.ProductService;
import iti.jets.presentation.FrontCommand;
import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class RelatedProductsCommand extends FrontCommand {

    ProductService productService = new ProductService();
    @Override
    public void doPostProcess() throws ServletException, IOException {

    }

    @Override
    public void doGetProcess() throws ServletException, IOException {
        System.out.println("RelatedProductsCommand.doGetProcess()");

        List<ProductDtoYousif> productDtoYousifs = productService.retrieveProductsForSingleProductsPage();
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
