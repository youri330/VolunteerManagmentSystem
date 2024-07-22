<%@ Page Title="" Language="C#" MasterPageFile="~/Regular/Regular.Master" AutoEventWireup="true" CodeBehind="RegularVolunteers.aspx.cs" Inherits="VolunteerManagentSystem.Regular.RegularVolunteers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style ="background-image:url('../Images/main_back.jpg'); width: 1300px; height: 700px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class ="container p-md-4 p-sm-4">
             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-6">
                     <asp:GridView ID="GridView1" runat ="server" width = 200px CssClass ="table table-hover table-bordered"
                         DataKeyNames  ="VolunteerID" EmptyDataText="Дадзеных няма!" OnPageIndexChanging="GridView1_PageIndexChanging"
                         AutoGenerateColumns="False" AllowPaging ="True" PageSize ="3">
                         <Columns>
                             <asp:BoundField DataField="VolunteerID" HeaderText="#" ReadOnly="True">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="Імя">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("First_name") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblName" runat="server" Text='<%# Eval("First_name") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Прозвішча">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Last_name") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblName" runat="server" Text='<%# Eval("Last_name") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Нумар для сувязі">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtPhone" runat="server" Text='<%# Eval("Phone_number") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone_number") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Адрас">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address_vol") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address_vol") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Горад">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("Cuty") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblCity" runat="server" Text='<%# Eval("Cuty") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:CommandField CausesValidation="False" HeaderText="Рэдагаванне" ShowEditButton="True" EditText="Праўка"  />
                         </Columns>
                         <HeaderStyle BackColor ="#5558c9" />
                     </asp:GridView> 
                </div>
            </div>
         </div>    
      </div>
</asp:Content>
