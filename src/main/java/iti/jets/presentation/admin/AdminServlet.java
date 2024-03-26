package iti.jets.presentation.admin;

import com.google.gson.Gson;
import iti.jets.Services.AdminService;
import iti.jets.business.Dtos.CustomerDto;
import iti.jets.business.Dtos.CustomerOrderDto;
import iti.jets.business.Dtos.ProductData;
import iti.jets.business.Dtos.ProductDto;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.json.JsonObjectBuilder;
import jakarta.json.JsonReader;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("i'm in admin servlet");
        AdminService adminService = new AdminService();

        String type = req.getParameter("type");

        switch (type) {
            case "1" -> {
//            this mean get all product
                resp.setContentType("application/json");
                List<ProductData> allProduct = adminService.getAllProduct();
                List<String> jsonProducts = new ArrayList<>();
                allProduct.forEach(productData -> {
                    String productToJson = productToJson(productData);
                    jsonProducts.add(productToJson);
                });
                resp.getWriter().print(jsonProducts);
            }
            case "2" -> {
//            this means delete product
                int id = Integer.parseInt(req.getParameter("id"));
                System.out.println("item will delete " + id);
                boolean deleted = adminService.deleteProductById(id);
                resp.getWriter().print(deleted);
            }
            case "5" -> {
//            this means need categories
                List<String> allCategoryNames = adminService.getAllCategoryNames();
                Gson gson = new Gson();
                String jsonCategoryNames = gson.toJson(allCategoryNames);
                resp.setContentType("application/json");
                resp.getWriter().print(jsonCategoryNames);
            }
            case "6" -> {
//            this means need users
                System.out.println("users get");
                List<CustomerDto> allCustomers = adminService.getAllCustomers();
                Gson gson = new Gson();
                String jsonCustomers = gson.toJson(allCustomers);
                resp.setContentType("application/json");
                resp.getWriter().print(jsonCustomers);

            }
            case "7" -> {
//            this means need all orders
                System.out.println("hereee");
                List<CustomerOrderDto> allOrders = adminService.getAllOrders();
                System.out.println("heree2");
                Gson gson = new Gson();
                String jsonOrders = gson.toJson(allOrders);
                System.out.println(jsonOrders);
                resp.setContentType("application/json");
                resp.getWriter().print(jsonOrders);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String type = req.getParameter("type");
        if (type.equals("3")){
//            this means create product
            String product = getBody(req);
            ProductData newProduct = jsonToProductData(product,"create");
            AdminService adminService = new AdminService();
            adminService.addProduct(newProduct);
        }else if(type.equals("4")){
//            this means update product
            String product = getBody(req);
            ProductData updatedProduct = jsonToProductData(product,"update");
            AdminService adminService = new AdminService();
            adminService.updateProduct(updatedProduct);
        }
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

    private String productToJson( ProductData productData) {
        JsonObjectBuilder jsonObjectBuilder = Json.createObjectBuilder();
        jsonObjectBuilder.add( "productId", productData.getId() )
                .add("productName", productData.getProductName())
                .add("productDescription", productData.getProductDescription())
                .add("productImage", Base64.getEncoder().encodeToString(productData.getProductImage()))
                .add("price", productData.getPrice())
                .add("stockCount", productData.getStockCount())
                .add("categoryName", productData.getCategoryName());
        return jsonObjectBuilder.build().toString();
    }

    public ProductData jsonToProductData(String json, String type) {
        try {
            JsonReader jsonReader = Json.createReader(new StringReader(json));
            JsonObject jsonObject = jsonReader.readObject();

            ProductData productData = new ProductData();

            if (type.equals("update")){
                if (!jsonObject.isNull("productId")) {
                    productData.setId(jsonObject.getInt("productId"));
                }
            }

            if (!jsonObject.isNull("productName")) {
                productData.setProductName(jsonObject.getString("productName"));
            }


            if (!jsonObject.isNull("productDescription")) {
                productData.setProductDescription(jsonObject.getString("productDescription"));
            }

            if (!jsonObject.isNull("productImage")) {
                String productImageBase64 = jsonObject.getString("productImage");
                productImageBase64 = productImageBase64.substring(productImageBase64.indexOf(",") + 1);
                productData.setProductImage(Base64.getDecoder().decode(productImageBase64));
            }

            if (!jsonObject.isNull("price")) {
                productData.setPrice(Double.parseDouble(jsonObject.getString("price")));
            }


            if (!jsonObject.isNull("stockCount")) {
                productData.setStockCount(Integer.parseInt(jsonObject.getString("stockCount")));
            }

            if (!jsonObject.isNull("categoryName")) {
                productData.setCategoryName(jsonObject.getString("categoryName"));
            }

            return productData;
        } catch (Exception e) {
            System.out.println("Error while converting JSON to ProductData: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
