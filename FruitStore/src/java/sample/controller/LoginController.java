/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.utils.VerifyRecaptcha;

/**
 *
 * @author ルオン。ズイ。カット
 */
public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String US = "US";
    private static final String US_PAGE = "user.jsp";
    private static final String SHOPPING_CONTROLLER = "ShoppingController";
    private static final String AD = "AD";
    private static final String AD_PAGE = "admin.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String gRecaptchaResponse = request
				.getParameter("g-recaptcha-response");
//		System.out.println(gRecaptchaResponse);
		boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
                
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            
            UserDAO dao = new UserDAO();
            UserDTO loginUser =  dao.checkLogin(userID, password);
            if (loginUser == null) {
                if(verify){
                   request.setAttribute("ERROR", "Incorrect userID or password"); 
                }else{
                    request.setAttribute("CAPTCHA_ERROR", "Please check captcha!!!");
                }
            } else {
                HttpSession session = request.getSession();
                String roleID = loginUser.getRoleID();
                if (US.equals(roleID)) {
                    url = SHOPPING_CONTROLLER;
                    session.setAttribute("LOGIN_USER", loginUser);
                } else if (AD.equals(roleID)) {
                    url = AD_PAGE;
                    session.setAttribute("LOGIN_USER", loginUser);
                } else {
                    request.setAttribute("ERROR", "Your role is not support");
                }
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
