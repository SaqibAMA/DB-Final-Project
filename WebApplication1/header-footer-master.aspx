<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="header-footer-master.aspx.cs" Inherits="WebApplication1.header_footer_master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!--Stylesheet-->
  <link rel="stylesheet" href="css/header-footer.css">

  <!--Icons-->
  <script src="https://kit.fontawesome.com/164e7b143f.js" crossorigin="anonymous"></script>


  <!--Google fonts-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Poppins:wght@300;700&display=swap" rel="stylesheet">

  <link rel="shortcut icon" href="assets/simple_cyan_jamya_logo.png" type="image/x-icon">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <nav>
      
      <ul>
        <li>
          <img src="assets/simple_cyan_jamya_logo.png" alt="Jamya Logo" />
        </li>
        <li class="hide">APPLY</li>
        <li class="hide">CONTACT</li>
        <li class="hide">BLOG</li>
        <li class="hide">FORUM</li>
      </ul>

    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="footer-section">


        <div class="large-section-title">JAMYA</div>
        <p class="hide">We create endless possibilities for students by connecting them with various universities in Pakistan and across the world.</p>
        <img src="assets/simple_white_jamya_logo.png" alt="Jamya Logo" class="footer-logo" draggable="false" />
        <p>&copy; Jamya - 2021</p>

      </div>

      <div class="footer-section hide">

        
        <ul>
          <li class="section-title">Explore</li>
          <li>Apply</li>
          <li>Contact</li>
          <li>Blog</li>
          <li>Forum</li>
        </ul>
        

      </div>

      <div class="footer-section hide">



        <ul>

          <li class="section-title">Visit</li>
          <li>1 - Sajawal Block,</li>
          <li>Saqib Street,</li>
          <li>Lahore, Pakistan.</li>

        </ul>

        <ul>
          <li class="section-title">Contact Us</li>
          <li>info@jamya.com</li>
          <li>042 378 111 11</li>
        </ul>


      </div>

      <div class="footer-section">

        <ul>
          <li class="section-title">Follow</li>
          <li>Instagram</li>
          <li>Facebook</li>
          <li>LinkedIn</li>
        </ul>

      </div>

      <div class="footer-section">

        <ul>
          <li class="section-title">Legal</li>
          <li>Terms</li>
          <li>Privacy</li>
        </ul>

      </div>
</asp:Content>