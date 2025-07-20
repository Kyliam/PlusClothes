<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="ecommerce.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng kí</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet' />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <link href="./css/signup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup">
            <h1 class="form_header">Đăng kí</h1>
            <div class="filed">
                <label for="username">Tên người dùng</label>
                <asp:TextBox ID="username" runat="server" />

            </div>

            <div class="filed">
                <label for="sdt">Email</label>
                <asp:TextBox ID="email" runat="server" />

            </div>

            <div class="filed">
                <label for="sdt">Số điện thoại</label>
                <asp:TextBox ID="sdt" runat="server" />

            </div>
            <div class="filed">
                <label for="password">Mật khẩu</label>
                <div class="pass_box">
                    <asp:TextBox ID="password" runat="server" />
                    <span id="icon_pass"><i class="fa-solid fa-eye-slash"></i></span>

                </div>
            </div>

            <div class="filed">
                <label for="repassword">Nhập lại mật khẩu</label>
                <asp:TextBox ID="repassword" runat="server" />
            </div>

            <asp:Button Text="Đăng kí" runat="server" ID="Button1" CssClass="btn_signup" OnClick="btnSubmit_Click" />

            <div>
                <p>Bạn đã có tài khoản? <a href="Login.aspx">Đăng nhập</a></p>
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
                inputPass.setAttribute('type', 'text');
                inputPass.setAttribute('type', 'password');


            }
        }
    </script>
</body>
</html>
