using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static VolunteerManagentSystem.Models.CommonF;

namespace VolunteerManagentSystem.Admin
{
    public partial class Manager : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }   
            if (!IsPostBack)
            {
                GetManager();
            }
        }

        protected void GetManager()
        {
            DataTable dt = fn.Fetch(@"SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) as [#], ManagerID, [Name], Date_of_Birth,
                Gender, Phone_number, Cuty, [Address_man], [Password_manager] FROM Manager");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if(ddlGender.SelectedValue != "0")
                {
                    string phoneN = txtPhone.Text.Trim();
                    DataTable dt = fn.Fetch("SELECT * FROM Manager WHERE Phone_number = '" + phoneN + "'");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "INSERT INTO Manager(Name, Date_of_birth, Gender, Phone_number, Cuty, Address_man, Password) VALUES ('"
                            + txtName.Text.Trim() + "', '" + txtDoB.Text.Trim() + "', '" + ddlGender.SelectedValue + "', '" + txtPhone.Text.Trim()+
                            "', '" + txtCity.Text.Trim() + "', '" + txtAddress.Text.Trim()+ "','" + txtPassword.Text.Trim() + "')";
                        fn.Query(query);
                        lblMsg.Text = "Кіраўнік быў паспяхова даданы!";
                        lblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        txtPhone.Text = string.Empty;
                        txtCity.Text = string.Empty;
                        txtAddress.Text = string.Empty;
                        txtPassword.Text = string.Empty;
                        GetManager();
                    }
                    else
                    {
                        lblMsg.Text = "Такі кіраўнік ужо існуе!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "Выбярыце гендар!";
                    lblMsg.CssClass = "alert alert-danger";
                }
                

            }
            catch(Exception ex)
            {

            }
        }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetManager();
        }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetManager();
        }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetManager();

        }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int mId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtName") as TextBox).Text;
                string phone = (row.FindControl("txtPhone") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;
                string password = (row.FindControl("txtPassword") as TextBox).Text;
                string city = (row.FindControl("txtCity") as TextBox).Text;
                fn.Query("UPDATE Manager SET Name = '" + name.Trim() + "', Phone_number = '" + phone.Trim() + "', Address_man = '" +
                    address.Trim() + "'Cuty='"+ city.Trim() + "'Password_manager ='" + password.Trim() +"' WHERE TeamID ='" + mId + "'");
                lblMsg.Text = "Вы абнавілі інфармацыю кіраўніка!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetManager();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</scrirt>");
            }
        }
    }
}