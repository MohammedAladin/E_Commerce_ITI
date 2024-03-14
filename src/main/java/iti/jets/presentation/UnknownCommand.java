package iti.jets.presentation;

import jakarta.servlet.ServletException;

import java.io.IOException;

public class UnknownCommand extends FrontCommand {


    @Override
    public void doPostProcess() throws ServletException, IOException {
        System.out.println("UnknownCommand.doPostProcess()");
        forward("/Error404.html");
    }

    @Override
    public void doGetProcess() throws ServletException, IOException {
        System.out.println("UnknownCommand.doGetProcess()");
        forward("/Error404.html");
    }
}
