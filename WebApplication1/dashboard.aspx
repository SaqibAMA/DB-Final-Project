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
                <a href="profile.aspx?id=<%=Session["accID"]%>" class="white-text">
                    <i class="material-icons white-text">person</i>
                    PROFILE
                 </a>
            </li>
            <li>
                <a href="search.aspx" class="white-text stdOption">
                    <i class="material-icons white-text">search</i>
                    SEARCH UNIVERSITIES
                 </a>
            </li>
            <li>
                <a href="#" class="white-text uniOption">
                    <i class="material-icons white-text">notifications</i>
                    SEND NOTIFICATION
                 </a>
            </li>
            <li>
                <a href="chat.aspx" class="white-text">
                    <i class="material-icons white-text">chat</i>
                    CHAT
                 </a>
            </li>
           <li>
                <a href="applications.aspx" class="white-text stdOption">
                    <i class="material-icons white-text">linear_scale</i>
                    APPLICATIONS
                 </a>
            </li>
            <li>
                <a href="#" class="white-text stdOption modal-trigger"
                    data-target="marksUpdateModal">
                    <i class="material-icons white-text">info</i>
                    UPDATE INFORMATION
                 </a>
            </li>
            <li>
                <a href="applications.aspx" class="white-text uniOption">
                    <i class="material-icons white-text">linear_scale</i>
                    REVIEW APPLICATIONS
                 </a>
            </li>
            <li>
                <a href="promote.aspx" class="white-text uniOption">
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

            <script type="text/javascript">



                $(document).ready(() => {

                    const Student = 1;
                    const University = 0;

                    var isStudent = <%=Session["type"]%>;


                    if (isStudent) {

                        $('.uniOption').addClass('hide');

                    }
                    else {

                        $('.stdOption').addClass('hide');

                    }


                });



            </script>


        </ul>



        <div class="main-content">
            


            <div class="row container">

                <h4 class="col s12">Stories</h4>

                <div class="col m12 hide-on-small-only">
                      <div class="carousel">

                          <asp:Label Text="No stories yet. Check again later." 
                              ID="noStoriesLabel" 
                              runat="server" />

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

                    <asp:Label Text="No notifications yet." ID="noNotifsLabel" runat="server" />

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
                    <i class="large material-icons">add</i>
                  </a>
                    <ul>
                        <li>
                            <a class="btn-floating green modal-trigger" data-target="postAddModal">
                                <i class="material-icons">edit</i>
                            </a>
                        </li>
                        <li>
                            <a class="btn-floating green modal-trigger" data-target="storyModal">
                                <i class="material-icons">history_toggle_off</i>
                            </a>
                        </li>
                    </ul>

                </div>

                <h4 class="col s12">Recent Posts</h4>

                <ul class="collection">

                    <asp:Label Text="You haven't posted anything yet. Try it out by clicking on the icon below!"
                        ID="noPostsLabel" runat="server" />

                    <asp:Repeater runat="server" ID="posts">

                        <ItemTemplate>

                            <li class="collection-item bg-dark-1">
                                <p>
                                    <%#Eval("PostContent") %>
                                </p>
                                <span class="title grey-text"> @<%#Eval("Username") %> </span>
                                    
                                    <asp:LinkButton
                                        runat="server"
                                        OnClick="deletePost_Click"
                                        data=<%#Eval("PostID")%>>
                                            <i class="material-icons right">delete</i>
                                    </asp:LinkButton>

                            </li>

                        </ItemTemplate>

                    </asp:Repeater>


                </ul>


            </div>



        </div>

        <!--Modals-->
        <div id="storyModal" class="modal bg-dark">
        <div class="modal-content">
            <h4>Have something quick to share?</h4>
            <p>Stories are a way for you to share your ideas with everyone!</p>
            <p class="red-text">Caution: You cannot delete stories!</p>

        <asp:TextBox
            runat="server"
            ID="storyText"
            TextMode="MultiLine"
            placeholder="Write away..."
            Rows="10"
            class="materialize-textarea txt-field white-text"
            maxlength="200"
        ></asp:TextBox>

        </div>
        <div class="modal-footer bg-dark">
            <asp:LinkButton runat="server"
                ID="addStory"
                OnClick="addStory_Click"
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
                class="modal-close btn waves-effect white waves-green black-text"
                runat="server"
                ID="addPost"
                onclick="addPost_Click"/>
        </div>
        </div>





        <!--marks update modal-->
        <div id="marksUpdateModal" class="modal bg-dark">
        <div class="modal-content">
            <h4>Update your marks.</h4>
            <p>Put your best foot forward by keeping
                your information up to date!
            </p>
            
            <div class="grey-text">

                <p class="chip">Matric: <asp:Label Text="1" runat="server" ID="matricMarks" /> </p>
                <p class="chip">Intermediate: <asp:Label Text="1" runat="server" ID="interMarks" /> </p>
                <p class="chip">Undegraduate: <asp:Label Text="1" runat="server" ID="ugMarks" /> </p>
                
            </div>


            <table>
                <tr>
                    <td>
                        Matric (%)
                    </td>
                    <td>
                        <asp:TextBox 
                            runat="server" 
                            ID="matricInput" 
                            TextMode="Number"
                            class="validate white-text"
                            max="100"
                            step="0.5"
                            min="1"
                         />
                    </td>
                </tr>
                <tr>
                    <td>
                        Intermediate (%)
                    </td>
                    <td>
                        <asp:TextBox 
                            runat="server" 
                            ID="interInput" 
                            TextMode="Number"
                            class="validate white-text"
                            max="100"
                            step="0.5"
                            min="1"
                         />
                    </td>
                </tr>
                <tr>
                    <td>
                        Undergraduate (CGPA)
                    </td>
                    <td>
                        <asp:TextBox 
                            runat="server" 
                            ID="ugInput" 
                            Text="0" 
                            TextMode="Number"
                            class="validate white-text"
                            max="4"
                            step="0.1"
                            min="1"
                         />
                    </td>
                </tr>
            </table>


        </div>
        <div class="modal-footer bg-dark">
            <asp:LinkButton runat="server"
                ID="updateMarks"
                OnClick="updateMarks_Click"
                class="modal-close btn waves-effect white waves-green black-text">
                SUBMIT <i class="material-icons left">send</i>
            </asp:LinkButton>
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


</body>
</html>
