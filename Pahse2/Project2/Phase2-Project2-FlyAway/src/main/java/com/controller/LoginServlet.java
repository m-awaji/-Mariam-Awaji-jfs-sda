package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static boolean isLoggedIn = false;
    public static String password = "";
    public static String username = "";
	private UserDao loginDao;

    public void init() {
        loginDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("Login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            authenticate(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response)
    throws Exception {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (loginDao.validate(username, password)) {
            isLoggedIn = true;
            RequestDispatcher dispatcher = request.getRequestDispatcher("Admin_Dashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            isLoggedIn = false;
        	 RequestDispatcher dispatcher = request.getRequestDispatcher("Login_Failed.jsp");
             dispatcher.forward(request, response);
        }
    }
}