<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>University Signup | Jamya | Find your ideal university</title>

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
  <link rel="stylesheet" href="css/signup-choice.css">


  <link rel="shortcut icon" href="assets/simple_cyan_jamya_logo.png" type="image/x-icon" />

</head>
<body>

<form action="" method="POST" runat="server">


  <main>

    
    <div class="topSection">

      <div class="container">

        <div class="center-align topLogo">
          <img src="assets/simple_cyan_jamya_logo.png" alt="Top Logo" draggable="false">
        </div>
        
        <h3 class="center-align">Help us understand your better.</h3>

        <h3 class="center-align">Are you a student or a university?</h3>
      
      </div>

    </div>


    <div class="bottomSection">

      <div class="container center-align">

        <div class="row choiceTray">

          <div class="col s12 m6 center-align">


            <div class="material-icons large">face</div>
              <a href="studentSignup.aspx">
            <input type="button" value="STUDENT" class="choiceButton" />
                  </a>
          
          </div>

          <div class="col s12 m6 center-align">


            <div class="material-icons large">school</div>
              <a href="uniSignup.aspx">
            <input type="button" value="UNIVERSITY" class="choiceButton" />
                  </a>
          
          </div>

        </div>

      </div>

    </div>


    <div class="scroll">

      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>

    </div>

    

  </main>


</form>

</body>
</html>