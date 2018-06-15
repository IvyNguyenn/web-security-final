<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Đăng ký</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
        
#wrap{

}
legend{
	color:#141823;
	font-size:25px;
	font-weight:bold;
  display: inline;
  margin: 10px;
}

.form .form-control { 
  margin-bottom: 10px; 
}

.container
{
  border: 3px solid #ccc;
  border-radius: 10px;
  margin-top: 50px; 
   margin-bottom: 50px;

  padding: 5%;
  background-color: white;
  width: 40%;
}

.icon
{
  width: 60px;
  display: inline-block;
}
li
 {
  border: none;
  list-style: none;
  margin-bottom: 25px;
  width: 100%;
}
.link
{
  display: inline-block;
}

</style>


</head>
<body background="img/shopping.jpg">
  <%
    String err = "";
    if (request.getAttribute("err") != null) {
      err = (String) request.getAttribute("err");
    }
  %>

<div class="container">
<div class="row">
  <div class="col-md-6 col-md-offset-3"">             
    <legend>Đăng ký</legend>

  </div>
  </div>
      <form action="RegisterServlet" method="post" accept-charset="utf-8" class="form" role="form">   
        <li style="color: red"><%=err%></li>
        <br> 
        <li><input type="text" name="username" value="" class="form-control input-lg" placeholder="Tên tài khoản"/></li>
          
          <div class="row">
            <div class="col-xs-6 ">
              <li><input type="password" name="password" value="" class="form-control input-lg" placeholder="Mật khẩu"/></li>
            </div>
            <div class="col-xs-6 ">
              <li><input type="password" name="confirmpassword" value="" class="form-control input-lg" placeholder="Xác nhận mật khẩu"/></li>
            </div>                    
          </div>

          <br>

          <div class="row">         
            <div class="col-xs-3 ">
            </div>                  
            <div class="col-xs-4 ">
                <li><input type="radio" name="gender" value="Nam" id=male />  Nam</li>
            </div>
            <div class="col-xs-4 ">
                <li><input type="radio" name="gender" value="Nữ" id=female />   Nữ</li>
            </div>
          </div>
          <br>


          <li><input type="date" name="ngaysinh" value="" class="form-control input-lg" placeholder="Ngày sinh"  /></li>

          <li><input type="email" name="email" value="" class="form-control input-lg" placeholder="Email@email.com"/></li>

          <li><input type="text" name="sdt" value="" class="form-control input-lg" placeholder="Số điện thoại"/></li>
          
          <li><input type="text" name="diachi" value="" class="form-control input-lg" placeholder="Địa chỉ"/></li>     

          <div class="p-container">
          <label class="checkbox two"><input type="checkbox"
              name="checkbox" unchecked><i></i>Tôi đồng ý <a href="#">Điều khoản dịch vụ</a></label>
          </div>

          <input class="btn btn-lg btn-primary btn-block btn-center" type="submit" data-bindattr-3="3" value="Đăng ký"></input>
                  <br>
       <div class="col-xs-2"></div>
            <div class="col-xs-4 ">
            <a href="login.jsp" class="link">Đăng nhập</a><br><br>
            </div>
            <div class="col-xs-4 ">
            <a href="/Shoping/index.jsp" class="link">Trang Chủ</a>
            </div>
          
      </form>          
    </div>
</div>            
</div>
</div>

</body>
</html>
