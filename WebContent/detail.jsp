<%@page import="dao.ProductDAOImpl"%>
<%@page import="controller.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet" href="css/detail.css" />
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

	<%
		// ham nay de lay ma san pham truyen qua tren thanh dia chj
		String ma_san_pham = null;
		if (request.getParameter("ma_san_pham") != null && request.getParameter("ma_san_pham").length()<50 
				&& Util.checkStringParam2(request.getParameter("ma_san_pham"))) {
			ma_san_pham = request.getParameter("ma_san_pham");
		}
		System.out.println(ma_san_pham);
		ProductDAOImpl productDAO = new ProductDAOImpl();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumFractionDigits(0);
	%>
	<div id="main">
		<div id="head">
			<img src="img/banner1.jpg" width="1057px" height="300px" />
		</div>
		<%
			String username = null;
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("username"))
						username = cookie.getValue();
						request.getSession().setAttribute("username", username);
				}
			}

			if (username != null) {
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
					<li><a href="update_user.jsp?username=<%=username%>"><span><%=username%></span></a></li>
					<li><a href="LogoutServlet"><span
							class="glyphicon glyphicon-log-in"></span> ĐĂNG XUẤT</a></li>
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
		<div id="content">

			<div class="left-1">
				<img
					src="product/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getHinh_anh()%>"
					width="200px" height="200px" />
			</div>
			<div class="left-2">
				<table>
					<tr class="row1">
						<td class="col2" colspan="2"
							style="padding: 10px; color: blue; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold">
							<%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getTen_san_pham()%></td>
					</tr>
					<tr class="row2">
						<td class="col1">Hãng sản xuất:</td>
						<td class="col2"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getHang_san_xuat()%></td>
					</tr>

					<tr class="row2">
						<td class="col1">Giá bán:</td>
						<td class="col2"><%=nf.format(productDAO.getProduct(Integer.parseInt(ma_san_pham)).getGia_ban())%>
							VNĐ</td>
					</tr>

				</table>
			</div>
			<%
				if (username != null) {
			%>
			<div
				style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
				<a href="#"><img src="img/giohang.png" /></a>
				<form action="GioHangServlet" method="post">
					<br> <input type="number" min="1" value="1" name="soluong"
						class="btn btn-default" /> <input type="hidden" value="setCart"
						name="command" /> <input type="hidden" value="<%=ma_san_pham%>"
						name="ma_san_pham" /> <input type="submit"
						value="Thêm vào giỏ hàng" class="btn btn-info" />
				</form>
			</div>
			<%
				} else {
			%>
			<div
				style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
				<a href="login.jsp"><img src="img/giohang.png" /></a>
			</div>
			<%
				}
			%>
			<div class="left-3">
				<article> <input type="checkbox" id="read_more"
					role="button">
				<br>
				<label for="read_more" onclick=""
					style="width: 770px; margin-left: 150px; margin-right: auto;"><span>Xem
						thông tin chi tiết</span> <span>Đóng</span></label> <section>
				<table>

					<!-- thong tin chung -->
					<tr rowspan="2">
						<td class="detail-1">Thông chi tiết</td>
						<td class="detail-2">Đang cập nhật</td>
					</tr>


				</table>
				<br>
				</section> </article>
			</div>

		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>

</body>
</html>
