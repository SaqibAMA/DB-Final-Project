<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentProfile.aspx.cs" Inherits="WebApplication1.studentProfile" %>

<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student | Jamya | Find your ideal university</title>

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
  <link rel="stylesheet" href="css/student.css">


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

            <img src="assets/student_dp.png" alt="Profile Picture" class="profileImage" draggable="false" />

          </div>
        </div>


        <%--<h3 class="center-align profileName">Saqib Ali</h3>--%>
            <h3 class="center-align profileName"><asp:Label ID="lblUserName" runat="server" Text="Saqib Ali"></asp:Label></h3>


        <div class="profileTags center-align container">

          <div class="chip">Lahore</div>
          <div class="chip">FAST-NUCES</div>
          <div class="chip">Male</div>
          <div class="chip">CS</div>
          <div class="chip">AI</div>

        </div>


        <div class="recentApplication container">


          <ul class="collection">



            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">FAST-NUCES</span>

              <p>August 2021</p>
              <p>BS(CS)</p>

            </li>

            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">LUMS</span>

              <p>July 2021</p>
              <p>BS(EE)</p>

            </li>

            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">Cheems University</span>

              <p>August 2021</p>
              <p>Bachelors in Cheemsology</p>

            </li>

            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">NUST</span>

              <p>August 2021</p>
              <p>BS(SE)</p>

            </li>

            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">Shadrah National University</span>

              <p>March 2020</p>
              <p>Bachelors in Ghareebology</p>

            </li>

            <li class="collection-item avatar">
              
              <img src="assets/simple_cyan_jamya_logo.png" alt="LOGO" class="circle" draggable="false"/>

              <span class="title">Beegh University</span>

              <p>August 2021</p>
              <p>Bachelors in Simping</p>

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

            <p>Hey, my name is Saqib Ali and I am a computer science student who is looking to get admitted into a university. I have interest in web development and software development. Previously, I have worked on developing Jamya along with my friend in a group project. Other than that, I am very interested in Cheemsology and finding solution of Shadrah.</p>

          </div>


          <div>

            <h6 class="center-align level-2 sub-heading">ACTIONS</h6>


            <div class="row iconsRow">

              <div class="col s12 m4">
                <div class="infoCard card">
                  <p class="cardTitle center-align truncate">APPLICATION</p>
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
                  <p class="cardTitle center-align">ALERTS</p>
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
                  <p class="cardTitle center-align truncate">STATUS</p>
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


            <h6 class="center-align level-2 sub-heading">RECENT</h6>



            <div class="row">

              <div class="col s12">
                <div class="infoCard card infoCard--extend">
                  <p class="cardTitle left-align primary-font truncate">"What is the admission fee for NUST?"</p>
                  <p class="cardDesc left-align primary-font">
                    <div class="chip" style="margin-left: 1rem;">Saqib Ali</div>
                    <div class="chip">NUST</div>
                  </p>
                </div>
              </div>

              <div class="col s12">
                <div class="infoCard card infoCard--extend">
                  <p class="cardTitle left-align primary-font truncate">"Is everyone enjoying their Eid holidays? I am not."</p>
                  <p class="cardDesc left-align primary-font">
                    <div class="chip" style="margin-left: 1rem;">Saqib Ali</div>
                    <div class="chip">FAST</div>
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
