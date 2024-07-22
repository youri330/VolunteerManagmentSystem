<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="VolunteerManagentSystem.Admin.Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div style ="background-image:url('../Images/main_back.jpg'); width: 1400px; height: 740px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class ="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID ="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class ="text-center">Новая валанцёрская праграма</h3>

             <div class ="row mb-3 mr-lg-5 ml-lg-5 mt-ld-5">
                 <div class ="col-md-6">
                     <label for ="ddlTeam">Назва праграмы</label>
                     <asp:DropDownList ID ="ddlTeam" runat ="server" CssClass ="form-control"></asp:DropDownList> 
                     <asp:RequiredFieldValidator ID ="RequiredFieldValidator1" runat ="server" ErrorMasage ="Неабходна каманда!" EnableClientScript= "false"
                         ControlToValidate="ddlTeam" Display="Dynamic" ForeColor="red" InitialValue="Select Team" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                </div>
             <div class ="col-md-6">
                     <label for ="txtProject">Назва праграмы</label>
                     <asp:TextBox ID ="txtProject" runat ="server" CssClass ="form-control" placeholder="Увядзіце назву праграмы" required></asp:TextBox> 
                </div>
            </div>

             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID ="btnAdd" runat ="server" width = 200px CssClass ="btn btn-primary btn-block" BackColor = "#5558C9" Text="Дадаць праграму" color = "#fff" OnClick="btnAdd_Click"></asp:Button> 
                </div>
            </div>

             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-6">
                     <asp:GridView ID="GridView1" runat ="server" width = 200px CssClass ="table table-hover table-bordered"
                         DataKeyNames  ="ProjectID" EmptyDataText="Дадзеных няма!" OnPageIndexChanging="GridView1_PageIndexChanging"
                         OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                         AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" AllowPaging ="True" PageSize ="5">
                         <Columns>
                             <asp:BoundField DataField="ProjectID" HeaderText="#" ReadOnly="True">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:BoundField DataField="TeamName" HeaderText="Каманда" ReadOnly="True">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="Праграма">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtProjectEdit" runat="server" Text='<%# Eval("ProjectName") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>'></asp:Label>
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
