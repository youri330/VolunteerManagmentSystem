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
    public partial class WebForm2 : System.Web.UI.Page
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
            }
        }

        protected void GetTeam()
        {
            DataTable dt = fn.Fetch("SELECT Row_NUMBER() OVER (ORDER BY (SELECT 1)) AS [№], TeamID, TeamName FROM Team");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("SELECT * FROM Team WHERE TeamName = '"+txtTeam.Text.Trim()+"'");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert Into Team values('" +txtTeam.Text.Trim()+"')";
                    fn.Query(query);
                    lblMsg.Text = "Каманда была паспяхова дадана!";
                    lblMsg.CssClass = "alert alert-success";
                    txtTeam.Text = string.Empty;
                    GetTeam();
                }
                else
                {
                    lblMsg.Text = "Такая каманда ўжо існуе!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetTeam();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeam();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex]; 
                int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]); 
                string TeamName = (row.FindControl("txtTeamEdit") as TextBox).Text;
                fn.Query("UPDATE Team SET TeamName = '" + TeamName + "' where TeamID ='" + cId + "'");
                lblMsg.Text = "Вы абнавілі інфармацыю каманды!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetTeam();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</scrirt>");
            }
        }
    }
}