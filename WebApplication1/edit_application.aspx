<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_application.aspx.cs" Inherits="WebApplication1.edit_application" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <!--Google Fonts-->
  <link rel="preconnect" href="https://fonts.gstatic.com" /><link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;500&amp;family=Poppins:wght@500;600&amp;display=swap" rel="stylesheet" />

  <!--jQuery for Interaction-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  

  <title>
	Edit Application | Find your ideal university
</title>

  <!--Materialize-->

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <!-- Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />


  <!--CSS-->
  <link rel="stylesheet" href="css/edit_application.css" />

    <!--favicon-->
    <link rel="shortcut icon" href="assets/simple_cyan_jamya_logo.png" type="image/x-icon" />

    <script type="text/javascript">

        var getUrlParameter = function getUrlParameter(sParam) {
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

    </script>

</head>

<body class="bg-dark">
    <form id="editApplicationForm" runat="server">

        
        <h2 class="center-align">Want to make some changes?
            Edit your application right away!
        </h2>
        
        <div class="row valign-wrapper">

            <!--Input-->
            <div class="col l6 s12" style="margin-top: 5rem !important;">

                <div class="container" style="padding: 1rem;">

                    <div class="white row" style="padding: 2rem;
                                                border-radius: 1rem;">

                        <div class="row col s12 center-align black-text">
                            <h4>Application Details</h4>
                        </div>

                        <div class="row col s12 input-field">
                            <input type="text" 
                                name="studentName" 
                                value="Saqib Ali" 
                                disabled="disabled"
                                id="stdName"/>
                            <label for="stdName">STUDENT NAME</label>
                        </div>

                        <div class="row col s12  input-field">
                            <input type="text" 
                                name="studentName" 
                                value="National University of Computer and Emerging Sciences" 
                                disabled="disabled"
                                id="uniName"/>
                            <label for="uniName">UNIVERSITY NAME</label>
                        </div>

                        <div class="row col s12 input-field">
                            <input type="text" 
                                name="studentName" 
                                value="12/01/2001" 
                                disabled="disabled"
                                id="dateApplied"/>
                            <label for="dateApplied">DATE OF APPLICATION</label>
                        </div>
                        
                        <div class="row col s12 input-field">
                            <input type="text" 
                                name="studentName" 
                                value="In Progress" 
                                disabled="disabled"
                                id="appStatus"/>
                            <label for="appStatus">APPLICATION STATUS</label>
                        </div>

                        <div class="row input-field col s12">
                            
                            <select id="programs">
                                <option value="" disabled selected>
                                    Choose Program
                                </option>
                                <option value="">
                                    BS(CS)
                                </option>
                                <option value="">
                                    BS(AI)
                                </option>
                                <option value="">
                                    BS(AF)
                                </option>
                            </select>

                            <label>CHOOSE PROGRAM</label>

                            <script type="text/javascript">
                                $('select').formSelect();
                            </script>

                        </div>

                        <div class="input-field col s12"></div>
                            <button type="button" class="btn col s12">SAVE
                                <i class="material-icons right">save</i>
                            </button>
                        </div>

                    </div>

                </div>


            <!--Image-->
            <div class="col l6 s12 hide-on-small-only" style="overflow: hidden;">

                <img src="assets/3d-flame-school-teacher-4.png" alt="Teacher"
                    style="width: 100%;"/>

            </div>

        </div>

        <div class="row center-align">
            <a href="dashboard.aspx" 
                class="btn btn-flat">BACK TO DASHBOARD 
                <i class="material-icons left">west</i></a>
        </div>


        <script type="text/javascript">


            const fetchID = () => {

                return parseInt(getUrlParameter('application_id'));

            }

            const is_valid_application = () => {

                return parseInt(
                    $('#isValidApplication').html()
                );

            }

            $(document).ready(()=>{

                var application_id = fetchID();
                if (!is_valid_application()) {


                    $('body').append(
                        `<div class="container center-align">
                            <h3>You're trying to edit an invalid application.</h3>
                        </div>`
                    );


                }
                else {

                    var request = $.ajax({
                        type: "POST",
                        url: "edit_application.aspx/getApplicationData",
                        data: '{"application_id":"' + application_id + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (response) => console.log(response.d),
                        failure: () => console.log('failed')
                    });

                }

                


            });




        </script>

        <asp:Label runat="server" ID="isValidApplication" CssClass="hide">1</asp:Label>

    </form>
</body>
</html>

