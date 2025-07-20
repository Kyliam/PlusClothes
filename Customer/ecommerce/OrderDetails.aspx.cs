using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ecommerce
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderDetails();
            }
        }

        private void LoadOrderDetails()
        {
            if (Session["userId"] == null || Request.QueryString["order_id"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            int orderId = int.Parse(Request.QueryString["order_id"]);
            int userId = (int)Session["userId"];
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT P.product_name, OI.quantity, OI.price,
                           (OI.quantity * OI.price) AS total_price
                    FROM Order_Item OI
                    JOIN Products P ON OI.product_id = P.product_id
                    JOIN Orders O ON OI.order_id = O.order_id
                    WHERE OI.order_id = @OrderId AND O.user_id = @UserId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@OrderId", orderId);
                command.Parameters.AddWithValue("@UserId", userId);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable orderDetailsTable = new DataTable();

                connection.Open();
                adapter.Fill(orderDetailsTable);
                connection.Close();

                rptOrderDetails.DataSource = orderDetailsTable;
                rptOrderDetails.DataBind();
            }
        }
    }
}
