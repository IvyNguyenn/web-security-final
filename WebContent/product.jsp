<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sản phẩm</title>
<link rel="stylesheet" href="css/product.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/menu.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<pg:paging pageSize="4">
		<div id="main">
			<div id="head">
				<img src="img/banner2.jpg" width="1057px" height="300px" />
			</div>
			<%
				String username = null;
					Cookie[] cookies = request.getCookies();
					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if (cookie.getName().equals("username"))
								username = cookie.getValue();
						}
					}

					if (username != null) {
			%>
			<div id="head-link">
				<div id="head-link">
					<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<ul class="nav navbar-nav">
							<li><a href="index.jsp">TRANG CHỦ</a></li>
							<li class="active"><a href="product.jsp">SẢN PHẨM</a></li>
							<li><a href="search_page.jsp">TÌM KIẾM</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="LogoutServlet"><span
									class="glyphicon glyphicon-log-in"></span> ĐĂNG XUẤT</a></li>
							<li><a href="update_user.jsp?username=<%=username%>"><span><%=username%></span></a></li>
						</ul>
					</div>
					</nav>
				</div>
				<%
					} else {
				%>
				<div id="head-link">
					<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<ul class="nav navbar-nav">
							<li><a href="index.jsp">TRANG CHỦ</a></li>
							<li class="active"><a href="product.jsp">SẢN PHẨM</a></li>
							<li><a href="search_page.jsp">TÌM KIẾM</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="login.jsp"><span
									class="glyphicon glyphicon-log-in"></span> ĐĂNG NHẬP</a></li>
							<li><a href="register.jsp"><span
									class="glyphicon glyphicon-user"></span> ĐĂNG KÝ</a></li>
						</ul>
					</div>
					</nav>

				</div>
				<%
					}
				%>

				<div id="content_center">

					<%
						ProductDAOImpl productDAO = new ProductDAOImpl();

							NumberFormat nf = NumberFormat.getInstance();
							nf.setMinimumFractionDigits(0);
					%>

					<div id="site-wrapper-p" style="float: left; margin-left: 120px">
						<ul class="products homepage">

							<%
								for (Product p : productDAO.getList()) {
							%>
							<pg:item>
								<li class="preorder"><span class="tagimg "></span> <a
									href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"> <img
										src="product/<%=p.getHinh_anh()%>" width=" 250px"
										height="250px" />
										<h3><%=p.getTen_san_pham()%></h3>
										<h4>
											Giá:
											<%=nf.format(p.getGia_ban())%>
											VNĐ
										</h4> <span class="textkm">Khuyến mãi trị giá đến <strong>500.000₫</strong>
									</span>
										<p class="info">
											<span>Hãng sx: <%=p.getHang_san_xuat()%></span> <span>Giá:
												<%=nf.format(p.getGia_ban())%> VNĐ
											</span> <span>Thông tin: <%=p.getThong_tin()%>
										</p>
								</a></li>
							</pg:item>
							<%
								}
							%>
						</ul>
					</div>

					
				</div>
	</pg:paging>
	<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>