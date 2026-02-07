page 60021 "Project Costing Card"
{
    PageType = Card;
    SourceTable = "Project Costing";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Costing ID"; Rec."Costing ID")
                {
                    ApplicationArea = All;
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                }
                field("Costing description"; Rec."Costing description")
                {
                    ApplicationArea = All;
                }
                field("Costing date"; Rec."Costing date")
                {
                    ApplicationArea = All;
                }
            }

            part(CostingLines; "Project Costing Lines Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Costing ID" = field("Costing ID");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(FetchProjectTasks)
            {
                ApplicationArea = All;
                Caption = 'Fetch Project Tasks';
                Image = GetLines;

                trigger OnAction()
                begin
                    FetchProjectTaskLines();
                end;
            }
        }
    }

    local procedure FetchProjectTaskLines()
    var
        ProjectTask: Record "Project Task";
        CostingLine: Record "Project Costing Lines";
    begin
        Rec.TestField("Project No.");
        Rec.TestField("Costing ID");

        ProjectTask.SetRange("Project No.", Rec."Project No.");

        if ProjectTask.FindSet() then begin
            repeat
                if not CostingLine.Get(Rec."Costing ID", ProjectTask."Task No.") then begin
                    CostingLine.Init();
                    CostingLine."Costing ID" := Rec."Costing ID";
                    CostingLine."Task No." := ProjectTask."Task No.";
                    CostingLine.Description := ProjectTask.Description;
                    CostingLine.Insert();
                end;
            until ProjectTask.Next() = 0;
        end;
    end;
}
