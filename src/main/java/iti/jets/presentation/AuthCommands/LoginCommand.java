package iti.jets.presentation.AuthCommands;

import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;

import java.io.IOException;

public class LoginCommand extends FrontCommand {
    @Override
    public void process() throws ServletException, IOException {
        forward("Login");

    }
}
