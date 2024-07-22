using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static VolunteerManagentSystem.Models.CommonF;

namespace VolunteerManagentSystem
{
    public partial class Login : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string phone = inputPhone.Value.Trim();
            string password = inputPassword.Value.Trim();
            DataTable dt = fn.Fetch("Select * From Manager Where Phone_number = '" + phone + "' and Password_manager = '" + password + "' ");
            if (phone == "+3751111111111" && password == "AaBbCcDd")
            {
                Session["admin"] = phone;
                Response.Redirect("Admin/AdminHome.aspx");
            }
            else if(dt.Rows.Count > 0)
            {
                Session["staf"] = phone;
                Response.Redirect("Manager/ManagerHome.aspx");
            }
            else
            {
                lblMsg.Text = "Не атрымалася ўвайсці ў сістэму!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnRegular_Click(object sender, EventArgs e)
        {
            Response.Redirect("Regular/RegulatHome.aspx");
        }
    }
}