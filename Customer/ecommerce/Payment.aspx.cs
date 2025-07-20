using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ecommerce
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
            }
        }

        private void LoadCartItems()
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
                    SELECT P.product_name, C.quantity, P.size, P.price, (P.price * C.quantity) AS total_price
                    FROM Carts C
                    JOIN Products P ON C.product_id = P.product_id
                    WHERE C.user_id = @UserId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserId", userId);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable cartTable = new DataTable();

                connection.Open();
                adapter.Fill(cartTable);
                connection.Close();

                rptCartItems.DataSource = cartTable;
                rptCartItems.DataBind();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            int userId = (int)Session["userId"];
            string address = txtAddress.Text;
            string name = txtName.Text;
            string phone = txtPhone.Text;

            if (string.IsNullOrWhiteSpace(address) ||
              string.IsNullOrWhiteSpace(name) ||
              string.IsNullOrWhiteSpace(phone))
            {
                 Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin!');</script>");
                return;
                
            }


            // Tạo một shipment mới
            int shipmentId = CreateShipment(userId, address, name, phone);

            // Tạo một order mới
            int orderId = CreateOrder(userId, shipmentId);

            // Thêm các mục vào order_item
            AddOrderItems(orderId, userId);

            // Xóa các mục đã mua khỏi giỏ hàng
            ClearCart(userId);

            Response.Redirect("~/HomePage.aspx");
        }

        private int CreateShipment(int userId, string address, string name, string phone)
        {
          
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO Shipment (address,name,phone,  user_id)
                    OUTPUT INSERTED.shipment_id
                    VALUES (@Address, @Name, @Phone,  @UserId)";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Address", address);
                command.Parameters.AddWithValue("@Name", name);
                command.Parameters.AddWithValue("@phone", phone);
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                int shipmentId = (int)command.ExecuteScalar();
                connection.Close();

                return shipmentId;
            }
        }

        private int CreateOrder(int userId, int shipmentId)
        {
            decimal totalPrice = CalculateTotalPrice(userId);
            DateTime orderDate = DateTime.Now;

            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO Orders (order_date, total_price, user_id, shipment_id)
                    OUTPUT INSERTED.order_id
                    VALUES (@OrderDate, @TotalPrice, @UserId, @ShipmentId)";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@OrderDate", orderDate);
                command.Parameters.AddWithValue("@TotalPrice", totalPrice);
                command.Parameters.AddWithValue("@UserId", userId);
                command.Parameters.AddWithValue("@ShipmentId", shipmentId);

                connection.Open();
                int orderId = (int)command.ExecuteScalar();
                connection.Close();

                return orderId;
            }
        }

        private decimal CalculateTotalPrice(int userId)
        {
            decimal totalPrice = 0;

            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT P.price, C.quantity
                    FROM Carts C
                    JOIN Products P ON C.product_id = P.product_id
                    WHERE C.user_id = @UserId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    decimal price = (decimal)reader["price"];
                    int quantity = (int)reader["quantity"];
                    totalPrice += price * quantity;
                }

                connection.Close();
            }

            return totalPrice;
        }

        private void AddOrderItems(int orderId, int userId)
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT C.product_id, C.quantity, P.price
                    FROM Carts C
                    JOIN Products P ON C.product_id = P.product_id
                    WHERE C.user_id = @UserId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int productId = (int)reader["product_id"];
                    int quantity = (int)reader["quantity"];
                    decimal price = (decimal)reader["price"];

                    AddOrderItem(orderId, productId, quantity, price);
                }

                connection.Close();
            }
        }

        private void AddOrderItem(int orderId, int productId, int quantity, decimal price)
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO Order_Item (order_id, product_id, quantity, price)
                    VALUES (@OrderId, @ProductId, @Quantity, @Price)";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@OrderId", orderId);
                command.Parameters.AddWithValue("@ProductId", productId);
                command.Parameters.AddWithValue("@Quantity", quantity);
                command.Parameters.AddWithValue("@Price", price);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private void ClearCart(int userId)
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    DELETE FROM Carts
                    WHERE user_id = @UserId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}
