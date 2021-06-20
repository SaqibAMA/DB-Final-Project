<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebApplication1.profile" %>

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

  <title>Profile | Jamya</title>

  <!--Css-->
  <link href="css/profile.css" rel="stylesheet" runat="server" />


</head>
<body class="bg-dark-1">
    <form id="profileForm" runat="server">
        

        <div class="white-text bg-dark nav">

            <div class="row valign-wrapper center">

                <div class="col s12 m2 center">
                    <a href="dashboard.aspx">
                    <img src="assets/simple_cyan_jamya_logo.png"
                        alt="Logo" class="circle "
                        style="width: 100%; max-width: 5rem" />
                    </a>
                </div>

                <a href="search.aspx" class="btn-flat col s2 hide-on-small-only">
                    SEARCH
                </a>
                <a href="dashboard.aspx" class="btn-flat col s2 hide-on-small-only">
                    DASHBOARD
                </a>
                <a href="contact.aspx" class="btn-flat col s2 hide-on-small-only">
                    CONTACT
                </a>
                <a href="applications.aspx" class="btn-flat col s2 hide-on-small-only">
                    APPLICATIONS
                </a>
                <a href="chat.aspx" class="btn-flat col s2 hide-on-small-only">
                    CHAT
                </a>


            </div>

        </div>


        <div class="row white-text" style="max-width: 1024px; padding: 0 1rem !important;">

            <div class="container row col m8 s12">
                
                <div class="profile-header col s12">

                    <img src="assets/simple_cyan_jamya_logo.png"
                        class="white z-depth-2 profile-img"
                        alt="Alternate Text"
                        style="max-width: 6rem;"
                        draggable="false"/>

                    <div class="black-text profile-info">

                        <h4 class="profile-name white-text"
                            style="text-shadow: 3px 3px black">
                            <asp:Label 
                                runat="server" 
                                Text="Profile Name" 
                                ID="profileName">
                            </asp:Label>
                        </h4>
                        <p class="join-date grey-text">
                            <span class="chip green z-depth-2">
                                    <asp:Label Text="0" runat="server" ID="typeLabel" />
                            </span> 
                            <span class="chip green z-depth-2"> 
                                <asp:Label Text="0" ID="postCount" runat="server" /> posts 
                            </span> 
                        </p>

                    </div>

                </div>

                <div class="posts-list col s12">

                    <ul class="collection with-header">
                        <li class="collection-header">
                            <h5>Posts</h5>
                        </li>


                        <asp:Repeater
                            runat="server"
                            ID="posts">

                            <ItemTemplate>

                                <li class="collection-item">
                                    <p> <%#Eval("PostContent") %></p>
                                    <p class="grey-text">@<%#Eval("Username") %></p>
                                </li>

                            </ItemTemplate>

                        </asp:Repeater>


                        


                    </ul>

                </div>

            </div>

            <div class="container row col m4 s12 profile-info white-text"
                style="padding-top: 0 !important;">

                <ul class="collection with-header bg-dark no-margin">
                    <li class="collection-header">
                        <h5>Recent Applications</h5>
                    </li> 
                    

                    <asp:Repeater runat="server"
                        ID="recentApps">

                        <ItemTemplate>

                            <li class="collection-item avatar">
                        
                                <img src="assets/simple_cyan_jamya_logo.png"
                                    class="circle"/>
                                <span class="title"> 
                                    <a href="profile.aspx?id=<%#Eval("ID") %>"> <%#Eval("Name") %>
                                    </a>
                                </span>
                                <p class="grey-text"> Applied for <%#Eval("MajorName") %> </p>

                            </li>

                        </ItemTemplate>

                    </asp:Repeater>



                </ul>

                <br />


                <asp:LinkButton 
                    ID="applyBtn"
                    OnClick="applyBtn_Click"
                    runat="server"
                    CssClass="btn green col s12"
                    style="border-radius: 0.5rem"
                    >
                    APPLY
                </asp:LinkButton>


                <script type="text/javascript">

                    const getUrlParameter = (sParam)=> {
                        var sPageURL = window.location.search.substring(1),
                            sURLVariables = sPageURL.split('&'),
                            sParameterName,
                            i;

                        for (i = 0; i < sURLVariables.length; i++) {
                            sParameterName = sURLVariables[i].split('=');

                            if (sParameterName[0] === sParam) {
                                return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                            }
                        }
                        return false;
                    };

                    if ($('#typeLabel').html() == "University") {

                        $('#applyBtn').attr('data', getUrlParameter('id'));

                    }
                    else {

                        $('#applyBtn').addClass('hide');

                    }

                </script>


            </div>


        </div>

    </form>
</body>
</html>
