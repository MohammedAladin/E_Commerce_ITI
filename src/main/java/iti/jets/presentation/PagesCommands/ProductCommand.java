package iti.jets.presentation.PagesCommands;



//import com.google.gson.Gson;
//import com.google.gson.Gson;
import com.google.gson.Gson;
import iti.jets.business.Dtos.ProductDtoYousif;
import iti.jets.business.ProductService;
import iti.jets.presentation.FrontCommand;
import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.ServletException;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class ProductCommand extends FrontCommand {


    ProductService productService = new ProductService();
    @Override
    public void doPostProcess() throws ServletException, IOException {
        System.out.println("ProductCommand.doPostProcess()");
        System.out.println("hello"+request.getParameter("pageNumber"));

        int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        System.out.println("pageNumber ="+pageNumber);
        List<ProductDtoYousif> productDtoYousifs = productService.retrieveProductsPerPage(pageNumber);
        List<String> productsJson = new ArrayList<>();
        System.out.println("productDtoYousifs size = "+ productDtoYousifs.size());
        for(ProductDtoYousif dto: productDtoYousifs){
            System.out.println(dto.getId());
            productsJson.add(productToJson(dto));
        }
//        Gson gson = new Gson();
//        System.out.println(gson);
//        String json = gson.toJson(productDtoYousifs);
//        System.out.println(json);
//        response.setContentType("text/html");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        System.out.println("before sending json");
        out.print(productsJson);
        out.flush();
    }


    private String productToJson( ProductDtoYousif productDtoYousif) {
        System.out.println("inside productToJson function");
        JsonObjectBuilder jsonObjectBuilder = Json.createObjectBuilder();
        System.out.println("inside productToJson function2");
        jsonObjectBuilder.add( "productId", productDtoYousif.getId() )

                .add("productName", productDtoYousif.getProductName())
                .add("productDescription", productDtoYousif.getProductDescription())
                // Assuming productImage is converted to Base64 for JSON
                .add("productImage", Base64.getEncoder().encodeToString(productDtoYousif.getProductImage()))
                .add("price", productDtoYousif.getPrice())
                .add("stockCount", productDtoYousif.getStockCount())
                .add("category", productDtoYousif.getCategory().getCategoryName());
        System.out.println("inside productToJson function3");
        return jsonObjectBuilder.build().toString();
    }
    public static <T> T convertFromJson(String jsonString, Class<T> classOfT) {
        Gson gson = new Gson();
        return gson.fromJson(jsonString, classOfT);
    }
    public static <T> String convertToJson(T object) {
        Gson gson = new Gson();
        return gson.toJson(object);
    }
        @Override
    public void doGetProcess() throws ServletException, IOException {
            System.out.println("ProductCommand.doGetProcess()");
            System.out.println("hello"+request.getParameter("pageNumber"));

            int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            System.out.println("pageNumber ="+pageNumber);
            List<ProductDtoYousif> productDtoYousifs = productService.retrieveProductsPerPage(pageNumber);
            List<String> productsJson = new ArrayList<>();
            System.out.println("productDtoYousifs size = "+ productDtoYousifs.size());
            for(ProductDtoYousif dto: productDtoYousifs){
                System.out.println(dto.getId());
                productsJson.add(productToJson(dto));
            }
//        Gson gson = new Gson();
//        System.out.println(gson);
//        String json = gson.toJson(productDtoYousifs);
//        System.out.println(json);
//        response.setContentType("text/html");
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            System.out.println("before sending json");
            out.print(productsJson);
            out.flush();
//        forward("/shop.jsp");
//        String email = request.getParameter("email");
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        System.out.println("before sending email");
//        out.println(email);
    }

}

