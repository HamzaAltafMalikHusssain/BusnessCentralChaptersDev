page 60020 "Project Costing List"
{
    PageType = List;
    SourceTable = "Project Costing";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Project Costing Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Costing ID"; Rec."Costing ID") { }
                field("Project No."; Rec."Project No.") { }
                field("Costing description"; Rec."Costing description") { }
                field("Costing date"; Rec."Costing date") { }
            }
        }
    }
}
