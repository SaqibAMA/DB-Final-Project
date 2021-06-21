<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="review_applications.aspx.cs" Inherits="WebApplication1.review_applications" %>

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

  <title>Review Applications | Jamya</title>

  <!--Css-->
  <link href="css/review_apps.css" rel="stylesheet" runat="server" />


</head>
<body class="bg-dark">
    <form id="reviewApplicationsForm" runat="server">


                <ul id="slide-out" class="sidenav sidenav-fixed bg-dark">
            
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
                        <asp:Label CssClass="white-text name" 
                            runat="server"
                            Text="Username"
                            ID="username">
                        </asp:Label>

                        
                        <asp:Label CssClass="white-text email" 
                            runat="server"
                            Text="user@email.com"
                            ID="useremail">
                        </asp:Label>

                    
                    </a>
                </div>
            </li>
            <li>
                <a href="dashboard.aspx" class="white-text uniOption modal-trigger"
                    data-target="notificationModal">
                    <i class="material-icons white-text">dashboard</i>
                    DASHBOARD
                 </a>
            </li>
            <li>
                <a href="chat.aspx" class="white-text">
                    <i class="material-icons white-text">chat</i>
                    CHAT
                 </a>
            </li>
            <li>
                <a href="promote.aspx" class="white-text">
                    <i class="material-icons white-text">military_tech</i>
                    PROMOTE
                 </a>
            </li>
            <li>
                <a href="contact.aspx" class="white-text">
                    <i class="material-icons white-text">help</i>
                    HELP
                 </a>
            </li>
            <li>
                <a href="logout.aspx" class="white-text">
                    <i class="material-icons white-text">logout</i>
                    LOGOUT
                 </a>
            </li>



        </ul>


        <div class="main-content">




            <div class="container">

                <h3>Under Review</h3>

                <table>


                    <asp:Label Text="No applications under review." 
                        runat="server"
                        ID="noURAppsLabel"/>


                    <asp:Repeater runat="server" ID="underReviewApps">

                        <HeaderTemplate>

                            <thead>
                                <tr class="white-text">
                                    <td>Name</td>
                                    <td>Major</td>
                                    <td>Matric</td>
                                    <td>Intermediate</td>
                                    <td>Undergraduate</td>
                                    <td>Decision</td>
                                </tr>
                            </thead>

                        </HeaderTemplate>
                    
                        <ItemTemplate>


                            <tr class="grey-text">
                                <td><%#Eval("StdName") %></td>
                                <td><%#Eval("MajorName") %></td>
                                <td><%#Eval("Matric") %>%</td>
                                <td><%#Eval("Intermediate") %>%</td>
                                <td>-</td>
                                <td>

                                    <asp:LinkButton
                                        runat="server"
                                        CssClass="btn green white-text"
                                        OnClick="acceptBtn_Click">
                            
                                        <i class="material-icons center">
                                            done
                                        </i>

                                    </asp:LinkButton>

                                    <asp:LinkButton
                                        runat="server"
                                        CssClass="btn red white-text"
                                        OnClick="rejectBtn_Click">
                            
                                        <i class="material-icons center">
                                            clear
                                        </i>

                                    </asp:LinkButton>
                                </td>
                            </tr>


                        </ItemTemplate>
                    
                    
                    </asp:Repeater>






                </table>


            </div>




        </div>



    </form>
</body>
</html>
