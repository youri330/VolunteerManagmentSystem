﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static VolunteerManagentSystem.Models.CommonF;

namespace VolunteerManagentSystem.Regular
{
    public partial class RegularProjects : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProjects();
            }
        }
        protected void GetProjects()
        {
            DataTable dt = fn.Fetch("SELECT Row_NUMBER() OVER (ORDER BY (SELECT 1)) AS [№], ProjectID, ProjectName FROM Projects");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetProjects();
        }
    }

}