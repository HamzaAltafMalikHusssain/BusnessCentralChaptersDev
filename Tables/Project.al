table 60004 Project
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Project No."; Code[20]) { }
        field(2; Description; Text[50]) { }
        field(3; "Allowed costing amount"; Decimal) { }
    }

    keys
    {
        key(PK; "Project No.") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Project No.", Description, "Allowed costing amount") { }
    }
}
