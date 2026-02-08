table 60006 "Project Costing"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Costing ID"; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Project No."; Code[20])
        {
            TableRelation = Project."Project No.";

            trigger OnValidate()
            var
                ProjectRec: Record Project;
                CostingRec: Record "Project Costing";
            begin
                if "Project No." = '' then
                    exit;

                // Get Project
                if not ProjectRec.Get("Project No.") then
                    exit;

                // Only check if project is restricted to one costing
                if ProjectRec."Allowed to be used" then begin
                    CostingRec.Reset();
                    CostingRec.SetRange("Project No.", "Project No.");

                    // Exclude current record (important on modify)
                    CostingRec.SetFilter("Costing ID", '<>%1', "Costing ID");

                    if CostingRec.FindFirst() then
                        Error(
                            'Project %1 has already been used by Costing %2.',
                            "Project No.",
                            CostingRec."Costing ID"
                        );
                end;
            end;
        }

        field(3; "Costing description"; Text[50])
        {

        }
        field(4; "Costing date"; Date)
        {

        }
        field(5; "Created By"; Code[50])
        {
            Editable = false;
        }


    }

    keys
    {
        key(PK; "Costing ID")
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
        "Created By" := UserId();

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

}