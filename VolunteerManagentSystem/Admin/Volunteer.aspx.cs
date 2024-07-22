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
    public partial class Volunteer : System.Web.UI.Page
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
                GetTeam();
                GetVolunteer();
            }
        }

        protected void GetTeam()
        {
            DataTable dt = fn.Fetch("Select * From Team");
            ddlTeam.DataSource = dt;
            ddlTeam.DataTextField = "TeamName";
            ddlTeam.DataValueField = "TeamID";
            ddlTeam.DataBind();
            ddlTeam.Items.Insert(0, "Select Team");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string phoneN = txtPhone.Text.Trim();
                    DataTable dt = fn.Fetch("SELECT * FROM Volunteer WHERE Phone_number = '" + phoneN + "'");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "INSERT INTO Volunteer(First_name,Last_name, Date_of_birth, Gender, Phone_number, Cuty, Address_vol) VALUES ('"
                            + txtName.Text.Trim() + "','" + txtSurname.Text.Trim() + "', '" + txtDoB.Text.Trim() + "', '" + ddlGender.SelectedValue + "', '" + txtPhone.Text.Trim() +
                            "', '" + txtCity.Text.Trim() + "', '" + txtAddress.Text.Trim() + "')";
                        fn.Query(query);
                        lblMsg.Text = "Валанцёр быў паспяхова даданы!";
                        lblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                        txtSurname.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        txtPhone.Text = string.Empty;
                        txtCity.Text = string.Empty;
                        txtAddress.Text = string.Empty;
                        ddlTeam.SelectedIndex = 0;
                        GetVolunteer();
                    }
                    else
                    {
                        lblMsg.Text = "Такі валанцёр ужо існуе!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "Выбярыце гендар!";
                    lblMsg.CssClass = "alert alert-danger";
                }


            }
            catch (Exception ex)
            {

            }
        }
        protected void GetVolunteer()
        {
            DataTable dt = fn.Fetch(@"SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) as [#], v.VolunteerID, v.[First_name], v.[Last_name], v.Date_of_Birth,
                v.Gender, v.Phone_number, v.Cuty, v.[Address_vol] FROM Volunteer v INNER JOIN Team t on t.TeamID = v.TeamID");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetVolunteer();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetVolunteer();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetVolunteer();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int mId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string first_name = (row.FindControl("txtName") as TextBox).Text;
                string last_name = (row.FindControl("txtSurname") as TextBox).Text;
                string phone = (row.FindControl("txtPhone") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;
                string city = (row.FindControl("txtCity") as TextBox).Text;
                string teamID = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[5].FindControl("ddlTeam")).SelectedValue;
                fn.Query("UPDATE Volunteer SET First_name = '" + first_name.Trim() + "', Last_name = '" + last_name.Trim() + "', Phone_number = '" + phone.Trim() + "', Address_man = '" +
                    address.Trim() + "'Cuty='" + city.Trim() + "' WHERE TeamID ='" + mId + "'");
                lblMsg.Text = "Вы абнавілі інфармацыю кіраўніка!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetVolunteer();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</scrirt>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex==e.Row.RowIndex)
            {
                DropDownList ddlTeam = (DropDownList)e.Row.FindControl("ddlTeam");
                DataTable dt = fn.Fetch("Select * From Team");
                ddlTeam.DataSource = dt;
                ddlTeam.DataTextField = "TeamName";
                ddlTeam.DataValueField = "TeamID";
                ddlTeam.DataBind();
                ddlTeam.Items.Insert(0, "Select Project");
                string selectTeamv = DataBinder.Eval(e.Row.DataItem, "TeamName").ToString();
                ddlTeam.Items.FindByText(selectTeamv).Selected = true;
                    
            }
        }
    }
}

