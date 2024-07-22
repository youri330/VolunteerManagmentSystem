<%@ Page Title="" Language="C#" MasterPageFile="~/Regular/Regular.Master" AutoEventWireup="true" CodeBehind="RegularTeam.aspx.cs" Inherits="VolunteerManagentSystem.Regular.RegularTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style ="background-image:url('../Images/main_back.jpg'); width: 1470px; height: 740px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class ="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID ="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class ="text-center">Спіс нашых каманд</h3>

            <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-6">
                     <asp:GridView ID="GridView1" runat ="server" width = 200px CssClass ="table table-hover table-bordered"
                         DataKeyNames  ="TeamID" EmptyDataText="Дадзеных няма" OnPageIndexChanging="GridView1_PageIndexChanging"
                         AutoGenerateColumns="False" AllowPaging ="True" PageSize ="8">
                         <Columns>
                             <asp:BoundField DataField="TeamID" HeaderText="#" ReadOnly="True">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="Каманда">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtTeamEdit" runat="server" Text='<%# Eval("TeamName") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblTeamName" runat="server" Text='<%# Eval("TeamName") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                         </Columns>
                         <HeaderStyle BackColor ="#5558c9" />
                     </asp:GridView> 
                </div>
            </div>

        </div>
    </div>
</asp:Content>
