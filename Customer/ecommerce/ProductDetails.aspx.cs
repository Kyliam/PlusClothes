using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sku = Request.QueryString["sku"];
                if (!string.IsNullOrEmpty(sku))
                {
                    LoadProductDetails(sku);
                }
            }
        }

        protected void LoadProductDetails(string sku)
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            string productQuery = @"
            SELECT product_name, price, category_id, image, description
            FROM Products
            WHERE SKU = @Sku ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand productCommand = new SqlCommand(productQuery, connection);
                productCommand.Parameters.AddWithValue("@Sku", sku);

                connection.Open();
                SqlDataReader productReader = productCommand.ExecuteReader();

                if (productReader.Read())
                {
                    name.Text = productReader["product_name"].ToString();
                    price.Text = ((decimal)productReader["price"]).ToString("N0");
                    des.Text = productReader["description"].ToString().Replace(".", ".<br />");
                    productImage.ImageUrl = $"~/imgs/{productReader["image"].ToString()}";

                    int categoryId = (int)productReader["category_id"];
                    productReader.Close();

                    // Load related products
                    LoadRelatedProducts(categoryId, sku, connection);
                }
                else
                {
                    productReader.Close();
                }
            }
        }

        private void LoadRelatedProducts(int categoryId, string sku, SqlConnection connection)
        {
            string relatedProductsQuery = @"
            SELECT TOP 6 SKU, product_name, price, image
            FROM Products
            WHERE category_id = @CategoryId AND SKU != @Sku";

            SqlCommand relatedProductsCommand = new SqlCommand(relatedProductsQuery, connection);
            relatedProductsCommand.Parameters.AddWithValue("@CategoryId", categoryId);
            relatedProductsCommand.Parameters.AddWithValue("@Sku", sku);

            SqlDataAdapter adapter = new SqlDataAdapter(relatedProductsCommand);
            DataTable relatedProductsTable = new DataTable();
            adapter.Fill(relatedProductsTable);

            // Bind related products to ListView
            relatedProductsListView.DataSource = relatedProductsTable;
            relatedProductsListView.DataBind();
        }


        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Write("<script>alert('Vui lòng đăng nhập để mua hàng');</script>");
                return;
            }

            string sku = Request.QueryString["sku"];
            string size = ddlSize.SelectedValue; // Lấy size từ DropDownList
            int quantity = int.Parse(txtQuantity.Text);
            int userId = (int)Session["userId"];

            int productId = GetProductIdBySkuAndSize(sku, size);

            if (productId != 0)
            {
                AddToCart(productId, quantity, userId);
                Response.Redirect("~/Cart.aspx");
            }
            else
            {
                // Xử lý khi không tìm thấy sản phẩm
                Response.Write("<script>alert('Sản phẩm không tồn tại');</script>");
            }
        }


        protected void increaseQuantity_Click(object sender, EventArgs e)
        {
            int quantity = int.Parse(txtQuantity.Text);
            quantity++;
            txtQuantity.Text = quantity.ToString();
        }

        protected void decreaseQuantity_Click(object sender, EventArgs e)
        {
            int quantity = int.Parse(txtQuantity.Text);
            if (quantity > 1)
            {
                quantity--;
                txtQuantity.Text = quantity.ToString();
            }
        }

        protected int GetProductIdBySkuAndSize(string sku, string size)
        {
            int productId = 0;
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            string query = "SELECT product_id FROM Products WHERE SKU = @Sku AND size = @Size";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Sku", sku);
                command.Parameters.AddWithValue("@Size", size);

                connection.Open();
                var result = command.ExecuteScalar();
                if (result != null && int.TryParse(result.ToString(), out productId))
                {
                    return productId;
                }
            }

            return productId;
        }


        protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sku = Request.QueryString["sku"];
            LoadProductDetails(sku);
        }


        protected void AddToCart(int productId, int quantity, int userId)
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            string checkQuery = "SELECT COUNT(*) FROM Carts WHERE product_id = @ProductId AND user_id = @UserId";
            string insertQuery = "INSERT INTO Carts (quantity, user_id, product_id) VALUES (@Quantity, @UserId, @ProductId)";
            string updateQuery = "UPDATE Carts SET quantity = quantity + @Quantity WHERE product_id = @ProductId AND user_id = @UserId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                checkCommand.Parameters.AddWithValue("@ProductId", productId);
                checkCommand.Parameters.AddWithValue("@UserId", userId);

                connection.Open();
                int count = (int)checkCommand.ExecuteScalar();

                if (count > 0)
                {
                    // Nếu sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                    SqlCommand updateCommand = new SqlCommand(updateQuery, connection);
                    updateCommand.Parameters.AddWithValue("@Quantity", quantity);
                    updateCommand.Parameters.AddWithValue("@ProductId", productId);
                    updateCommand.Parameters.AddWithValue("@UserId", userId);
                    updateCommand.ExecuteNonQuery();
                }
                else
                {
                    // Nếu sản phẩm chưa có trong giỏ hàng, chèn mới
                    SqlCommand insertCommand = new SqlCommand(insertQuery, connection);
                    insertCommand.Parameters.AddWithValue("@Quantity", quantity);
                    insertCommand.Parameters.AddWithValue("@UserId", userId);
                    insertCommand.Parameters.AddWithValue("@ProductId", productId);
                    insertCommand.ExecuteNonQuery();
                }
            }
        }

    }
}
