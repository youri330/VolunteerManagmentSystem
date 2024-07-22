<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VolunteerManagentSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
       body{
        margin: 0;
       }
    .login,
    .image {
        min-height: 100vh;
    }
        #lblMsg {
            display:block;
        }

    .bg-image {
        background-image: url('../Images/main_back.jpg');
        background-size: cover;
        background-position: center center;
    }
    .mx-auto {
        text-align: center;
     }
    .shadow-sm {
    margin-top: 0px;
    }
     
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
            <div class="row no-gutter bg-image">
                <div class="col-md-6 d-none d-md-flex"></div>
                <div class="col-md-6 bg-light">
                    <div class="login d-flex align-items-center py-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 col-xl-7 mx-auto">
                                    <h3 class="display-4 pb-3">Старонка аўтарызацыі</h3>
                                    <p class="text-muted mb-4">Уваход у сістэму</p>
                                    <div class="form-group mb-3">
                                        <input id="inputPhone" type="text" placeholder="Нумар тэлефона"  runat="server" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" />
                                    </div>
                                    <div class="form-group mb-3 mb-2">
                                        <input id="inputPassword" type="password" placeholder="Пароль"  runat="server" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" />
                                    </div>

                                    <asp:Button ID="btnLogin" runat="server" Text="Увайсці" CssClass="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm" BackColor="#5558C9" OnClick="btnLogin_Click" />
                                    <div class="text-center d-flex justify-content-between mt-4">
                                        <asp:Label  ID="lblMsg" runat="server"></asp:Label>
                                    <asp:Button ID="btnRegular" runat="server" Text="Рэжым прагляду" CssClass="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm" BackColor="#5558C9" OnClick="btnRegular_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
        </div>
        </div>
    </form>
        
</body>
</html>
