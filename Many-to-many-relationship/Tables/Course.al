table 50131 Course
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Course Code"; Code[20]) { }
        field(2; Description; Text[100]) { }
    }

    keys
    {
        key(PK; "Course Code") { Clustered = true; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Course Code", Description) { }
    }
}
