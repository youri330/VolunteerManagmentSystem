﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VolunteerManagentSystem.Manager
{
    public partial class ManagerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["staf"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }
}