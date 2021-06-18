<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chat.aspx.cs" Inherits="WebApplication1.chat" %>

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
          <div class="username">Saqib Ali</div>
          <div class="user-category">Student</div>
      </div>

      <div class="row question-statement">


        <h3>Have questions about universities? <br><br> Ask them here and find your answers!</h3>

      </div>



    </aside>


    <section class="chat-section">




      <header>
        
        <h5>Questions & Answers</h5>
        <p class="level-2">Available</p>

      </header>


      <section class="chat-body">

        
        <section class="messages container">



          <!--This is a single message-->


          <!--

            MESSAGE       hello
            MESSAGE ID    1
            SENDER ID     saqibali


            Sesiion user  saqibali

            SELECT * FROM MESSAGES

          -->

          <div class="row">
          
            <div class="col s10 message received">

              <p class="text">Hello, I am looking for some help regarding admissions at LUMS.</p>
              <p class="author">by Sajawal Ali</p>

            </div>

          </div>

          <!--This is a single message-->
<!-- 
          <div class="row">
          
            <div class="col s10 message sent">

              <p class="text">Hey Sajawal, how can I help you?</p>
              <p class="author">by Saqib Ali</p>

            </div>

          </div> -->







        </section>


        <section class="input-panel">

          <div class="row container valign-wrapper center-align">
            
            <div class="col s10">
              
              <div class="input-field">

                <asp:TextBox ID="messagebox" name="messagebox" required="true"  class="form-control" runat="server"></asp:TextBox> 
                <label for="messagebox">What's on your mind?</label>
              </div>
            
            </div>

            <div class="col s2">
              
              <asp:Button CssClass="btn" ID="sendbtn" OnClientClick="sendMessage()" Text="SEND" runat="server" OnClick="sendbtn_Click"></asp:Button>


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


                    var request = $.ajax({
                        type: "POST",
                        url: "chat.aspx/send_message",
                        data: '{ "msg" : "' + $('#messagebox').val() + '", "sender" : "'
                            + $('.username').html() +'"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (response) => {
                            console.log(response);
                        },
                        failure: () => console.log('failed')
                    });

                  $('.messages').append(msg);
                  $('#messagebox').val('');
                  $('.messages').animate({ scrollTop: 9999 }, 'slow');
                }

      
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
