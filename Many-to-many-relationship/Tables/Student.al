table 50130 Student
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Student No."; Code[20]) { }
        field(2; Name; Text[100]) { }
    }

    keys
    {
        key(PK; "Student No.") { Clustered = true; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Student No.", Name) { }
    }
}
