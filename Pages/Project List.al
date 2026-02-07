page 60010 "Project List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Project;
    CardPageId = "Project Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Allowed costing amount"; Rec."Allowed costing amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
