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

        System.out.println("Front-Controller...");

        FrontCommand command = getCommand(request);
        command.init(request, response);
        command.process();

    }

    private FrontCommand getCommand(HttpServletRequest request) {

        String commandName = request.getRequestURI();

        commandName = getURI(commandName);

        CommandFactory factory = new CommandFactory();

        FrontCommand command = factory.getCommand(commandName);

        if (command == null) {
            command = new UnknownCommand();
        }

        return command;

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
        return res;
    }
}
