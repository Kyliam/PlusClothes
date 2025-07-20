using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;

namespace ecommerce
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Thực hiện bất kỳ thao tác khởi tạo nào nếu cần
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string usernameValue = username.Text;
            string emailValue = email.Text;
            string phoneValue = sdt.Text;
            string passwordValue = password.Text;
            string confirmPasswordValue = repassword.Text;

            // Kiểm tra tính hợp lệ của dữ liệu nhập vào
            if (string.IsNullOrWhiteSpace(usernameValue) ||
                string.IsNullOrWhiteSpace(emailValue) ||
                string.IsNullOrWhiteSpace(phoneValue) ||
                string.IsNullOrWhiteSpace(passwordValue) ||
                string.IsNullOrWhiteSpace(confirmPasswordValue))
            {
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin!');</script>");
                return;
            }

            if (passwordValue != confirmPasswordValue)
            {
                Response.Write("<script>alert('Mật khẩu nhập lại không khớp!');</script>");
                return;
            }

            // Kiểm tra xem email đã được sử dụng chưa
            if (IsEmailRegistered(emailValue))
            {
                Response.Write("<script>alert('Email này đã được đăng ký!');</script>");
                return;
            }

            // Băm mật khẩu trước khi lưu vào cơ sở dữ liệu
            string hashedPassword = HashPassword(passwordValue);

            // Lưu thông tin người dùng vào cơ sở dữ liệu
            int userId = RegisterUser(usernameValue, emailValue, phoneValue, hashedPassword);
            if (userId > 0)
            {
                // Đăng ký thành công
                Session["UserId"] = userId;
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                // Đăng ký thất bại
                Response.Write("<script>alert('Đăng ký thất bại. Vui lòng thử lại!');</script>");
            }
        }

        private bool IsEmailRegistered(string email)
        {
            bool isRegistered = false;
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            string query = "SELECT COUNT(*) FROM Users WHERE email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    if (count > 0)
                    {
                        isRegistered = true;
                    }
                }
            }

            return isRegistered;
        }

        private int RegisterUser(string username, string email, string phone, string hashedPassword)
        {
            int userId = -1;
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            string query = "INSERT INTO Users (username, email, phone_number, password) OUTPUT INSERTED.user_id VALUES (@Username, @Email, @Phone, @Password)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Phone", phone);
                    command.Parameters.AddWithValue("@Password", hashedPassword);

                    connection.Open();
                    userId = (int)command.ExecuteScalar();
                }
            }

            return userId;
        }

        public string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
