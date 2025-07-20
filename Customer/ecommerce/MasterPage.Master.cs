using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["userId"] != null)
                {
                    loginLink.Visible = false;
                    historyLink.Visible = true;
                    logoutButton.Visible = true;
                }
                else
                {
                    loginLink.Visible = true;
                    historyLink.Visible = false;
                    logoutButton.Visible = false;
                }
                getUsername(null, EventArgs.Empty);
            }
        }

        protected void getUsername(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                int userId = Convert.ToInt32(Session["userId"]); // Lấy giá trị userId từ Session
                string username = "username"; // Biến lưu trữ tên người dùng

                
                string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

                string query = "SELECT username FROM Users WHERE user_id = @UserId";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        con.Open();
                        username = (string)cmd.ExecuteScalar(); // Lấy tên người dùng từ kết quả truy vấn
                        con.Close();
                    }
                }

                // Xử lý sau khi lấy được username
                if (!string.IsNullOrEmpty(username))
                {
                    TxtUsername.Text = username;
                   
                }
                else
                {
                    // Xử lý trường hợp không tìm thấy username
                }
            }
            else
            {
                // Xử lý trường hợp không có session userId
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                // Nếu session userId không tồn tại, không làm gì cả và thoát khỏi phương thức
                return;
            }

            // Xóa session khi đăng xuất
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}