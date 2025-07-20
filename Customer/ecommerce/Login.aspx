<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ecommerce.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet' />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <link href="./css/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="back_to_home">
            <a href="/HomePage.aspx"><i class='bx bx-arrow-back'></i></a>
        </div>
        <div class="login">
            <h1 class="form_header">Đăng nhập</h1>
            <div class="filed">
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" />

            </div>
            <div class="filed">
                <label for="password">Mật khẩu</label>
                <div class="pass_box">
                    <asp:TextBox ID="password" runat="server" />
                    <span id="icon_pass"><i class="fa-solid fa-eye"></i></span>

                </div>

            </div>
            <asp:Button Text="Đăng nhập" runat="server" ID="Button1" CssClass="btn_login" OnClick="btnSubmit_Click" />
            <div>
                <p>Bạn chưa có tài khoản? <a href="Signup.aspx">Đăng kí</a></p>
            </div>
        </div>



    </form>
    <script>
        const icon_pass = document.querySelector('#icon_pass');
        const icon = document.querySelector('#icon_pass i');
        const inputPass = document.querySelector('#password');
        icon_pass.onclick = function () {
            if (icon.classList.contains('fa-eye-slash')) {

                icon.classList.replace('fa-eye-slash', 'fa-eye');
                inputPass.setAttribute('type', 'text');
            } else {
                icon.classList.replace('fa-eye', 'fa-eye-slash');

                inputPass.setAttribute('type', 'password');


            }
        }
    </script>
</body>
</html>
