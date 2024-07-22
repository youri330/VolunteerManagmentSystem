using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static VolunteerManagentSystem.Models.CommonF;

namespace VolunteerManagentSystem.Admin
{
    public partial class ManagerProject : System.Web.UI.Page
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
                GetManager();
                GetProjectManager();              
            }
        }

        protected void GetManager()
        {
            DataTable dt = fn.Fetch("SELECT * FROM Manager");
            ddlManager.DataSource = dt;
            ddlManager.DataTextField = "Name";
            ddlManager.DataValueField = "ManagerID";
            ddlManager.DataBind();
            ddlManager.Items.Insert(0, "Выберыце кіраўніка");
        }

        protected void GetProjectManager()
        {
            DataTable dt = fn.Fetch("SELECT Row_NUMBER() OVER (ORDER BY (SELECT 1)) AS [№], pm.ProjectID, p.ProjectName, t.TeamID, t.TeamName, " +
                "pm.ManagerID, m.Name FROM ProjectManager pm INNER JOIN Team t on t.TeamId = pm.TeamId " +
                " INNER JOIN Projects p on p.ProjectId = pm.ProjectId INNER JOIN Manager m on m.ManagerID = pm.ManagerID");
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void ddlTeam_SelectedIndexChanged(object sende, EventArgs e)
        {
            string teamID = ddlTeam.SelectedValue;
            DataTable dt = fn.Fetch("SELECT * FROM Projects WHERE TeamID = '" + teamID + "' ");
            ddlProject.DataSource = dt;
            ddlProject.DataTextField = "ProjectName";
            ddlProject.DataValueField = "ProjectID";
            ddlProject.DataBind();
            ddlProject.Items.Insert(0, "Выберыце праграму");

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string teamID = ddlTeam.SelectedValue;
                string projectID = ddlTeam.SelectedValue;
                string managerID = ddlTeam.SelectedValue;
                DataTable dt = fn.Fetch("SELECT * FROM ProjectManager WHERE TeamID = '" + teamID + 
                    "' and ProjectID = '" + projectID + "' and ManagerID = '" + managerID + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into ProjectManager values('" + teamID + "','" + projectID + "','" + managerID + "')";
                    fn.Query(query);
                    lblMsg.Text = "Кіраўнік цяпер займаецца гэтай праграмай!";
                    lblMsg.CssClass = "alert alert-success";
                    ddlTeam.SelectedIndex = 0;
                    ddlProject.SelectedIndex = 0;
                    ddlManager.SelectedIndex = 0;
                    GetProjectManager();
                }
                else
                {
                    lblMsg.Text = "Гэтую праграму для гэай каманды ўжо вядзе гэты кіраўнік!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        protected void GetTeam()
        {
            DataTable dt = fn.Fetch("SELECT * FROM Team");
            ddlTeam.DataSource = dt;
            ddlTeam.DataTextField = "TeamName";
            ddlTeam.DataValueField = "TeamID";
            ddlTeam.DataBind();
            ddlTeam.Items.Insert(0, "Выберыце каманду");
        }

        protected void GetProject()
        {
            DataTable dt = fn.Fetch("SELECT * FROM Projects");
            ddlProject.DataSource = dt;
            ddlProject.DataTextField = "ProjectName";
            ddlProject.DataValueField = "ProjectID";
            ddlProject.DataBind();
            ddlProject.Items.Insert(0, "Выберыце праграму");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetProjectManager();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetProjectManager();
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
                int projectManagerID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                String teamID = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlTeamGv")).SelectedValue;
                String projectID = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlProjectGv")).SelectedValue;
                String managerID = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlManagerGv")).SelectedValue;
                fn.Query("UPDATE ProjectManager SET TeamID = '" + teamID + "', ProjectID = '" + projectID + "', ProjectID = '" + managerID + "' where ID ='" + projectManagerID + "'");
                lblMsg.Text = "Вы абнавілі інфармацыю!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetProjectManager();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</scrirt>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlTeam = (DropDownList)e.Row.FindControl("ddlTeamGV");
                    DropDownList ddlProject = (DropDownList)e.Row.FindControl("ddlProjectGV");
                    DataTable dt = fn.Fetch("Select * From Project where TeamID ='" + ddlTeam.SelectedValue + "' ");
                    ddlProject.DataSource = dt;
                    ddlProject.DataTextField = "ProjectName";
                    ddlProject.DataValueField = "ProjectID";
                    ddlProject.DataBind();
                    ddlProject.Items.Insert(0, "Select Project");
                    string managerprojectID = GridView1.DataKeys[e.Row.RowIndex].Value.ToString();
                    DataTable dataTable = fn.Fetch(@"Select pm.ID, pm.TeamID, pm.ProjectID, p.ProjectName, 
                                                    From ProjectManager pm Inner Join Project p on pm.ProjectID = p.ProjectID where pm.ID = '" + managerprojectID + "' ");
                }
            }
        }
    }

}
