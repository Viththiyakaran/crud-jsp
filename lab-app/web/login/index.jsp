
<jsp:include page="../sub-main/header.jsp" /> 
<body class="login-img3-body">

  <div class="container">

    <form class="login-form"  method="post" action="login.jsp">
      <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <input type="text" name="name" class="form-control" placeholder="Username" autofocus>
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
          <input type="password" class="form-control"  name="password" placeholder="Password">
        </div>
        <input type="submit" value="submit" class="btn btn-primary btn-lg btn-block" />
        
      </div>
    </form>
    <div class="text-center">
      <div class="credits">
          Designed by <a href="#">Prashath</a>
        </div>
    </div>
  </div>


</body>

<jsp:include page="../sub-main/footer.jsp" /> 
















