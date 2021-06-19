<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="WebApplication1.search" %>

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
  

  <title>Search | Find your ideal university</title>

  <!--Materialize-->

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <!-- Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


  <!--CSS-->
  <link rel="stylesheet" href="css/search.css" />

    <!--favicon-->
    <link rel="shortcut icon" href="assets/simple_cyan_jamya_logo.png" type="image/x-icon" />

</head>
<body>

    <form runat="server" id="searchForm" method="post">

        <section class="top-part">


            <h3 class="center-align">Find your ideal university with Jamya!</h3>

            <!--Search Box-->

            <div class="input-field container valign-wrapper">
                
                <asp:TextBox
                    runat="server"
                    ID="searchQuery"
                    class="validate autocomplete"
                    ></asp:TextBox>

                <label for="searchQuery">
                    Search university...
                </label>
            

                <!--This is the search button-->

                <asp:LinkButton
                    runat="server"
                    CssClass="right btn-flat"
                    ID="searchBtn"
                    OnClick="searchBtn_Click">
                    <i class="material-icons">search</i>
                </asp:LinkButton>

                <%--<i class="material-icons right btn-flat" 
                    onclick="searchUniversity()">search</i>--%>

                

            </div>



        </section>

        <section class="bottom-part">

        
            <div class="container search-results">

                <h5>Search Results</h5>

                <br />

                <p>Click on the apply button and send your application
                    to the best universities!
                </p>

                <br />
                <br />

                <div id="search_results">

                    <asp:Repeater runat="server" ID="searchResults">

                        <ItemTemplate>

                             <div class="row valign-wrapper">
                                    <div class="col s2">
                                        <img
                                            src="assets/simple_cyan_jamya_logo.png"
                                            alt="University Logo"
                                            class="search-img"
                                            draggable="false"
                                         />
                                    </div>
                                    <div class="col s8">
                                        <a class="uni-title" href="profile.aspx?id=<%#Eval("UniversityID")%>  "
                                            class="black-text" target="_blank">
                                            <%#Eval("Name")%>  
                                        </a>
                                    </div>
                                    <div class="col s2 center-align">
                            
                                        <a href="apply.aspx?id=<%#Eval("UniversityID")%>  " target="_blank"
                                        class = "btn waves-effect waves-light green"
                                        id="uni-btn-<%#Eval("UniversityID")%>  "
                                        >APPLY</a>

                                    </div>
                                </div>

                        </ItemTemplate>

                    </asp:Repeater>

                </div>

            </div>


        </section>


        <!--This is for the autocomplete part-->
        <script type="text/javascript">

            var uniNames = {};

            for (var i = 0; i < $('.uni-title').length; i++)
                uniNames[$('.uni-title')[i].innerHTML.trim().toString()] = 'assets/simple_cyan_jamya_logo.png';

            console.log(uniNames);

            const searchUniversity = () => {


                var request = $.ajax({
                    type: "POST",
                    url: "search.aspx/searching_function",
                    data: '{"query":"' + $('#searchQuery').val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (response) => {
                        console.log(response);
                        showSearchResults(response.d)
                    },
                    failure: () => console.log('failed')
                });



            }


            const applyToUniversity = (id) => {

                var request = $.ajax({
                    type: "POST",
                    url: "search.aspx/applying_function",
                    data: '{"id":"' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (response) => {
                        console.log(response.d);
                        M.toast({ html: 'Applied!' });
                        $("#uni-btn-" + id).addClass('disabled');
                    },
                    failure: () => M.toast({ html: 'Could not apply...' })
                });


            }


            const showSearchResults = (res) => {

                $('#search_results').html('');

                for (var i = 0; i < res.length; i++) {

                    var row = res[i];

                    var result =
                        `

                    <div class="row valign-wrapper">
                        <div class="col s2">
                            <img
                                src="assets/simple_cyan_jamya_logo.png"
                                alt="University Logo"
                                class="search-img"
                                draggable="false"
                             />
                        </div>
                        <div class="col s8">
                            <a href="profile.aspx?id=${row['ID']}"
                                class="black-text" target="_blank">
                                ${row['name']}
                            </a>
                        </div>
                        <div class="col s2 center-align">
                            
                            <a href="apply.aspx?id=${row['ID']}" target="_blank"
                            class = "btn waves-effect waves-light green"
                            onclick="applyToUniversity( ${row['ID']} );"
                            id="uni-btn-${row['ID']}"
                            >APPLY</a>

                        </div>
                    </div>

                    `;

                    $('#search_results').append(result);


                }


            }


            $(document).ready(function () {
                $('input.autocomplete').autocomplete({
                    data: uniNames,
                });
            });


        </script>


    </form>



</body>
</html>
