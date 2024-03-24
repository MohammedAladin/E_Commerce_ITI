package iti.jets.presentation.AuthCommands;

import iti.jets.Services.AuthServices;
import iti.jets.business.Dtos.CustomerDto;
import iti.jets.business.Mappings.CustomersMapping;
import iti.jets.business.entities.Customer;
import iti.jets.business.util.JsonMapper;
import iti.jets.presentation.FrontCommand;
import iti.jets.presentation.listeners.ContextListener;
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

        CustomersMapping customersMapping = new CustomersMapping();

        ContextListener contextListener = new ContextListener();
        if(contextListener.isContextInitialized() ){
            System.out.println("Context is initialized");
        }else {
            System.out.println("Context is not initialized");
        }

        String jsonString = getJsonString();

        ObjectMapper objectMapper = new ObjectMapper();
        CustomerDto customerDto = objectMapper.readValue(jsonString, CustomerDto.class);

        System.out.println(customerDto.getEmail() + " " + customerDto.getPassword());
        Customer customer = authServices.login(customerDto.getEmail(), customerDto.getPassword());
        if (customer != null) {
            try {

                customerDto = customersMapping.mapEntityToDto(customer,CustomerDto.class);
                jsonString = JsonMapper.convertToJson(customerDto);

                System.out.println(jsonString);
                request.getSession().setAttribute("customer", customer);

                response.setStatus(200);
                assert jsonString != null;
                response.getWriter().write(jsonString);
            }catch (Exception e){
                System.out.println(e.getMessage());
            }

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
