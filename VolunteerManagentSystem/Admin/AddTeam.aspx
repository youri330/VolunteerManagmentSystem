<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTeam.aspx.cs" Inherits="VolunteerManagentSystem.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style ="background-image:url('../Images/main_back.jpg'); width: 1400px; height: 740px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class ="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID ="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class ="text-center">Новая каманда</h3>

             <div class ="row mb-3 mr-lg-5 ml-lg-5 mt-ld-5">
                 <div class ="col-md-6">
                     <label for ="txtTeam">Назва каманды</label>
                     <asp:TextBox ID ="txtTeam" runat ="server" CssClass ="form-control" placeholder="Увядзіце назву каманды" required></asp:TextBox> 
                </div>
            </div>

             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID ="btnAdd" runat ="server" width = 200px CssClass ="btn btn-primary btn-block" BackColor = "#5558C9" Text="Дадаць каманду" color = "#fff" OnClick="btnAdd_Click"></asp:Button> 
                </div>
            </div>

             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-6">
                     <asp:GridView ID="GridView1" runat ="server" width = 200px CssClass ="table table-hover table-bordered"
                         DataKeyNames  ="TeamID" EmptyDataText="Дадзеных няма" OnPageIndexChanging="GridView1_PageIndexChanging"
                         OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                         AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" AllowPaging ="True" PageSize ="5">
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
                             <asp:CommandField CausesValidation="False" HeaderText="Рэдагаванне" ShowEditButton="True" />
                         </Columns>
                         <HeaderStyle BackColor ="#5558c9" />
                     </asp:GridView> 
                </div>
            </div>

        </div>
    </div>
</asp:Content>

