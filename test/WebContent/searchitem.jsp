<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


    <%  
    
    
   		String 상품번호 =  request.getParameter("id");
    
    
    	String 찾은상품 =String.format("{\"id\":\"%s\",\"name\":\"상품%s\",\"price\":\"%d\"}", 상품번호, 상품번호, Integer.valueOf(상품번호)*10);
    
    
    	out.append(찾은상품);
    
    
    
    
    
    %>