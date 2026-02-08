table 50151 "Employee Profile"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employees;
        }
        field(2; "CNIC No."; Code[20]) { }
        field(3; "Blood Group"; Code[10]) { }
        field(4; "Date of Birth"; Date) { }
    }

    keys
    {
        key(PK; "Employee No.") { Clustered = true; }
    }
}
