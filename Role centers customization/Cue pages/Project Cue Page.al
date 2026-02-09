// Page 60101 - Project Cue Page (Simplified)
page 60102 "Project Cue Page"
{
    PageType = CardPart;
    SourceTable = "Project Cue Table";
    Caption = 'Project Overview';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            cuegroup(ProjectStatistics)
            {
                Caption = 'Project Statistics';

                field(TotalProjects; Rec."Total Projects")
                {
                    ApplicationArea = All;
                    Caption = 'Total Projects';
                    ToolTip = 'Total number of projects in the system';
                    DrillDownPageId = 60010;
                }

                field(TotalCostings; Rec."Total Costings")
                {
                    ApplicationArea = All;
                    Caption = 'Total Costings';
                    ToolTip = 'Total number of costing documents';
                    DrillDownPageId = 60020;
                }
            }

            cuegroup(FinancialOverview)
            {
                Caption = 'Financial Overview';
                CuegroupLayout = Wide;

                field(TotalAllowedAmount; Rec."Total Allowed Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Total Budget';
                    ToolTip = 'Total allowed costing amount across all projects';
                    AutoFormatType = 11;
                    DrillDownPageId = 60010;
                }

                field(TotalConsumedAmount; Rec."Total Consumed Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Costs Incurred';
                    ToolTip = 'Total cost amount consumed across all projects';
                    AutoFormatType = 11;
                    DrillDownPageId = 60020;
                }

                field(AvailableAmount; GetAvailableAmount())
                {
                    ApplicationArea = All;
                    Caption = 'Remaining Budget';
                    ToolTip = 'Total available budget (Budget - Costs)';
                    AutoFormatType = 11;
                    Editable = false;
                }
            }
        }
    }

    local procedure GetAvailableAmount(): Decimal
    begin
        exit(Rec."Total Allowed Amount" - Rec."Total Consumed Amount");
    end;

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}