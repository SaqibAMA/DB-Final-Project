<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applications.aspx.cs" Inherits="WebApplication1.applications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!--Google Fonts-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;500&family=Poppins:wght@500;600&display=swap"
    rel="stylesheet">

  <!--jQuery for Interaction-->
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <!--Materialize-->

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <!-- Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


  <!--favicon-->
  <link rel="shortcut icon" href="assets/simple_cyan_jamya_logo.png" type="image/x-icon" />

  <title>Your Applications | Jamya</title>

  <!--Css-->
  <link href="css/applications.css" rel="stylesheet" runat="server" />



</head>
<body class="bg-dark">
    <form id="viewApplicationForm" runat="server" method="get">
    
        <ul id="slide-out" class="bg-dark sidenav sidenav-fixed">
            
            <!--Replace this with Username-->
            <li> 
                <div class="user-view">
                    <div class="background">
                        <img
                            src="assets/application-header.jpg" 
                            alt="BG" />
                    </div>
                    <a href="#">
                        <img
                            class="circle z-depth-4"
                            src="assets/dp.jpg"
                            alt="DP" />
                    </a>
                    <a href="#">
                        <span class="white-text name">
                            Saqib Ali
                        </span>
                        <span class="white-text email">
                            saqib@gmail.com
                        </span>
                    </a>
                </div>
            </li>


            <li>
                <a href="dashboard.aspx" class="white-text">
                    <i class="white-text material-icons">person</i>
                    DASHBOARD
                 </a>
            </li>
            <li>
                <a href="search.aspx" class="white-text">
                    <i class="white-text material-icons">search</i>
                    SEARCH UNIVERSITIES
                 </a>
            </li>
            <li>
                <a href="#" class="white-text">
                    <i class="white-text material-icons">notifications</i>
                    NOTIFICATIONS
                 </a>
            </li>
            <li>
                <a href="#" class="white-text">
                    <i class="white-text material-icons">chat</i>
                    CHAT
                 </a>
            </li>
            <li>
                <a href="contact.aspx" class="white-text">
                    <i class="white-text material-icons">help</i>
                    HELP
                 </a>
            </li>

        </ul>

        <div class="row main-content">

          <div class="carousel carousel-slider center s12">
            <div class="carousel-fixed-item center">
              <a href="search.aspx" 
                  class="btn waves-effect green white-text darken-text-2">APPLY</a>
            </div>
            <div class="carousel-item red white-text" href="#one!"
                style="background-image: url('assets/universities/fast.jpg');
                        background-size: cover; background-repeat: no-repeat;" >
              <h2 class="black-text">Ready to explore FAST-NUCES?</h2>
            </div>

            <div class="carousel-item red white-text" href="#one!"
                style="background-image: url('assets/universities/nust.jpg');
                        background-size: cover; background-repeat: no-repeat;" >
              <h2 class="black-text">Lumber 1 University of Pakistan. Apply right now!</h2>
            </div>

            <div class="carousel-item red white-text" href="#one!"
                style="background-image: url('assets/universities/lums.jpg');
                        background-size: cover; background-repeat: no-repeat;" >
              <h2 class="black-text">Interested in business? We have the right match!</h2>
            </div>

          </div>

            <div class="col s12 l8 m12">

                <div class="container">

            <div class="row">

                <h3 class="col s12">Your Applications</h3>

            </div>

            <ul class="row application-tab" id="sortable">



                <asp:Repeater runat="server" ID="applist">


                    <ItemTemplate>

                       <li class="col s12 row application valign-wrapper bg-dark-1">

                            <div class="col s8">
                                <%#Eval("Name") %> - <span class="grey-text"><%#Eval("MajorName") %></span> 
                            </div>

                            <div class="col s2">
                                <asp:LinkButton OnClick="editApplication_Click"
                                    runat="server">
                                    <i class="material-icons">edit</i>
                                </asp:LinkButton>
                            </div>

                            <div class="col s2">
                               <asp:LinkButton OnClick="deleteApplication_Click"
                                    runat="server" data=<%#Eval("ApplicationID") %> >
                                    <i class="material-icons">delete</i>
                                </asp:LinkButton>
                            </div>

                        </li>

                    </ItemTemplate>


                </asp:Repeater>






            </ul>

            <script type="text/javascript">

                $(document).ready(() => {

                    $("#sortable").sortable();
                    $("#sortable").disableSelection();

                });

            </script>

        </div>
    
            </div>

            <div class="col s12 m12 l4 suggestion-panel">

                <div class="container">

                    <h4>Suggestions</h4>

                    <br />
                    <br />

                    <!--Suggestions List-->

                    <ul class="collection">
                        
                        <li class="collection-item avatar bg-dark">
                            <img
                                src="assets/simple_cyan_jamya_logo.png"
                                alt="University Logo"
                                class="circle" draggable="false" />
                            <span class="title">NUST</span>
                            <p>Similar Programs</p>
                        </li>
                        
                        <li class="collection-item avatar bg-dark">
                            <img
                                src="assets/simple_cyan_jamya_logo.png"
                                alt="University Logo"
                                class="circle" draggable="false" />
                            <span class="title">LUMS</span>
                            <p>Similar Programs</p>
                        </li>

                        
                        <!--Promotions List-->


                        <li class="collection-item avatar bg-dark">
                            <img
                                src="assets/simple_cyan_jamya_logo.png"
                                alt="University Logo"
                                class="circle" draggable="false" />
                            <span class="title">NUST</span>
                            <p class="grey-text">Sponsored</p>
                        </li>
                        
                        <li class="collection-item avatar bg-dark">
                            <img
                                src="assets/simple_cyan_jamya_logo.png"
                                alt="University Logo"
                                class="circle" draggable="false" />
                            <span class="title">LUMS</span>
                            <p class="grey-text">Sponsored</p>
                        </li>


                    </ul>



                </div>


            </div>


        </div>

        <script type="text/javascript">

            $('.sidenav').sidenav();

            $('.carousel.carousel-slider').carousel({
                fullWidth: true,
                indicators: true
            });

        </script>

    </form>

</body>
</html>


