<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="ManagerHome.aspx.cs" Inherits="VolunteerManagentSystem.Manager.ManagerHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style ="background-image:url('../Images/main_back.jpg'); width: 1400px; height: 740px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class ="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID ="lblMsg" runat="server"></asp:Label>
            </div>
            <h2 class ="text-center"> Хатняя старонка кіраўніка</h2>
        </div>
    </div>
</asp:Content>
