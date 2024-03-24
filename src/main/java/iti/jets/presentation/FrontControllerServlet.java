package iti.jets.presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class FrontControllerServlet extends HttpServlet {

    public FrontControllerServlet(){
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        System.out.println("doGet Front-Controller...");
        System.out.println("requesturi"+request.getRequestURI());

        FrontCommand command = getCommand(request);
        command.init(request, response);
        command.doGetProcess();

    }

    protected void doPost(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        System.out.println("doPost-> Front-Controller...");
        System.out.println("requesturi: "+request.getRequestURI());


        FrontCommand command = getCommand(request);
        command.init(request, response);
        command.doPostProcess();

    }

    private FrontCommand getCommand(HttpServletRequest request) {

        String commandName = request.getRequestURI();

        commandName = getURI(commandName);
        System.out.println("FrontControllerServlet.getCommand() " + commandName);

        CommandFactory factory = new CommandFactory();

        System.out.println("after factory.getCommand()...");
        return factory.getCommand(commandName);

    }

    private String getURI(String uri){
        String res = "";
        if(uri.contains("Login")){
            res = "Login";
        }
        else if(uri.contains("Register")){
            res = "Register";
        }
        else if(uri.contains("Home")){
            res = "Home";
        }
        else if(uri.contains("Auth")){
            res = "Auth";
        }
        else if(uri.contains("Error404")){
            res = "Error404";
        } else if (uri.contains("Cart")) {
            res = "Cart";
        }
        else if(uri.contains("CheckOut")){
            res = "CheckOut";
        }
        else if(uri.contains("Hom2")){
            res = "Hom2";
        }
        else if(uri.contains("Shop")){
            res = "Shop";
        }
        else if(uri.contains("product")){
            res="product";
        }
        else if(uri.contains("singleProduct")){
            res="singleProduct";
        }
        else if(uri.contains("singlePage")){
            res="singlePage";
        }
        else if(uri.contains("relatedProducts")){
            res="relatedProducts";
        }
        else if(uri.contains("addFrom-shop")){
            res="addFrom-shop";
        }
        return res;
    }
}
