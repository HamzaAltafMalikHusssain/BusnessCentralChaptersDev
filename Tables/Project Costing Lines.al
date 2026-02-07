table 60007 "Project Costing Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Costing ID"; Code[20])
        {
            TableRelation = "Project Costing"."Costing ID";
        }
        field(2; "Task No."; Integer)
        {

        }
        field(3; Description; Text[50]) { }
        field(4; "Cost Type"; Option)
        {
            OptionMembers = Material,Labor,Overhead,Subcontractor,Other;
        }
        field(5; "Cost Amount"; Decimal)
        {
            trigger OnValidate()
            begin
                ValidateTotalCostingAmount();
            end;
        }
    }

    keys
    {
        key(PK; "Costing ID", "Task No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


    local procedure ValidateTotalCostingAmount()
    var
        CostingHeader: Record "Project Costing";
        ProjectRec: Record Project;
        CostingLine: Record "Project Costing Lines";
        TotalAmount: Decimal;
    begin
        // Get costing header
        if not CostingHeader.Get("Costing ID") then
            exit;

        // Get related project
        if not ProjectRec.Get(CostingHeader."Project No.") then
            exit;

        // Calculate total costing lines
        CostingLine.SetRange("Costing ID", "Costing ID");
        TotalAmount := 0;

        if CostingLine.FindSet() then
            repeat
                TotalAmount += CostingLine."Cost Amount";
            until CostingLine.Next() = 0;

        // Validate against allowed amount
        if TotalAmount > ProjectRec."Allowed costing amount" then
            Error(
                'Total costing amount (%1) exceeds the allowed amount (%2) for Project %3.',
                TotalAmount,
                ProjectRec."Allowed costing amount",
                ProjectRec."Project No."
            );
    end;

}