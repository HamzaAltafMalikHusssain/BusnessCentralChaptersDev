page 60022 "Project Costing Lines Subpage"
{
    PageType = ListPart;
    SourceTable = "Project Costing Lines";
    ApplicationArea = All;
    AutoSplitKey = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Cost Type"; Rec."Cost Type")
                {
                    ApplicationArea = All;
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
