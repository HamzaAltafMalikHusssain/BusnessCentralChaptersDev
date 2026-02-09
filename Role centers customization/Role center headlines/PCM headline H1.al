page 60101 "PCM headline H1"
{
    PageType = HeadlinePart;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(WelcomeHeadline; WelcomeTxt)
            {
                ApplicationArea = All;
            }
            field(ProjectStatsHeadline; ProjectStatsTxt)
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    var
        ProjectRec: Record Project;
        CostingRec: Record "Project Costing";
        ProjectCount: Integer;
        ActiveCostingCount: Integer;
    begin
        WelcomeTxt := StrSubstNo('<qualifier>Welcome</qualifier><payload>Hi <emphasize>%1</emphasize>, Welcome to the Project Cost Management workspace</payload>', UserId());

        ProjectCount := ProjectRec.Count();
        ActiveCostingCount := CostingRec.Count();

        ProjectStatsTxt := StrSubstNo('<qualifier>Project Overview</qualifier><payload>%1 projects with <emphasize>%2</emphasize> active costing are currently active</payload>', ProjectCount, ActiveCostingCount);
    end;

    var
        WelcomeTxt: Text;
        ProjectStatsTxt: Text;
}