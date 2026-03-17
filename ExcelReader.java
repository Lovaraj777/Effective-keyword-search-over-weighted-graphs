/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dataset.read;

import com.database.Dbconnection;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;


/**
 *
 * @author KishanVenky
 */
@MultipartConfig(maxFileSize=16144223)
public class ExcelReader extends HttpServlet {

   
public final String filepath="\\E:";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        MultipartRequest m=new MultipartRequest(request,filepath);
        
             int k=0;
             int i1=0;
            String filename=null;
           File file=m.getFile("dataset"); 
        String name=file.getName();
        String ext=name.substring(name.lastIndexOf(".")+1);
        
   if(ext.equalsIgnoreCase("xlsx")||ext.equalsIgnoreCase("xls")){
       try {
            Connection con=Dbconnection.getcon();
            Statement st=con.createStatement();
            int y=st.executeUpdate("delete from dataset");
            if(y>0){
                System.out.println("dataset deleted");
            }else{
                 System.out.println("dataset not deleted");
            }
          //the below for voice
          
           InputStream ins=new FileInputStream(file);
           XSSFWorkbook myWorkBook = new XSSFWorkbook(ins); 
           XSSFSheet mySheet = myWorkBook.getSheetAt(0); 
           System.out.println(mySheet.getLastRowNum());
            
           Row row;
            for(int i=1;i<=mySheet.getLastRowNum();i++){
              row=(Row)mySheet.getRow(i);
          String PageURL=null;
          String Source=null;
          String Followers=null;
              String Date=null;
               String Time=null;
              String PostType=null;
              String Interactions=null;
              String PostMessage=null;
              String PostLink=null;
              String TimeZone=null;
              
            if(row.getCell(0)==null){
                  PageURL="null";
              }else{
                   PageURL=row.getCell(0).toString();  
              }
            if(row.getCell(1)==null){
                  Source="null";
              }else{
                   Source=row.getCell(1).toString();  
              }
             
            
            if(row.getCell(2)==null){
                  Followers="null";
              }else{
                  Followers=row.getCell(2).toString();
              }
            if(row.getCell(3)==null){
                  Date="null";
              }else{
                  Date=row.getCell(3).toString();
              }
              if(row.getCell(4)==null){
                  Time="null";
              }else{
                  Time=row.getCell(4).toString();
              }
              if(row.getCell(5)==null){
                  PostType="null";
              }else{
                  PostType=row.getCell(5).toString();
              }
              if(row.getCell(6)==null){
                  Interactions="null";
              }else{
                  Interactions=row.getCell(6).toString();
              }
               if(row.getCell(7)==null){
                  PostMessage="null";
              }else{
                  PostMessage=row.getCell(7).toString();
              }
                if(row.getCell(8)==null){
                  PostLink="null";
              }else{
                  PostLink=row.getCell(8).toString();
              }
                
                if(row.getCell(9)==null){
                  TimeZone="null";
              }else{
                  TimeZone=row.getCell(9).toString();
              }
                
               
           PreparedStatement pst=con.prepareStatement("insert into dataset values(null,?,?,?,?,?,?,?,?,?,?)");
           pst.setString(1,PageURL);
            pst.setString(2,Source);
             pst.setString(3,Followers);
              pst.setString(4,Date);
            pst.setString(5,Time);
             pst.setString(6,PostType);
              pst.setString(7,Interactions);
           pst.setString(8,PostMessage);
             pst.setString(9,PostLink);
              pst.setString(10,TimeZone);
           
             
            k=pst.executeUpdate();
            
            
        }
             if(k>0){
            response.sendRedirect("UploadDataset.jsp?msg=Dataset Successfully Uploaded....!!!");
             }else{
               System.out.println("failed");  
               response.sendRedirect("UploadDataset.jsp?msg=Failed To Upload Dataset...!!!");
             }
       }catch(Exception e){
           System.out.println(e);
       }
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
