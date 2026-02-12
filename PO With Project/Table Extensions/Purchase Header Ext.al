tableextension 60004 "Purchase Header Ext" extends "Purchase Header"
{
    fields
    {
        field(235; "Project No."; Code[20])
        {
            Caption = 'Project No.';
            TableRelation = "Project";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}