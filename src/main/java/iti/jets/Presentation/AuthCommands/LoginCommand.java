package iti.jets.Presentation.AuthCommands;

import iti.jets.Presentation.FrontCommand;
import jakarta.servlet.ServletException;

import java.io.IOException;

public class LoginCommand extends FrontCommand {
    @Override
    public void process() throws ServletException, IOException {
        forward("Login");

    }
}
