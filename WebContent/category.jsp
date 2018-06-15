<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Menu dọc</title>
<link rel="stylesheet" href="css/category.css" />
</head>
<body>
	<%
		CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
		List<Category> list = new ArrayList<Category>();
		list = categoryDAO.getList();
	%>
	
	<div class="mcd-menu container">
		<div class="mcd-menu list-group">
			<%
				for (Category c : list) {
			%>
			<a href="index.jsp?ma_the_loai=<%=c.getMa_the_loai()%>" class="list-group-item">
				<i class="fa fa-home"><img
						src="images/<%=c.getMa_the_loai()%>.png"></i><strong><%=c.getTen_the_loai()%></strong>
					<small><%=c.getMo_ta()%></small>
			</a>
			<%
				}
			%>
		</div>
	</div>
	
</body>
</html>