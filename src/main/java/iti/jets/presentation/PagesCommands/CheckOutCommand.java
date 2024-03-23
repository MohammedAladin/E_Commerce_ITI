package iti.jets.presentation.PagesCommands;

import java.io.IOException;

import iti.jets.Services.CheckOutServices;
import iti.jets.business.ExceptionsHandling.CustomException;
import iti.jets.business.entities.Cart;
import iti.jets.business.entities.Customer;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;

public class CheckOutCommand extends FrontCommand{

    private CheckOutServices checkOutServices;
    public CheckOutCommand() {
        checkOutServices = new CheckOutServices();
    }

    @Override
    public void doPostProcess() throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("customer");

        System.out.println("customer: " + customer);
        if(customer == null){
            response.setStatus(401);
            response.getWriter().write("Unauthorized");
            return;
        }

        try {
            checkOutServices.checkOut(customer.getId());
            response.setStatus(200);
            response.getWriter().write("Checked out successfully");
        } catch (CustomException e) {
            response.setStatus(e.getStatusCode());
            response.getWriter().write(e.getDescription());
        }


    }

    @Override
    public void doGetProcess() throws ServletException, IOException {

    }


}
