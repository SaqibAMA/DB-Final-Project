<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication1.contact" %>

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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  

  <!--Materialize-->

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <!-- Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


  <!--favicon-->
  <link rel="shortcut icon" href="assets/simple_cyan_jamya_logo.png" type="image/x-icon" />

  <title>Contact Us | Jamya</title>

  <!--Css-->
  <link href="css/contact.css" rel="stylesheet" />


</head>
<body>
    <form id="contactFrom" runat="server" method="post">
        
        <div class="row container valign-wrapper" style="margin-top: 1rem;">


            <img src="assets/simple_cyan_jamya_logo.png"
                alt="Top Logo" class="top-logo col s2" draggable="false"/>

            <a href="dashboard.aspx" class="btn-flat col s2 nav-link">HOMEPAGE</a>
            <a href="search.aspx" class="btn-flat col s2 nav-link">SEARCH</a>
            <a href="dashboard.aspx" class="btn-flat col s2 nav-link">DASHBOARD</a>

        </div>

        <div class="row container">

            <!--Left Panel-->
            <div class="col m6 s12 left-panel">

                <h4>Get in touch!</h4>
                <p>Jamya is always here to help students
                    and universities in making the right decision.
                    If you feel like there is a bug or an issue, 
                    do let us know by dropping a message.
                </p>

                <div>

                    <ul>
                        <li class="valign-wrapper">
                            <i class="material-icons">phone</i>
                            0304-1234567
                        </li>
                        <li class="valign-wrapper">
                            <i class="material-icons">mail</i>
                            contact@jamya.com
                        </li>
                        <li class="valign-wrapper">
                            <i class="material-icons">location_on</i>
                            Shadrah Bagh, Lahore.
                        </li>
                    </ul>

                </div>

                <div>

                    <div style="width: 100%">
                        <iframe 
                            width="100%" 
                            height="300" 
                            frameborder="0" 
                            scrolling="no" 
                            marginheight="0" 
                            marginwidth="0" 
                            src="https://maps.google.com/maps?width=100%25&amp;height=300&amp;hl=en&amp;q=Shadrah+(Jamya%20Inc.)&amp;t=&amp;z=13&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">

                        </iframe>
                    </div>

                </div>

            </div>


            <!--Right Panel-->
            <div class="col m6 s12 right-panel">

                <h4>Contact Form</h4>

                <br />
                <br />

                <div class="contactForm row z-depth-2">

                    <div class="col l12 m12">
                        <asp:TextBox
                            ID="name"
                            class="validate txt-field"
                            required="true"
                            runat="server"
                            placeholder="John Doe"
                         ></asp:TextBox>
                        <asp:Label Text="" runat="server" for="name" />
                    </div>
                    
                    <div class="col l12 m12">


                        <asp:TextBox
                            ID="email"
                            class="validate txt-field"
                            required="true"
                            runat="server"
                            type="email"
                            placeholder="johndoe@gmail.com"
                         ></asp:TextBox>
                        <asp:Label Text="" runat="server" for="email" />
                    </div>

                    <div class="col s12">

                        <br />
                        <br />

                        <asp:TextBox
                            runat="server"
                            ID="message"
                            TextMode="MultiLine"
                            placeholder="Message"
                            Rows="10"
                            class="materialize-textarea txt-field"
                            maxlength="200"
                         ></asp:TextBox>

                        <label for="message">
                            Characters remaining: 
                            <span class="chars-remaining">200</span>
                        </label>


                        <script type="text/javascript">

                            $('.materialize-textarea').on(
                                'input',
                                () => {

                                    let totalChars =
                                        $('.materialize-textarea').val();

                                    totalChars = totalChars.length;

                                    let currentLimit =
                                        parseInt(
                                            $('.chars-remaining').html()
                                        );

                                    $('.chars-remaining').html(
                                        200 - totalChars
                                    );

                                }
                            )


                        </script>


                    </div>

                    <div class="col s12">

                        <br />
                        <br />
                        <br />
                        <br />
                        <br />


                        <script runat="server">

                            void sendMessage_Click(object sender, EventArgs e)
                            {

                                Response.Write("Message Sent!");

                                // Take data from the fields
                                // and insert it inot the Queries table.

                                // Queries table structure
                                // Query_ID, Name, Email, Date, Text

                            }

                        </script>


                        <asp:LinkButton
                            type="submit"
                            runat="server" 
                            ID="sendMessage"
                            class="btn green waves-effect waves-light"
                            width="100%"
                            OnClick="sendMessage_Click"
                            >
                        <i class="material-icons left">mail</i>
                             SEND MESSAGE
                        </asp:LinkButton>


                    </div>

                </div>

            </div>


        </div>

    </form>

</body>
</html>
