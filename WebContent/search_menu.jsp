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
<title>Menu dọc</title>
<link rel="stylesheet" href="css/category.css" />
<!-- Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<%
		CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
		List<Category> list = new ArrayList<Category>();
		list = categoryDAO.getList();
		String err="";
	%>
	<div class="container">
		<nav>
		<ul class="mcd-menu">
			<li>
				<form accept-charset="utf-8" method="post" action="SearchServlet"
					name="SearchServlet">
					<p><br>
						<label for="tensp">Tên sản phẩm</label> <br> 
						<input class="form-control" 
							accept-charset="utf-8" type="text" name="ten_san_pham"
							style="width: 86%">
					</p>
					<p>
						<label for="theloai">Thể loại</label> <br> 
						<select class="form-control" 
							accept-charset="utf-8" name="ten_the_loai" style="width: 86%">
							<option value="" selected="selected">Chọn thể loại</option>
							<%
				for (Category c : list) {
					
			%>
							<option class="form-control"  accept-charset="utf-8" value="<%=c.getTen_the_loai() %>"><%=c.getTen_the_loai() %></option>
							<%} %>
						</select>
					</p>
					<input class='btn btn-primary' type="submit" value="Tìm kiếm" name="timKiem" style="width: 85%">
				</form>
			</li>
			<li style="color: red"><%=err%></li>
                	</ul>
		</nav>
	</div>
</body>
</html>