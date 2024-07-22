<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="VolunteerManagentSystem.Admin.Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style ="background-image:url('../Images/main_back.jpg'); width: 1400px; height: fit-content; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class ="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID ="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class ="text-center">Новы кіраўнік</h3>

             <div class ="row mb-3 mr-lg-5 ml-lg-5 mt-ld-5">
                 <div class ="col-md-6">
                     <label for ="txtName">Імя</label>
                     <asp:TextBox ID ="txtName" runat ="server" CssClass ="form-control" placeholder="Увядзіце імя кіраўніка" required></asp:TextBox> 
                     <asp:RegularExpressionValidator ID ="RegularExpressionValidator2" runat ="server" ErrorMasage ="Увядзіце імя ў фармаце Прозвішча І. І.!"
                         ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true"  EnableClientScript= "false" ControlToValidate="txtName"></asp:RegularExpressionValidator> 
                </div>
             <div class ="col-md-6">
                     <label for ="txtDoB">Дата народзінаў</label>
                     <asp:TextBox ID ="txtDoB" runat ="server" CssClass ="form-control" TextMode="Date"  EnableClientScript= "false" required></asp:TextBox> 
                </div>
            </div>
             <div class ="row mb-3 mr-lg-5 ml-lg-5 mt-ld-5">
                 <div class ="col-md-6">
                     <label for ="ddlGender">Гендар</label>
                     <asp:DropDownList ID ="ddlGender" runat ="server">
                         <asp:ListItem Value="0">Выбярыце са спісу</asp:ListItem>
                         <asp:ListItem>Ж</asp:ListItem>
                         <asp:ListItem>М</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldGender" runat="server" ErrorMessage="Укажыце гендар!"
                         ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true"  EnableClientScript= "false" InitialValue="Выбярыце са спісу"></asp:RequiredFieldValidator>
                </div>
             <div class ="col-md-6">
                     <label for ="txtPhone">Нумар телефону</label>
                    <asp:TextBox ID ="txtPhone" runat ="server" CssClass ="form-control" placeholder="+375*********" required></asp:TextBox> 
                     <asp:RegularExpressionValidator ID ="PhoneValidator" runat ="server" ErrorMasage ="Увядзіце нумар тэлефона ў фармаце +375*********"
                         ForeColor="Red" ValidationExpression="^(\+375)(\d{9})$" Display="Dynamic"  EnableClientScript= "false" SetFocusOnError="true" ControlToValidate="txtName"></asp:RegularExpressionValidator> 
                </div>
            </div>
             <div class ="row mb-3 mr-lg-5 ml-lg-5 mt-ld-5">
                 <div class ="col-md-6">
                     <label for ="txtCity">Горад</label>
                     <asp:TextBox ID ="txtCity" runat ="server" CssClass ="form-control" placeholder="Увядзіце горад" required></asp:TextBox> 
                     <asp:RegularExpressionValidator ID ="CityValidator" runat ="server" ErrorMasage ="Увядзіце назву горада ў правільным фармаце!"
                         ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true"  EnableClientScript= "false" ControlToValidate="txtName"></asp:RegularExpressionValidator> 
                </div>
                 <div class ="col-md-6">
                     <label for ="txtAddress">Адрас</label>
                     <asp:TextBox ID ="txtAddress" runat ="server" CssClass ="form-control" placeholder="Увядзіце адрас"  TextMode = "Multiline" required></asp:TextBox> 
                     <asp:RegularExpressionValidator ID ="AddressValidator" runat ="server" ErrorMasage ="Увядзіце адрас у правільным фармаце!"
                         ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true"  EnableClientScript= "false" ControlToValidate="txtName"></asp:RegularExpressionValidator> 
                </div>
                 <div class ="col-md-6">
                     <label for ="txtPassword">Пароль</label>
                     <asp:TextBox ID ="txtPassword" runat ="server" CssClass ="form-control" placeholder="Увядзіце будучы пароль" required></asp:TextBox> 
                     <asp:RegularExpressionValidator ID ="PasswordValidator" runat ="server" ErrorMasage ="У паролі могуць толькі быць лацінскія літары, лічбы і знак падкрэслівання!"
                         ForeColor="Red" ValidationExpression="^([A-Za-z0-9_]{8})$" Display="Dynamic"  EnableClientScript= "false" SetFocusOnError="true" ControlToValidate="txtName"></asp:RegularExpressionValidator> 
                </div>

             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID ="btnAdd" runat ="server" width = 200px CssClass ="btn btn-primary btn-block" BackColor = "#5558C9" Text="Дадаць кіраўніка" color = "#fff" OnClick="btnAdd_Click"></asp:Button> 
                </div>
            </div>

             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-6">
                     <asp:GridView ID="GridView1" runat ="server" width = 200px CssClass ="table table-hover table-bordered"
                         DataKeyNames  ="ManagerID" EmptyDataText="Дадзеных няма!" OnPageIndexChanging="GridView1_PageIndexChanging"
                         OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                         AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" AllowPaging ="True" PageSize ="5">
                         <Columns>
                             <asp:BoundField DataField="ManagerID" HeaderText="#" ReadOnly="True">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="Кіраўнік">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Нумар тэлефона">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtPhone" runat="server" Text='<%# Eval("Phone_number") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone_number") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Адрас кіраўніка">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address_man") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address_man") %>'></asp:Label>
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
                             <asp:TemplateField HeaderText="Пароль">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password_manager") %>' CssClass="form-control"
                                         Width="80px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password_manager") %>'></asp:Label>
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
    </div>
</asp:Content>
