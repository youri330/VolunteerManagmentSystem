<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManagerProject.aspx.cs" Inherits="VolunteerManagentSystem.Admin.ManagerProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style ="background-image:url('../Images/main_back.jpg'); width: 1400px; height: 740px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class ="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID ="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class ="text-center">Назначыць кіраўніка на праграму</h3>

            <div class ="row mb-3 mr-lg-5 ml-lg-5 mt-ld-5">
                 <div class ="col-md-6">
                     <label for ="ddlTeam">Каманда</label>
                     <asp:DropDownList ID ="ddlTeam" runat ="server" CssClass  ="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTeam_SelectedIndexChanged">
                        </asp:DropDownList>
                     <asp:RequiredFieldValidator ID ="TeamValidator" runat ="server" ErrorMasage ="Неабходна каманда!" EnableClientScript= "false"
                         ControlToValidate="ddlTeam" Display="Dynamic" ForeColor="red" 
                         InitialValue="Выберыце каманду" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                 
                 <div class ="col-md-6">
                     <label for ="ddlProject">Праграма</label>
                     <asp:DropDownList ID ="ddlProject" runat ="server" CssClass  ="form-control" AutoPostBack="true">
                        </asp:DropDownList>
                     <asp:RequiredFieldValidator ID ="ProjectValidator" runat ="server" ErrorMasage ="Неабходна праграма!" EnableClientScript= "false"
                         ControlToValidate="ddlProject" Display="Dynamic" ForeColor="red" 
                         InitialValue="Выберыце праграму" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                
                </div>
                 <div class ="col-md-6">
                     <label for ="ddlManager">Кіраўнік</label>
                     <asp:DropDownList ID ="ddlManager" runat ="server" CssClass  ="form-control" AutoPostBack="true">
                        </asp:DropDownList>
                     <asp:RequiredFieldValidator ID ="ManagerValidator" runat ="server" ErrorMasage ="Неабходны кіраўнік!" EnableClientScript= "false"
                         ControlToValidate="ddlManager" Display="Dynamic" ForeColor="red" 
                         InitialValue="Выберыце кіраўніка" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                 </div>
            </div>
             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID ="btnAdd" runat ="server" width = 200px CssClass ="btn btn-primary btn-block" BackColor = "#5558C9" Text="Дадаць прект" color = "#fff" OnClick="btnAdd_Click"></asp:Button> 
                </div>
            </div>

             <div class ="row mb-3 mr-lg-5 ml-lg-5">
                 <div class ="col-md-6">
                     <asp:GridView ID="GridView1" runat ="server" width = 200px CssClass ="table table-hover table-bordered"
                         DataKeyNames  = "№" EmptyDataText="Дадзеных няма!" OnPageIndexChanging="GridView1_PageIndexChanging"
                         OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                         AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" AllowPaging ="True" PageSize ="5" OnRowDataBound="GridView1_RowDataBound">
                         <Columns>
                             <asp:BoundField DataField="№" HeaderText="#" ReadOnly="True">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="Каманда">
                                 <EditItemTemplate>
                                     <asp:DropDownList ID="ddlTeamGV" runat="server" SelectedValue='<%# Eval("TeamID") %>' CssClass="form-control"
                                         Width="80px" DataTextField="TeamName" DataValueField ="TeamID" DataSourceID="DaraSourceId1" AutoPostBack="true">
                                         <asp:ListItem>Выберыце каманду</asp:ListItem>
                                     </asp:DropDownList>
                                     <asp:SqlDataSource ID="SqlSource1" runat="server" ConnectionString="</%$ ConnectionStrings:VolCS%>" 
                                         SelectCommand ="SELECT * FROM [Team]" ></asp:SqlDataSource>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblTeam" runat="server" Text='<%# Eval("TeamName") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Праграма">
                                 <EditItemTemplate>
                                     <asp:DropDownList ID="ddlProjectGV" runat="server" SelectedValue='<%# Eval("ProjectID") %>' CssClass="form-control"
                                         Width="80px" DataTextField="ProjectName" DataValueField ="TeamID" DataSourceID="DaraSourceId1" AutoPostBack="true"></asp:DropDownList>   
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lbProject" runat="server" Text='<%# Eval("ProjectName") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Кіраўнік">
                                 <EditItemTemplate>
                                     <asp:DropDownList ID="ddlManagerGV" runat="server" CssClass="form-control"
                                         Width="80px" SelectedValue='<%# Eval("ManagerID") %>' DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ManagerID"></asp:DropDownList>
                                     <asp:SqlDataSource ID="SqlSource2" 
                                         runat="server" ConnectionString="<%$ ConnectionStrings:VolunteerCS %>" SelectCommand ="SELECT [ManagerID], [Name] FROM [Manager]"></asp:SqlDataSource>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lbManager" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
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
