using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (!IsPostBack)
    
            {
                if (Session["userId"] == null)
                {

                    Response.Write("<script>alert('Vui lòng đăng nhập thêm sản phẩm vào giỏ hàng');</script>");
                }
                else
                {
                    LoadCartItems();

                }
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
                    SELECT C.cart_id, P.product_name, P.image, P.size, C.quantity, FORMAT(P.price, 'N0') AS formatted_price
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

                CalculateTotalPrice(cartTable);
            }
        }

        private void CalculateTotalPrice(DataTable cartTable)
        {
            decimal totalPrice = 0;
            foreach (DataRow row in cartTable.Rows)
            {
                decimal price = decimal.Parse(row["formatted_price"].ToString().Replace(",", ""));
                int quantity = int.Parse(row["quantity"].ToString());
                totalPrice += price * quantity;
            }

            lblTotalPrice.Text = totalPrice.ToString("N0") + " VND";
        }

        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            int userId = (int)Session["userId"];
            int cartId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "IncreaseQuantity")
            {
                UpdateQuantity(cartId, 1);
            }
            else if (e.CommandName == "DecreaseQuantity")
            {
                UpdateQuantity(cartId, -1);
            }
            else if (e.CommandName == "RemoveItem")
            {
                RemoveCartItem(cartId);
            }

            LoadCartItems(); // Sau khi thực hiện hành động, tải lại danh sách giỏ hàng
        }

        private void UpdateQuantity(int cartId, int delta)
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    UPDATE Carts
                    SET quantity = quantity + @Delta
                    WHERE cart_id = @CartId AND quantity + @Delta > 0";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Delta", delta);
                command.Parameters.AddWithValue("@CartId", cartId);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private void RemoveCartItem(int cartId)
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    DELETE FROM Carts
                    WHERE cart_id = @CartId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CartId", cartId);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Thực hiện logic thanh toán tại đây
        }
    }
}
