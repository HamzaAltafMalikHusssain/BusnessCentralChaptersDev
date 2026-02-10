table 60004 Project
{
    DataClassification = CustomerContent;
    Caption = 'Project';

    fields
    {
        field(1; "Project No."; Code[20])
        {
            Caption = 'Project No.';
            Editable = false;

            trigger OnValidate()
            var
                SalesSetup: Record "Sales & Receivables Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if "Project No." <> xRec."Project No." then begin
                    SalesSetup.Get();
                    NoSeries.TestManual(SalesSetup."Project Nos.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }

        field(3; "Allowed costing amount"; Decimal)
        {
            Caption = 'Allowed Costing Amount';
        }

        field(4; "Allowed to be used"; Boolean)
        {
            Caption = 'Allowed costing on one project';
        }

        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Project No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Project No.", Description, "Allowed costing amount") { }
    }

    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "Project No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Project Nos.");
            "No. Series" := SalesSetup."Project Nos.";
            "Project No." := NoSeries.GetNextNo("No. Series", WorkDate());
        end;
    end;

    procedure AssistEdit(OldProject: Record Project): Boolean
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        SalesSetup.Get();
        SalesSetup.TestField("Project Nos.");

        if NoSeries.LookupRelatedNoSeries(
            SalesSetup."Project Nos.",
            OldProject."No. Series",
            "No. Series")
        then begin
            "Project No." := NoSeries.GetNextNo("No. Series", WorkDate());
            exit(true);
        end;
    end;
}
