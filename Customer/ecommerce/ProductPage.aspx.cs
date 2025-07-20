using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class ProductPage : System.Web.UI.Page
    {
        private const int PageSize = 6; // Số sản phẩm trên mỗi trang
        private int currentPage = 1; // Trang hiện tại, mặc định là 1

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["category_id"] != null)
                {
                    int categoryId;
                    if (int.TryParse(Request.QueryString["category_id"], out categoryId))
                    {
                        if (Request.QueryString["page"] != null)
                        {
                            int.TryParse(Request.QueryString["page"], out currentPage);
                        }
                        LoadProducts(categoryId, currentPage);
                    }
                }
            }
        }

        protected void LoadProducts(int categoryId, int pageIndex)
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string searchKeyword = txtSearch.Text.Trim();
                string minPriceText = txtMinPrice.Text.Trim();
                string maxPriceText = txtMaxPrice.Text.Trim();

                decimal minPrice;
                decimal maxPrice;

                bool isMinPriceValid = decimal.TryParse(minPriceText, out minPrice);
                bool isMaxPriceValid = decimal.TryParse(maxPriceText, out maxPrice);

                string query = @"
                WITH DistinctProducts AS (
                SELECT SKU, product_id, product_name, FORMAT(price, 'N0') AS formatted_price, category_id, image,
                       ROW_NUMBER() OVER (PARTITION BY SKU ORDER BY product_id) AS RowNum
                FROM Products
                WHERE category_id = @CategoryId";

                // Thêm điều kiện tìm kiếm theo tên sản phẩm
                if (!string.IsNullOrEmpty(searchKeyword))
                {
                    query += " AND product_name LIKE @SearchKeyword";
                }
                // Thêm điều kiện tìm kiếm theo khoảng giá
                if (isMinPriceValid)
                {
                    query += " AND price >= @MinPrice";
                }
                if (isMaxPriceValid)
                {
                    query += " AND price <= @MaxPrice";
                }

                query += @"
                ),
                RankedProducts AS (
                    SELECT * FROM DistinctProducts WHERE RowNum = 1
                ),
                PagedProducts AS (
                    SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) AS RowNumber
                    FROM RankedProducts
                )
                SELECT SKU, product_id, product_name, formatted_price, category_id, image
                FROM PagedProducts
                WHERE RowNumber BETWEEN @StartIndex AND @EndIndex
                ORDER BY product_id";


                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CategoryId", categoryId);
                command.Parameters.AddWithValue("@StartIndex", (pageIndex - 1) * PageSize + 1);
                command.Parameters.AddWithValue("@EndIndex", pageIndex * PageSize);

                // Thêm các tham số cho tìm kiếm theo tên sản phẩm và khoảng giá
                if (!string.IsNullOrEmpty(searchKeyword))
                {
                    command.Parameters.AddWithValue("@SearchKeyword", "%" + searchKeyword + "%");
                }
                if (isMinPriceValid)
                {
                    command.Parameters.AddWithValue("@MinPrice", minPrice);
                }
                if (isMaxPriceValid)
                {
                    command.Parameters.AddWithValue("@MaxPrice", maxPrice);
                }


                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable productsTable = new DataTable();

                connection.Open();
                adapter.Fill(productsTable);
                connection.Close();

                rptProducts.DataSource = productsTable;
                rptProducts.DataBind();

                // Tính số lượng sản phẩm để tạo phân trang
                int totalProducts = GetTotalProductsCount(categoryId);
                GeneratePagination(totalProducts);
            }
        }

        protected int GetTotalProductsCount(int categoryId)
        {
            int totalProducts = 0;
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT COUNT(DISTINCT SKU) AS TotalProducts
                    FROM Products
                    WHERE category_id = @CategoryId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CategoryId", categoryId);

                connection.Open();
                totalProducts = (int)command.ExecuteScalar();
                connection.Close();
            }
            return totalProducts;
        }

        protected void GeneratePagination(int totalItems)
        {
            int totalPages = (int)Math.Ceiling((double)totalItems / PageSize);
            for (int i = 1; i <= totalPages; i++)
            {
                HyperLink pageLink = new HyperLink();
                pageLink.Text = i.ToString();
                pageLink.NavigateUrl = $"~/ProductPage.aspx?category_id={Request.QueryString["category_id"]}&page={i}";

                if (i == currentPage)
                {
                    pageLink.CssClass = "current";
                }
                else
                {
                    pageLink.CssClass = "pager";
                }

                paginationContainer.Controls.Add(pageLink);
                paginationContainer.Controls.Add(new LiteralControl("&nbsp;")); // Thêm dấu cách giữa các liên kết
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["category_id"] != null)
            {
                int categoryId;
                if (int.TryParse(Request.QueryString["category_id"], out categoryId))
                {
                    currentPage = 1; // Reset lại trang khi thực hiện tìm kiếm
                    LoadProducts(categoryId, currentPage);
                }
            }
        }
    }
}
