<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>

<!DOCTYPE html>
<html lang="en">
<head>
  
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Jamya | Find your ideal university</title>

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

  <!--Main stylesheet-->
  <link rel="stylesheet" href="css/index.css"/>

  <!--Footer styling-->
  <link rel="stylesheet" href="css/footer.css" />


  <link rel="shortcut icon" href="assets/simple_cyan_jamya_logo.png" type="image/x-icon" />


    <style type="text/css">
        #loginButton {
            width: 12px;
        }
    </style>


</head>
<body>


<!--Main Windows Form-->
<form action="" method="POST" runat="server">


  <header>

    <div class="container">


      <!--Rightmost Logo-->
      <div class="logoContainer">
        <a href="/">
          <img src="assets/simple_cyan_jamya_logo.png" alt="Jamya Logo" class="topLogo" draggable="false" />
        </a>
      </div>


      <!--Login Button-->
      <asp:Button type="button" value="LOGIN" CssClass="loginButton" ID="loginButton" runat="server" Text="LOGIN" OnClick="loginButton_Click"/>
      <!--Login Button-->
        <%--<a href="login.aspx">
      <input type="button" value="LOGIN" class="loginButton" />
            </a>--%>
      <!--Signup Button-->
      <asp:Button type="button" value="SIGNUP" Text="SIGNUP" CssClass="signupButton" runat="server" ID="signUpButton" OnClick="signUpButton_Click"/>
        <%--<asp:Button type="button" value="SIGNUP" class="signupButton" />--%>
        



      <%--<!-- This asks users whether they are student or university -->
      <div id="modal1" class="modal">
        
        <div class="modal-content">
          <h4 class="primary-font">Help us learn more about you.</h4>
          <p>Are you are student or a university?</p>
        </div>

        <div class="modal-footer ">
          
          <!--is student-->
          <a href="studentSignup.aspx">
            <input type="submit" value="STUDENT" class="modal-close waves-effect btn waves-green primary-font"/>
          </a>

          <!--is uni-->
          <a href="uniSignup.aspx">
            <input type="submit" value="UNIVERSITY" class="modal-close waves-effect btn waves-green primary-font"/>
          </a>

        </div>
      
      </div>--%>



      <%--<!--Handling login and signup actions-->
      <script type="text/javascript">

        $(document).ready(()=>{

          $('.modal').modal();

        });

        $('.signupButton').on('click', ()=>{

          $('.modal').modal('open');

        });
      
      </script>--%>



    </div>

  </header>

  <main>


    <section class="coverImageSection">


        <div class="row container">
          
          <div class="col s12 m6 l6">

            <h3 class="infoTitle">Jamya - Your solution to university applications.</h3>
            <p class="infoDesc">Join the ever-growing network of universities and students to find your perfect match!</p>

          </div>

          <div class="col m6 l6 hide-on-small-only" style="text-align: center;">

            <img src="assets/simple_cyan_jamya_logo.png" alt="Cover Image" class="coverImage" draggable="false"/>

          </div>

        </div>

    </section>


    <section class="faqContainer">


      <article class="row faq container">

        <div class="faqQuestion col s12">
          <h5>
            What is Jamya?
          </h5>
        </div>
        
        <div class="faqAnswer col s12">
          Jamya is an online platform that makes it convenient for students to apply to hundreds of universities with a single click. You can fill your details once and then apply to as many universities as you want without being consistently bothered.
        </div>

      </article>


      <article class="row faq container">

        <div class="faqQuestion col s12">
          <h5>
            Who can use Jamya?
          </h5>
        </div>
        
        <div class="faqAnswer col s12">
          Jamya is very simple to use and allows you to join either as a university or as a student. If you join as a student, you can apply to multiple universities by filling only a single application.
          As a university, you have access to our top of the line tools for evaluating students and making sure you select on merit.
          <br><br>
          You can join Jamya with the following steps.
        </div>

      </article>

      <article class="stepsContainer">

        <div>
          <i class="material-icons big">account_circle</i>
          <div>Create an <br>account.</div>
        </div>

        <div>
          <i class="material-icons direction">east</i>
        </div>

        <div>
          <i class="material-icons big">grading</i>
          <div>Fill applications / <br> View students.</div>
        </div>

        <div>
          <i class="material-icons direction">east</i>
        </div>

        <div>
          <i class="material-icons big">task</i>
          <div>Send applications / <br> Accept or Reject students.</div>
        </div>

      </article>


      <article class="preFooter row">

        <div class="rightPanel col s12 m4">

          <h5>Find your right match!</h5>

          <!--Sign up button-->
          <input type="button" value="CREATE ACCOUNT" class="signupButton">

        </div>

        <div class="leftPanel col s12 m8">


        </div>


      </article>




    </section>


  </main>



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


</form>

  
</body>
</html>