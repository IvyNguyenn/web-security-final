<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Giỏ hàng</title>
<link rel="stylesheet" href="css/cart.css" />
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
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
		String username = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username"))
					username = cookie.getValue();
					request.getSession().setAttribute("username", username);
			}
		}
	%>
	<div id="main">
		<div id="head">
			<img src="img/banner2.jpg" width="1057px" height="300px" />
		</div>

		<div id="head-link">
			<div id='menungang'>
				<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp">TRANG CHỦ</a></li>
						<li class="active"><a href="product.jsp">SẢN PHẨM</a></li>
						<li class='last'><a href="cart.jsp"><span>GIỎ HÀNG</span></a></li>
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
		</div>
		<div id="content">


			<div class="shopping-cart">

				<div class="column-labels">
					<label class="product-image">Hình ảnh</label> <label
						class="product-details">Product</label> <label
						class="product-price">Giá bán</label> <label
						class="product-quantity">Số lượng</label><label
						class="product-line-price">Tổng tiền</label>
				</div>
				<%
					ProductDAOImpl productDAO = new ProductDAOImpl();

					NumberFormat nf = NumberFormat.getInstance();
					nf.setMinimumIntegerDigits(0);
					double total = 0;
					ArrayList<Cart> cart = null;
					if (session.getAttribute("cart") != null) {
						cart = (ArrayList<Cart>) session.getAttribute("cart");
					}
				%>
				<%
					if (cart != null) {
						for (Cart c : cart) {
							total = total + (c.getQuantity() * productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban());
				%>
				<div class="product">
					<div class="product-image">
						<img
							src="product/<%=productDAO.getProduct(c.getP().getMa_san_pham()).getHinh_anh()%>">
					</div>
					<div class="product-details">
						<div class="product-title">
							<%=productDAO.getProduct(c.getP().getMa_san_pham()).getTen_san_pham()%>
						</div>
						<p class="product-description"></p>
					</div>
					<div class="product-price"><%=nf.format(productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban())%>
						VNĐ
					</div>
					<div class="product-quantity cart_quantity_button">
						<a class="cart_quantity_up"
							href="GioHangServlet?command=deleteCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>">
							- </a> <input class="cart_quantity_input" type="text"
							value="<%=c.getQuantity()%>" disabled="disabled"> <a
							class="cart_quantity_up"
							href="GioHangServlet?command=addCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>">
							+ </a>
					</div>
					<div class="product-line-price" style="text-align: right"><%=nf.format(productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban() * c.getQuantity())%>
						VNĐ <a
							href="GioHangServlet?command=removeCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>"><img
							style="margin-left: 10px" src="images/delete.png"></a>
					</div>

				</div>
				<%
					}
					}
				%>
				<div class="totals">
					<div class="totals-item">
						<label>Tổng hóa đơn</label>
						<div class="totals-value" id="cart-subtotal"><%=nf.format(total)%>
							VNĐ
						</div>
					</div>
				</div>
				<%
					if (cart != null && cart.size() > 0) {
				%>
				<a class="checkout btn btn-warning" href="history.jsp"
					style="text-decoration: none;">Lịch sử</a> <a
					class="checkout btn btn-success"
					href="ConfirmServlet?username=<%=username%>"
					style="text-decoration: none;">Thanh toán</a>
				<%
					} else {
				%>
				<a class="checkout btn btn-warning" href="history.jsp"
					style="text-decoration: none;">Lịch sử</a> <a
					class="checkout btn btn-success" href="product.jsp"
					style="text-decoration: none;">Thanh toán</a> <br> <br> <br>
				<br> <br>
				<div class="alert alert-warning alert-dismissible">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong></strong> Chưa có sản phẩm trong giỏ hàng.
				</div>
				<%
					}
				%>
			</div>

		</div>

	</div>
	<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>