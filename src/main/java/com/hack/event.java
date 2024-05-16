package com.hack;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class event extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "Add Events":
                	response.sendRedirect(request.getContextPath() + "/addeventredirect");
                    break;
                case "check status":
                	response.sendRedirect(request.getContextPath() + "/checkStatus");
                    break;
                case "drop events":
                    response.sendRedirect("dropEvent.html");
                    break;
                case "previous events":
                	response.sendRedirect(request.getContextPath() + "/fetch");
                    break;
                case "Aprove Event":
                	response.sendRedirect(request.getContextPath() + "/approveEvent");
                    break;
                default:
                    // Handle unknown action
                    response.sendRedirect("error.html");
                    break;
            }
        } else {
            // Handle case where action parameter is not provided
            response.sendRedirect("error.html");
        }
    }
}
