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
    public partial class Project : System.Web.UI.Page
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
                GetProject();
            }
        }

        protected void GetTeam()
        {
            DataTable dt = fn.Fetch("SELECT Row_NUMBER() OVER (ORDER BY (SELECT 1)) AS [№], TeamID, TeamName FROM Team");
            ddlTeam.DataSource = dt;
            ddlTeam.DataTextField = "TeamName";
            ddlTeam.DataValueField = "TeamID";
            ddlTeam.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("SELECT * FROM Projects WHERE TeamID = '" + ddlTeam.SelectedItem.Value + "'and ProjectName = '" + txtProject.Text.Trim() + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "INSERT INTO Projects values('" + ddlTeam.SelectedItem.Value + "','" + txtProject.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Праграма была паспяхова даданы!";
                    lblMsg.CssClass = "alert alert-success";
                    ddlTeam.SelectedIndex = 0;
                    txtProject.Text = string.Empty;
                    GetProject();
                }
                else
                {
                    lblMsg.Text = "Гэта праграма ужо назначаны гэтай камандзе!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetProject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetProject();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetProject();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int proId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string teID = Convert.ToString(GridView1.DataKeys[e.RowIndex].Values[0]);
                string proName = (row.FindControl("txtProjectEdit") as TextBox).Text;
                fn.Query("UPDATE Projects SET TeamId = '" + teID + "', ProjectName ='" + proName + "' WHERE ProjectID = '"
                    + proId + "'");
                lblMsg.Text = "Вы абнавілі інфармацыю праграмы!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetProject();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</scrirt>");
            }
        }

        protected void GetProject()
        {
            DataTable dt = fn.Fetch("SELECT Row_NUMBER() OVER (ORDER BY (SELECT 1)) AS [№], p.ProjectID, p.TeamId, t.TeamName," +
                "p.ProjectName FROM Projects p INNER JOIN Team t on t.TeamId = p.TeamId");
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }


    }
}
