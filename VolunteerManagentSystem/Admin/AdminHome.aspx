<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="VolunteerManagentSystem.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <style type="text/css">
.card-counter{
    box-shadow: 2px 2px 10px #DADADA;
    margin: 5px;
    padding: 5px;
    background-color: #fff;
    border-radius: 5px;
    transition: .3s linear all;
  }

  .card-counter:hover{
    box-shadow: 4px 4px 20px #DADADA;
    transition: .3s linear all;
  }

  .card-counter.primary{
    background-color: #4B0082;
    color: #FFF;
  }

  .card-counter.danger{
    background-color: #F4A460;
    color: #FFF;
  }  

  .card-counter.success{
    background-color: #DB7093;
    color: #FFF;
  }  

  .card-counter.info{
    background-color: #26c6da;
    color: #FFF;
  }  

  .card-counter i{
    font-size: 5em;
    opacity: 0.2;
  }

  .card-counter .count-numbers{
    right: 35px;
    top: 20px;
    font-size: 32px;
    display: block;
  }

  .card-counter .count-name{
    right: 35px;
    top: 65px;
    font-style: italic;
    text-transform: capitalize;
    opacity: 0.5;
    display: block;
    font-size: 18px;
  }
    </style>
        <div style ="background-image:url('../Images/main_back.jpg'); width: 1470px; height: 740px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class ="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID ="lblMsg" runat="server"></asp:Label>
            </div>
            <h2 class ="text-center"> Хатняя старонка адміна</h2>
        </div>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
   <div class="container">
    <div class="row">
    <div class="col-md-3">
   <div class="card-counter primary">
     <i class="fa fa-user"></i>
     <span class="count-numbers"><%Response.Write(Session["manager"]); %></span>
     <span class="count-name">Кіраўнікі</span>
   </div>
 </div>

 <div class="col-md-3">
   <div class="card-counter danger">
     <i class="fa fa-user"></i>
     <span class="count-numbers"><%Response.Write(Session["volunteer"]); %></span>
     <span class="count-name">Валанцёры</span>
   </div>
 </div>

 <div class="col-md-3">
   <div class="card-counter success">
     <i class="fa fa-users"></i>
     <span class="count-numbers"><%Response.Write(Session["team"]); %></span>
     <span class="count-name">Каманды</span>
   </div>
 </div>

 <div class="col-md-3">
   <div class="card-counter info">
     <i class="fa fa-ticket"></i>
     <span class="count-numbers"><%Response.Write(Session["project"]); %></span>
     <span class="count-name">Праграмы</span>
   </div>
 </div>
  </div>
</div>
</div>
</asp:Content>
