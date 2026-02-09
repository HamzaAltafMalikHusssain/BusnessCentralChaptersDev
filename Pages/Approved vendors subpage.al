page 60023 "Approved Vendors Subpage"
{
    PageType = ListPart;
    SourceTable = "Project Approved Vendors";
    ApplicationArea = All;
    AutoSplitKey = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Approved Vendor"; Rec."Approved project vendor")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Approved Date"; Rec."Approved date")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
