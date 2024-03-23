package iti.jets.presentation.PagesCommands;

import iti.jets.business.Dtos.ProductDtoYousif;
import iti.jets.business.ProductService;
import iti.jets.business.entities.Category;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;

import java.io.IOException;

public class SinglePageCommand extends FrontCommand {

    ProductService  productService = new ProductService();
    public static int excludedProductId;
    public static int theCategoryId;

    @Override
    public void doPostProcess() throws ServletException, IOException {

    }

    @Override
    public void doGetProcess() throws ServletException, IOException {

        System.out.println("inside single page do get");
        System.out.println(request.getParameter("productId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        excludedProductId=productId;
        request.setAttribute("productId",productId);
        ProductDtoYousif productDtoYousif = productService.retrieveProductById(productId);
        Category category = productDtoYousif.getCategory();
        theCategoryId=category.getId();
        String categoryName=category.getCategoryName();
        request.setAttribute("categoryName",categoryName);
        forward("/single-product.jsp");

    }
}
