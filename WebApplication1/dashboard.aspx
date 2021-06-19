<%@ Page Language="C#"
    AutoEventWireup="true" 
    CodeBehind="dashboard.aspx.cs" 
    Inherits="WebApplication1.dashboard" %>

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

  <title>Dashboard | Jamya</title>

  <!--Css-->
  <link href="css/dashboard.css" rel="stylesheet" runat="server" />


</head>
<body class="bg-dark white-text">

    <form id="dashboardForm" runat="server" method="post">
        

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
                <a href="search.aspx" class="white-text">
                    <i class="material-icons white-text">search</i>
                    SEARCH UNIVERSITIES
                 </a>
            </li>
            <li>
                <a href="#" class="white-text">
                    <i class="material-icons white-text">notifications</i>
                    NOTIFICATIONS
                 </a>
            </li>
            <li>
                <a href="chat.aspx" class="white-text">
                    <i class="material-icons white-text">chat</i>
                    CHAT
                 </a>
            </li>
           <li>
                <a href="applications.aspx" class="white-text">
                    <i class="material-icons white-text">linear_scale</i>
                    APPLICATIONS
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
            


            <div class="row container">

                <h4 class="col s12">Stories</h4>

                <div class="col m12 hide-on-small-only">
                      <div class="carousel">

                          <asp:Repeater runat="server" ID="stories">


                              <ItemTemplate>
  
                                <div class="carousel-item green">
                                    <%#Eval("Content") %>
                                </div>

                              </ItemTemplate>


                          </asp:Repeater>


                      </div>
                </div>

                <h4 class="col s12">Notifications</h4>

                <ul class="collection">

                    <asp:Repeater runat="server" ID="notifs">


                        <ItemTemplate>
                            
                            <li class="collection-item notification bg-dark-1"
                                onclick="addClass('hide');">
                                <span class="title grey-text">Notification #<%# Container.ItemIndex + 1 %></span>                        
                                <p><%#Eval("textContent") %></p>
                            </li>

                        </ItemTemplate>


                    </asp:Repeater>
                
                
                </ul>


                <div class="fixed-action-btn">
                  <a class="btn-floating btn-large green">
                    <i class="large material-icons">mode_edit</i>
                  </a>
                  <ul>
                    <li>
                        <a class="btn-floating green darken-2 modal-trigger"
                            data-target="postAddModal">
                            <i class="material-icons">post_add</i>
                        </a>
                    </li>
                  </ul>
                </div>

                <h4 class="col s12">Recent Posts</h4>

                <ul class="collection">


                    <asp:Repeater runat="server" ID="posts">

                        <ItemTemplate>

                            <li class="collection-item bg-dark-1">
                                <p>
                                    <%#Eval("PostContent") %>
                                </p>
                                <span class="title grey-text"> @<%#Eval("Username") %> </span>
                            </li>

                        </ItemTemplate>

                    </asp:Repeater>


                </ul>


            </div>



        </div>

        <!--Modals-->
        <div id="uniReviewModal" class="modal bg-dark">
        <div class="modal-content">
            <h4>Add University Review</h4>
            <p>Want to let people know your experience with a university?</p>
            <p>Share your feedback and let other people know.</p>

        <asp:TextBox
            runat="server"
            ID="uniReview"
            TextMode="MultiLine"
            placeholder="Your review..."
            Rows="10"
            class="materialize-textarea txt-field white-text"
            maxlength="200"
        ></asp:TextBox>

        </div>
        <div class="modal-footer bg-dark">
            <asp:LinkButton runat="server"
                ID="postUniReview"
                OnClick="postUniReview_Click"
                class="modal-close btn waves-effect white waves-green black-text">
                POST <i class="material-icons left">send</i>
            </asp:LinkButton>
        </div>
        </div>

        <div id="postAddModal" class="modal bg-dark">
        <div class="modal-content">
            <h4>Share your thoughts with the world!</h4>

        <asp:TextBox
            runat="server"
            ID="postText"
            TextMode="MultiLine"
            placeholder="What's on your mind?"
            Rows="10"
            class="materialize-textarea txt-field white-text"
            maxlength="200"
        ></asp:TextBox>

        </div>
        <div class="modal-footer bg-dark">
            

            <asp:Button Text="SEND"
                class="btn waves-effect white waves-green black-text"
                runat="server"
                ID="addPost"
                onclick="addPost_Click"/>
        </div>
        </div>

    </form>



    <script type="text/javascript">

        $(document).ready(function () {
            $('.carousel').carousel({
                numVisible: 10
            });
            $('.fixed-action-btn').floatingActionButton();
            $('.modal').modal();
        });

    </script>

<script runat="server">

    public void postUniReview_Click(object sender, EventArgs e)
    {
        String review = (String) uniReview.Text;
        Response.Write(review);
    }

    public void postAdd_Click(object sender, EventArgs e)
    {
        String post = (String) postText.Text;
        Response.Write(post);
    }

</script>

</body>
</html>
