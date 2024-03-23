package iti.jets.presentation.PagesCommands;
import iti.jets.presentation.FrontCommand;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;

public class HomeCommand extends FrontCommand {

    @Override
    public void doPostProcess() throws ServletException, IOException {
        System.out.println("HomeCommand.doPostProcess()");
        System.out.println(request.getRequestURI());
        doGetProcess();
    }
    @Override
    public void doGetProcess() throws ServletException, IOException {
        System.out.println("HomeCommand.doGetProcess()");
               forward("/index.jsp");
//        String email = request.getParameter("email");
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        System.out.println("before sending email");
//        out.println(email);
    }
}
