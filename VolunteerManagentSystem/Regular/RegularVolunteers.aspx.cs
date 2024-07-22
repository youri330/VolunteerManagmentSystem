using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static VolunteerManagentSystem.Models.CommonF;

namespace VolunteerManagentSystem.Regular
{
    public partial class RegularVolunteers : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 GetVolunteer();
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
    }
}