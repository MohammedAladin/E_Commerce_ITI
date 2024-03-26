package iti.jets.presentation.AuthCommands;

import iti.jets.Services.AuthServices;
import iti.jets.business.Dtos.CustomerDto;
import iti.jets.business.ExceptionsHandling.CustomException;
import iti.jets.business.entities.Customer;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;
import java.io.BufferedReader;
import java.io.IOException;
import com.fasterxml.jackson.databind.ObjectMapper;


public class RegisterCommand extends FrontCommand {
    AuthServices authServices;
    public RegisterCommand() {
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

        String jsonString = getJsonString();

        ObjectMapper objectMapper = new ObjectMapper();
        CustomerDto customerDto = objectMapper.readValue(jsonString, CustomerDto.class);

        try {
            Customer customer = authServices.register(customerDto);
            if (customer != null) {
                System.out.println(request.getRequestURI());
                request.getSession().setAttribute("customer", customer);
                response.setStatus(200);

                response.getWriter().write("Registered successfully");
                System.out.println("Registered successfully");

            }
        } catch (
                IllegalAccessException | CustomException e) {
            request.setAttribute("error", e.getMessage());
            forward("/Error404.html");
        }
    }
    @Override
    public void doGetProcess() throws ServletException, IOException {
        forward("Login.jsp");
    }
}
