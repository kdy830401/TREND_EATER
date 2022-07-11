<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />
<script src="${ contextPath }/resources/js/jquery-3.6.0.min.js"></script> 
<html>
<head>
	<title>Home</title>
</head>
<body>
	<c:import url="common/menubar.jsp"/>
	
	<c:import url="common/footer.jsp" />	
</body>
</html>
