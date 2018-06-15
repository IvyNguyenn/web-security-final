<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.UserDAOImpl"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Cập nhật thông tin</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
#wrap {
	
}

legend {
	color: #141823;
	font-size: 25px;
	font-weight: bold;
	display: inline;
	margin: 10px;
}

.form .form-control {
	margin-bottom: 10px;
}

.container {
	border: 3px solid #ccc;
	border-radius: 10px;
	margin-top: 50px;
	margin-bottom: 50px;
	padding: 5%;
	background-color: white;
	width: 40%;
}

.icon {
	width: 60px;
	display: inline-block;
}

li {
	border: none;
	list-style: none;
	margin-bottom: 25px;
	width: 100%;
}

.link {
	display: inline-block;
}
</style>


</head>
<body background="shopping.jpg">
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
		//String username = request.getParameter("username");
		String username = (String)request.getSession().getAttribute("username");
		UserDAOImpl userDAO = new UserDAOImpl();
		User u = userDAO.getUser(username);
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3"">
				<legend>Update Information</legend>
			</div>
		</div>
		<form action="UpdateUser" method="post" accept-charset="utf-8"
			class="form" role="form">
			<li style="color: red; text-align:center"><%=err%></li> <br>
			<li><input type="text" name="username"
				value="<%=u.getUsername()%>" readonly class="form-control input-lg"
				placeholder="Tên tài khoản" /></li>
			<li><input type="password" name="old-password" value=""
				class="form-control input-lg" placeholder="Mật khẩu cũ" /></li>
			<li><input type="password" name="new-password" value=""
				class="form-control input-lg" placeholder="Mật khẩu mới" /></li> <br>
			<div class="row">
				<div class="col-xs-3 "></div>
				<div class="col-xs-4 ">
					<li><input type="radio" name="gioitinh" value="Nam" id=male />
						Nam</li>
				</div>
				<div class="col-xs-4 ">
					<li><input type="radio" name="gioitinh" value="Nu" id=female />
						Nữ</li>
				</div>
			</div>
			<br>


			<li><input type="date" name="ngaysinh"
				value="<%=u.getNgaysinh()%>" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = '<%=u.getNgaysinh()%>';}"
				class="form-control input-lg" placeholder="Ngày sinh" /></li>

			<li><input type="email" name="email" value="<%=u.getEmail()%>"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = '<%=u.getEmail()%>';}"
				class="form-control input-lg" placeholder="Email@email.com" /></li>

			<li><input type="text" name="sdt" value="<%=u.getSdt()%>"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = '<%=u.getSdt()%>';}"
				class="form-control input-lg" placeholder="Số điện thoại" /></li>

			<li><input type="text" name="diachi" value="<%=u.getDiachi()%>"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = '<%=u.getDiachi()%>';}"
				class="form-control input-lg" placeholder="Địa chỉ" /></li> <br>

			<div class="submit two">
				<input type="submit" value="CẬP NHẬT"
					class="btn btn-lg btn-primary btn-block btn-center"> 
				<input type="hidden" value="<%=u.getUser_id()%>" name="id">
				<a href="/Shoping/index.jsp">Trở về</a>
			</div>
		</form>
	</div>
	</div>
	</div>
	</div>

</body>
</html>
