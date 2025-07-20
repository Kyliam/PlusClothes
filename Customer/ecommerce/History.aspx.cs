using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ecommerce
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderHistory();
            }
        }

        private void LoadOrderHistory()
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            int userId = (int)Session["userId"];
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT O.order_id, O.order_date, O.total_price, S.address, S.state
                    FROM Orders O
                    JOIN Shipment S ON O.shipment_id = S.shipment_id
                    WHERE O.user_id = @UserId
                    ORDER BY O.order_date DESC";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserId", userId);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable orderTable = new DataTable();

                connection.Open();
                adapter.Fill(orderTable);
                connection.Close();

                rptOrderHistory.DataSource = orderTable;
                rptOrderHistory.DataBind();
            }
        }


        protected string GetStateColor(object state)
        {
            string stateValue = state.ToString().ToLower(); // Chuyển đổi giá trị state về chữ thường để dễ so sánh

            switch (stateValue)
            {
                case "đã giao":
                    return "text-green-500"; // Lớp CSS cho màu xanh lá cây
                case "trả hàng":
                    return "text-red-600"; // Lớp CSS cho màu đỏ
                case "đang xử lý":
                    return "text-blue-500"; // Lớp CSS cho màu xanh dương
                default:
                    return ""; // Nếu không khớp, không áp dụng lớp CSS nào
            }
        }
    }
}
