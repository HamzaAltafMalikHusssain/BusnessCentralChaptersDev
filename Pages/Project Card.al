page 60011 "Project Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Project;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }

            part(ProjectTasks; "Project Task Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Project No." = field("Project No.");
            }
        }
    }
}
