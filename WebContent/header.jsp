<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if (request.getSession().getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
} %>