table 60002 TelevisionShow
{
    DataClassification = ToBeClassified;
    Caption = 'Television Show';
    Extensible = true;
    DataPerCompany = true;


    fields
    {
        field(1; Code; Code[20])
        {
            NotBlank = true;
        }
        field(2; Name; Text[100])
        {
            OptimizeForTextSearch = True;

        }
        field(3; Synopsis; Text[250])
        {

        }
        field(4; Status; Option)
        {
            OptionCaption = 'Active,Finished';
            OptionMembers = Active,Finished;
        }
        field(5; ReleaseDate; Date)
        {
            trigger OnValidate()
            begin
                // Do not allow dates before today
                if ReleaseDate < Today() then
                    Error('Release Date cannot be earlier than today.');

                // Do not allow dates after 31-12-2027
                if ReleaseDate > DMY2Date(31, 12, 2027) then
                    Error('Release Date cannot be later than 31-12-2027.');
            end;
        }


    }

    keys
    {
        key(PK; Code)
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