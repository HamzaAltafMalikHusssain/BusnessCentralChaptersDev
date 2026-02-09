// Query 60100 - Project Budget Query
query 60100 "Project Budget Query"
{
    QueryType = Normal;

    elements
    {
        dataitem(Project; Project)
        {
            column(TotalAllowedAmount; "Allowed costing amount")
            {
                Method = Sum;
            }

            dataitem(ProjectCosting; "Project Costing")
            {
                DataItemLink = "Project No." = Project."Project No.";
                SqlJoinType = LeftOuterJoin;

                dataitem(CostingLines; "Project Costing Lines")
                {
                    DataItemLink = "Costing ID" = ProjectCosting."Costing ID";
                    SqlJoinType = LeftOuterJoin;

                    column(TotalConsumedAmount; "Cost Amount")
                    {
                        Method = Sum;
                    }
                }
            }
        }
    }

    // Then you could add a FlowField in your table:
    // field(6; "Available Amount"; Decimal)
    // {
    //     FieldClass = FlowField;
    //     CalcFormula = lookup("Project Budget Query".TotalAllowedAmount) - 
    //                   lookup("Project Budget Query".TotalConsumedAmount);
    // }
}