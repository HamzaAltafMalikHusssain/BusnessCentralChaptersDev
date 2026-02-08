table 50150 Employees
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No."; Code[20]) { }
        field(2; Name; Text[100]) { }
    }

    keys
    {
        key(PK; "Employee No.") { Clustered = true; }
    }
}
