package iti.jets.presentation;
import iti.jets.presentation.Filters.FilterManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public abstract class FrontCommand {
    protected ServletContext context;
    protected HttpServletRequest request;
    protected HttpServletResponse response;

    public void init(
            HttpServletRequest servletRequest,
            HttpServletResponse servletResponse) throws ServletException, IOException {
        this.request = servletRequest;
        this.response = servletResponse;

       
       // FilterManager.processAuthFilterChain(request, response);
    }
    public  abstract void doPostProcess() throws ServletException, IOException;
    public abstract void doGetProcess() throws ServletException, IOException ;

    protected void forward(String target) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(target);
        dispatcher.forward(request, response);
    }
    protected void include(String target) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(target);
        dispatcher.include(request, response);
    }
    protected void sendRedirect(String target) throws ServletException, IOException {
        response.sendRedirect(target);
    }
}
