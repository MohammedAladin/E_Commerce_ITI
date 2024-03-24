package iti.jets.presentation.PagesCommands;

import iti.jets.business.CartService;
import iti.jets.business.Dtos.ProductDtoYousif;
import iti.jets.business.Mappings.ProductMapping;
import iti.jets.business.ProductService;
import iti.jets.business.entities.Customer;
import iti.jets.business.entities.Product;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class AddFromShopCommand extends FrontCommand {

    ProductService productService = new ProductService();
    ProductMapping productMapping = new ProductMapping();

    CartService cartService = new CartService();
    @Override
    public void doPostProcess() throws ServletException, IOException {
        System.out.println("inside addFromShopCommand doPost");
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        PrintWriter out = response.getWriter();
        if(customer==null) {
            System.out.println("customer is null");
            out.print("not signed in");
        }
        else{
            System.out.println("customer has session");
            int productId= Integer.parseInt(request.getParameter("productId"));
            int quantity= Integer.parseInt(request.getParameter("quantity"));
            System.out.println("Product Id : " +productId+" quantity = "+quantity);
            ProductDtoYousif productDto = productService.retrieveProductById(productId);
            System.out.println("Done");
            Product product = productMapping.mapDtoToEntity(productDto,Product.class);
            System.out.println("Done2");
            System.out.println(product.getId());
            System.out.println(customer.getId());
            System.out.println(customer.getCart().getId());
            cartService.addProductToCart(product,customer.getCart(),quantity);
            System.out.println("Product added to cart successfully.");
            out.print("Product added to cart successfully.");
        }

    }

    @Override
    public void doGetProcess() throws ServletException, IOException {

    }
}
