package iti.jets.Presentation;

import jakarta.servlet.ServletException;

import java.io.IOException;

public class UnknownCommand extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
            forward("unknown");
    }
}
