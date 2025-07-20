using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace ecommerce
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string userEmail = email.Text;
            string userPassword = password.Text;

            // Kiểm tra thông tin đăng nhập và lấy ID người dùng
            int userId = ValidateUser(userEmail, userPassword);
            if (userId > 0)
            {
                // Đăng nhập thành công
                // Lưu ID người dùng vào Session
                Session["UserId"] = userId;
                // Chuyển hướng đến trang chủ hoặc trang khác
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                // Đăng nhập thất bại
                // Hiển thị thông báo lỗi
                Response.Write("<script>alert('Email hoặc mật khẩu không đúng!');</script>");
            }
        }

        private int ValidateUser(string email, string password)
        {
            int userId = -1;

            // Băm mật khẩu trước khi kiểm tra
           string hashedPassword = HashPassword(password);

            // Chuỗi kết nối trực tiếp đến cơ sở dữ liệu
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            // Câu lệnh SQL kiểm tra thông tin đăng nhập và lấy ID người dùng
            string query = "SELECT user_id FROM Users WHERE email = @Email AND password = @Password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", hashedPassword);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        userId = reader.GetInt32(0);
                    }
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
