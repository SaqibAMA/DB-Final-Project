<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uniProfile.aspx.cs" Inherits="WebApplication1.uniProfile" %>

<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>University | Jamya | Find your ideal university</title>

  <!--Google Fonts-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;500&family=Poppins:wght@300;500;600&display=swap"
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
  <link rel="stylesheet" href="css/university.css">

  <link rel="shortcut icon" href="assets/simple_cyan_jamya_logo.png" type="image/x-icon" />


</head>
<body>

<form action="" method="POST" runat="server">



  <!--Side navigation-->
  <div class="col sidenav">

    hello world

  </div>

  <main>

    <div class="row">

      <!--Profile Section-->
      <div class="col s12 m5 xl3 profileSection">


        <div class="profileImageBorder card container">
          <div class="profileImageContainer container">

            <img src="assets/uni-dp.jpg" alt="Profile Picture" class="profileImage" draggable="false" />

          </div>
        </div>


        <%--<h3 class="center-align profileName">FAST-NUCES</h3>--%>
    <h3 class="center-align profileName"><asp:Label ID="uniName" runat="server" Text="FAST-NUCES"></asp:Label></h3>


        <div class="profileTags center-align container">

          <div class="chip">Lahore</div>

        </div>


        <div class="recentApplication container">


          <ul class="collection">



            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">BS (CS)</span>

              <p>#1 in Rankings</p>
              <p>by Jamya</p>

            </li>

            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">BS (EE)</span>

              <p>#1 in Rankings</p>
              <p>by Jamya</p>

            </li>
             


            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">BS (AI)</span>

              <p>#3 in Rankings</p>
              <p>by Jamya</p>

            </li>

               <li class="collection-item center-align">
           

    <asp:Button CssClass="btn" ID="logout" runat="server" Text="LOGOUT" OnClick="logout_Click" />

            </li>
          </ul>


        </div>



      </div>


      <!--Profile Details Section-->
      <div class="col s12 m7 l7 profileDetails">

        <div class="container">

          <div class="searchBarContainer input-field">

            <!-- <i class="material-icons prefix">search</i> -->
            <input type="text" name="search" placeholder="Search universities or people..." id="search" class="searchBar primary-font" style="color: black !important; font-weight: bolder;"/>

          </div>


          <div>
            
            <h6 class="center-align level-2 allcap">INFORMATION</h6>

            <p>The National University of Computer and Emerging Sciences (Initials: NUCES) (Urdu: قومی جامعہ برائے کمپیوٹر و علومِ ظہوری سائنس‎), also commonly known as "Foundation for Advancement of Science and Technology" (FAST), (Urdu: دانش گاہِ اساسی برائے ارتقائے سائنس و علومِ فنون‎) is a private research university with multiple campuses system in Pakistan.</p>

          </div>


          <div>

            <h6 class="center-align level-2 sub-heading">ACTIONS</h6>


            <div class="row iconsRow">

              <div class="col s12 m4">
                <div class="infoCard card">
                  <p class="cardTitle center-align truncate">APPLICATIONS</p>
                  <p class="cardDesc center-align">
                    <img src="assets/icons/application_icon.png" alt="Fill Application" draggable="false" class="navigation-icon" />
                  </p>
                </div>
              </div>

              <div class="col s12 m4">
                <div class="infoCard card">
                  <p class="cardTitle center-align truncate">MESSAGES</p>
                  <p class="cardDesc center-align">
                    <img src="assets/icons/icons8-multiple-messages-96.png" alt="Messages" draggable="false" class="navigation-icon" />
                  </p>
                </div>
              </div>

              <div class="col s12 m4">
                <div class="infoCard card">
                  <p class="cardTitle center-align">SEND ALERT</p>
                  <p class="cardDesc center-align">
                    <img src="assets/icons/icons8-notification-64.png" alt="Notifications" draggable="false" class="navigation-icon" />
                  </p>
                </div>
              </div>


            </div>


            <h6 class="center-align level-2 sub-heading">PERSONAL</h6>


            <div class="row iconsRow">

              <div class="col s12 m4">
                <div class="infoCard card">
                  <p class="cardTitle center-align truncate">ACCOUNT</p>
                  <p class="cardDesc center-align">
                    <img src="assets/icons/icons8-account-100.png" alt="Fill Application" draggable="false" class="navigation-icon" />
                  </p>
                </div>
              </div>

              <div class="col s12 m4">
                <div class="infoCard card">
                  <p class="cardTitle center-align truncate">REVIEW</p>
                  <p class="cardDesc center-align">
                    <img src="assets/icons/icons8-check-64.png" alt="Messages" draggable="false" class="navigation-icon" />
                  </p>
                </div>
              </div>

              <div class="col s12 m4">
                <div class="infoCard card">
                  <p class="cardTitle center-align">HELP</p>
                  <p class="cardDesc center-align">
                    <img src="assets/icons/icons8-help-64.png" alt="Notifications" draggable="false" class="navigation-icon" />
                  </p>
                </div>
              </div>


            </div>

          </div>
          

        </div>

      </div>


    </div>

  </main>


</form>

</body>
</html>