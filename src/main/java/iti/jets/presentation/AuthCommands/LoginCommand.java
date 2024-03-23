package iti.jets.presentation.AuthCommands;

import iti.jets.Services.AuthServices;
import iti.jets.business.Dtos.CustomerDto;
import iti.jets.business.entities.Customer;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;



public class LoginCommand extends FrontCommand {
    AuthServices authServices;
    public LoginCommand() {
        authServices = new AuthServices();
    }

    private String getJsonString() throws IOException {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        return sb.toString();
    }
    @Override
    public void doPostProcess() throws ServletException, IOException {
        System.out.println("LoginCommand.doPostProcess()");
        System.out.println("AuthCommand.process() login");

        String jsonString = getJsonString();

        ObjectMapper objectMapper = new ObjectMapper();
        CustomerDto customerDto = objectMapper.readValue(jsonString, CustomerDto.class);

        System.out.println(customerDto.getEmail() + " " + customerDto.getPassword());
        Customer customer = authServices.login(customerDto.getEmail(), customerDto.getPassword());
        if (customer != null) {
            System.out.println("Logged in successfully");
            response.setStatus(200);
            request.getSession().setAttribute("customer", customer);
            response.getWriter().write("Logged in successfully");
        } else {
            System.out.println("Invalid email or password");
            response.setStatus(401);
            response.getWriter().write("Invalid email or password");
        }
    }

    @Override
    public void doGetProcess() throws ServletException, IOException {
        System.out.println("LoginCommand.dGetProcess()");
        System.out.println("AuthCommand.process() login");
        forward("Login.jsp");
    }
}
