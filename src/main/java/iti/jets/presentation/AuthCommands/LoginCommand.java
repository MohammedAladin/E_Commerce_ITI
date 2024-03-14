package iti.jets.presentation.AuthCommands;

import iti.jets.Services.AuthServices;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;

import java.io.IOException;

public class LoginCommand extends FrontCommand {
    AuthServices authServices;
    public LoginCommand() {
        authServices = new AuthServices();
    }
    @Override
    public void doPostProcess() throws ServletException, IOException {
        System.out.println("LoginCommand.doPostProcess()");
        System.out.println("AuthCommand.process() login");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (authServices.login(email, password)) {
            forward("Home");
        } else {
            request.setAttribute("error", "Invalid email or password");
            forward("Error404.html");
        }

    }

    @Override
    public void doGetProcess() throws ServletException, IOException {
        forward("Login.jsp");
    }
}
