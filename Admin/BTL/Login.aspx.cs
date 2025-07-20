using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ecommerceConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Truy vấn để lấy UserID nếu username và password khớp
                string query = "SELECT user_id FROM Users WHERE username=@Username AND password=@Password AND role_id=1";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                con.Open();
                object result = cmd.ExecuteScalar();
                con.Close();

                if (result != null)
                {
                    int userId = Convert.ToInt32(result);
                    Session["Username"] = txtUsername.Text.Trim();
                    Session["UserID"] = userId;  // Tạo session UserID
                    Response.Redirect("List.aspx");
                }
                else
                {
                    lblMessage.Text = "Username or Password is incorrect.";
                }
            }
        }
    }
}