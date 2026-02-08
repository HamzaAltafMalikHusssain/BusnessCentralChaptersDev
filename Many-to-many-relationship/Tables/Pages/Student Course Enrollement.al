page 50132 "Student Course Enrollement"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Student Course";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = All;
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
