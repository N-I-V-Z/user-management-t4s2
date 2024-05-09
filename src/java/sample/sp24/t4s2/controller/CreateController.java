/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.sp24.t4s2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.sp24.t4s2.user.UserDAO;
import sample.sp24.t4s2.user.UserDTO;
import sample.sp24.t4s2.user.UserError;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {
    private static final String SUCCESS="login.html";
    private static final String ERROR="createUser.jsp";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        boolean check = true;
        UserError userError=new UserError();
        UserDAO dao= new UserDAO();
        try {
            String userID=request.getParameter("userID");
            String fullName=request.getParameter("fullName");
            String roleID=request.getParameter("roleID");
            String password=request.getParameter("password");
            String confirm=request.getParameter("confirm");
            if(userID.length()<2||userID.length()>10){
                userError.setUserIDError("UserID must be in [2,10]");
                check=false;
            }
            boolean checkDuplicate=dao.checkDuplicate(userID);
            if(checkDuplicate){
                userError.setUserIDError("User da ton tai");
                check =false;
            }
            if(fullName.length()<5||fullName.length()>20){
                userError.setFullNameError("FullName must be in [5,20]");
                check=false;
            }
            if(!password.equals(confirm)){
                userError.setPasswordError("2 password khong giong nhau");
                check=false;
            }
            if(check){
                UserDTO user = new UserDTO(userID, fullName, roleID, password);
                boolean checkInsert = dao.insert(user);
                if(checkInsert){
                    url=SUCCESS;
                }else{
                    userError.setError("Unknow Error");
                    request.setAttribute("USER_ERROR", userError);
                }
            }else{
                request.setAttribute("USER_ERROR", userError);
            }
            
        }catch(Exception e){
            log("Error at CreateController");
        }finally{
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
