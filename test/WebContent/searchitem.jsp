<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


    <%  
    
    
   		String ��ǰ��ȣ =  request.getParameter("id");
    
    
    	String ã����ǰ =String.format("{\"id\":\"%s\",\"name\":\"��ǰ%s\",\"price\":\"%d\"}", ��ǰ��ȣ, ��ǰ��ȣ, Integer.valueOf(��ǰ��ȣ)*10);
    
    
    	out.append(ã����ǰ);
    
    
    
    
    
    %>