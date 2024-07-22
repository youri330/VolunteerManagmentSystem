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
    public partial class WebForm1 : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
                ManagerCount();
            VolunteerCount();
            TeamCount();
            ProjectCount();
        }

        void ManagerCount()
        {
            DataTable dt = fn.Fetch("Select Count(*) From Manager");
            Session["manager"] = dt.Rows[0][0];
        }
        void VolunteerCount()
        {
            DataTable dt = fn.Fetch("Select Count(*) From Volunteer");
            Session["volunteer"] = dt.Rows[0][0];
        }
        void TeamCount()
        {
            DataTable dt = fn.Fetch("Select Count(*) From Team");
            Session["team"] = dt.Rows[0][0];
        }
        void ProjectCount()
        {
            DataTable dt = fn.Fetch("Select Count(*) From Projects");
            Session["project"] = dt.Rows[0][0];
        }
    }
}