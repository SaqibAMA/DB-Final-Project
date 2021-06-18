<%@ Page Title="Jamya" Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login | Jamya </title>

  <!--Google Fonts-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;500&family=Poppins:wght@500;600&display=swap"
    rel="stylesheet">


  <!--jQuery for Interaction-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <!--Materialize for grids-->
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <!-- Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


  <!--Stylesheet-->
  <link rel="stylesheet" href="css/signup.css">

</head>
<body>

<form action="" method="POST" runat="server">

  <div class="row panels">

    <div class="col s12 m6 xl4 leftPanel hide-on-small-only">


      <div class="container">

        <h3 class="left-align">Your ideal university is just one step away!</h3>

        <h6 class="left-align">Jamya helps you find the best universities all around the world and apply to them with convenience.</h6>

        <img src="assets/simple_white_jamya_logo.png" alt="Jamya Logo" class="leftPanelLogo" draggable="false" />

      </div>


    </div>

    <div class="col s12 m6 xl8 rightPanel" style="padding-top: 8rem !important;">

      <div class="container white">

        <div class="row">



          <div class="col s12 center-align">
            
            <img src="assets/simple_cyan_jamya_logo.png" alt="Jamya Logo" srcset="" class="formTopLogo" draggable="false"/>
         
          </div>


          <div class="col s12 center-align">
            <h5>LOGIN</h5>
          </div>


          <div class="col s12">

            <label>USERNAME</label>
            <asp:textbox type="text" name="username" id="txtUsername" placeholder="saqibali" class="validate" runat="server"></asp:textbox>

          
          </div>


          <div class="col s12">

            <label >PASSWORD</label>
            
<asp:textbox type="password" name="password" id="txtPassword" placeholder="**********" runat="server"></asp:textbox>

          </div>


          <div class="col s12">

            <label>By logging in, you agree to our <a href="">terms and conditions.</a></label>

            <asp:Button OnClick="loginButton_Click" type="submit" name="submit" text="LOGIN" id="loginButton" value="LOGIN"  CssClass="loginButton" runat="server"/>

            <label>Not a member? <a href="signup.aspx">Signup.</a></label>
              <asp:Label ID="lblErrorMessage" runat="server" Text="Label">Credentials Not Found</asp:Label>
          </div>


        </div>



      </div>
      
    </div>

  </div>
  
</form>


<footer>

  <div class="container row">


    <div class="col s12 m5 center-align logoCol">
      
      <img src="assets/simple_white_jamya_logo.png" alt="Jamya Logo" class="footerLogo" draggable="false"/>

      <h6>JAMYA INC.</h6>

      <div>
        100, Cheemgadar Street, Shahdrah Bagh, Pakistan.
      </div>

      <div>

        <i class="material-icons">facebook</i>
        <i class="material-icons">email</i>
        <i class="material-icons">groups</i>

      </div>

    </div>

    <div class="col s12 m2 center-align">

      <h6 class="colTitle">Overview</h6>

      <ul>
        <li><a href="#">Pricing</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Mission</a></li>
        <li><a href="#">About Us</a></li>
      </ul>

    </div>
  
    <div class="col s12 m2 center-align">

      <h6 class="colTitle">Resources</h6>

      <ul>
        <li><a href="#">Help Center</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Testimonials</a></li>
        <li><a href="#">Partners</a></li>
      </ul>

    </div>


    <div class="col s12 m2 center-align">

      <h6 class="colTitle">Copyright</h6>

      <ul>
        <li>&copy; Jamya</li>
        <li>All Rights Reserved</li>
      </ul>

    </div>


  </div>

</footer>

</body>
</html>