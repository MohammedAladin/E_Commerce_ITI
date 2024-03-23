package iti.jets.presentation.AuthCommands;

import iti.jets.Services.AuthServices;
import iti.jets.business.Dtos.CustomerDto;
import iti.jets.business.ExceptionsHandling.CustomException;
import iti.jets.presentation.FrontCommand;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.servlet.ServletException;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDate;

public class RegisterCommand extends FrontCommand {

    AuthServices authServices;
    public RegisterCommand() {
        authServices = new AuthServices();
    }
    @Override
    public void doPostProcess() throws ServletException, IOException {
        System.out.println("RegisterCommand.process()........");

        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;

        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        String jsonString = sb.toString();
        System.out.println("jsonString: " + jsonString);
        String username = jsonString.substring(jsonString.indexOf("username") + 11, jsonString.indexOf(",") - 1);
        String password = jsonString.substring(jsonString.indexOf("password") + 11, jsonString.indexOf(",", jsonString.indexOf("password")) - 1);
        String email = jsonString.substring(jsonString.indexOf("email") + 8, jsonString.indexOf(",", jsonString.indexOf("email")) - 1);
        String confirmPassword = jsonString.substring(jsonString.indexOf("confirmPassword") + 18, jsonString.indexOf(",", jsonString.indexOf("confirmPassword")) - 1);
        String phoneNumber = jsonString.substring(jsonString.indexOf("phoneNumber") + 14, jsonString.indexOf(",", jsonString.indexOf("phoneNumber")) - 1);
        String dob = jsonString.substring(jsonString.indexOf("dob") + 6, jsonString.indexOf("}") - 1);


        CustomerDto customerDto = new CustomerDto();
        customerDto.setCustomerName(username);
        customerDto.setPassword(password);
        customerDto.setEmail(email);
        customerDto.setPhoneNumber(phoneNumber);
        customerDto.setDob(LocalDate.parse(dob));

        try {
            if (authServices.register(customerDto)) {
                System.out.println("ramadan kareem");
                System.out.println(request.getRequestURI());
                response.setStatus(200);
                response.getWriter().write("Registered Successfully");
            }
        } catch (CustomException | IllegalAccessException e) {
            request.setAttribute("error", e.getMessage());
            forward("/Error404.html");
        }
    }

    @Override
    public void doGetProcess() throws ServletException, IOException {
        forward("Login.jsp");
    }
}