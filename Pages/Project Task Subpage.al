page 60012 "Project Task Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Project Task";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
