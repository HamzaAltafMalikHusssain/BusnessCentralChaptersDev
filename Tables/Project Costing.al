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
        }
        field(3; "Costing description"; Text[50])
        {

        }
        field(4; "Costing date"; Date)
        {

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