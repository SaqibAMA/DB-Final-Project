<%@ Page Language="C#" 
    AutoEventWireup="true" 
    CodeFile="chat.aspx.cs" 
    Inherits="WebApplication1.chat" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!--Google Fonts-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;500&family=Poppins:wght@500;600&display=swap"
    rel="stylesheet">

  <!--jQuery for Interaction-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  

  <title>Chat | Jamya</title>

  <!--Materialize-->

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <!-- Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


  <!--CSS-->
  <link rel="stylesheet" href="css/chat.css" />

</head>
<body>
<form action="" method="POST" runat="server">
  <main>


    <aside class="hide-on-small-only sidepanel">


      <div class="info-card">
          
          <asp:Label Text="User" runat="server" ID="topUsername" CssClass="username"/>

      </div>

      <div class="row question-statement">


        <h3>Have questions about universities? <br><br> Ask them here and find your answers!</h3>

      </div>

        <div class="row">


            <a class="btn btn-flat white-text" href="dashboard.aspx">
                <i class="material-icons left">west</i> 
                BACK TO DASHBOARD
            </a>

        </div>



    </aside>


    <section class="chat-section">


      <section class="chat-body">

        
        <section class="messages container">


            <asp:Repeater ID="messages" runat="server">

                <ItemTemplate>

                  <div class="row">
          
                    <div class="col s10 message
                         <%# (Convert.ToInt32(Session["accID"]) == Convert.ToInt32(Eval("AccountID"))) ? 
                            "sent" : 
                            "received" %>">

                      <p class="text">
                         <%#Eval("MessageText")%>  
                      </p>
                      <p class="author">by @<%#Eval("Username")%> -  <%#Eval("SentTime")%>  </p>

                    </div>

                  </div>
                
                </ItemTemplate>

            </asp:Repeater>




        </section>


        <section class="input-panel">

          <div class="row container valign-wrapper center-align">
            
            <div class="col s10">
              
              <div class="input-field">

                <asp:TextBox ID="messagebox" name="messagebox" class="form-control" runat="server"></asp:TextBox> 
                <label for="messagebox">What's on your mind?</label>
              </div>
            
            </div>

            <div class="col s2">
              
              <asp:LinkButton 
                  CssClass="btn" 
                  ID="sendbtn" 
                  runat="server" 
                  OnClick="sendbtn_Click"
                  OnClientClick="sendMessage()">
                  <i class="material-icons left">send</i>
              </asp:LinkButton>


              <script type="text/javascript">

                $('.messages').animate({ scrollTop: 9999 }, 'slow');

                  const sendMessage = () => {

                      var msg =
                          `
                          <div class="row">

                            <div class="col s10 message sent">

                              <p class="text">${$('#messagebox').val()}</p>
                              <p class="author">by ${$('.username').html()}</p>

                            </div>
                  
                          </div>

                          `;

                      $('.messages').append(msg);
                      $('.messages').animate({ scrollTop: 9999 }, 'slow');

                  };


              </script>


            </div>

          
          </div>

        </section>


      </section>



    </section>

    
  </main>
 </form> 
</body>
</html>
