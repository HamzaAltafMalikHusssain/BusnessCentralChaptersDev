table 60005 "Project Task"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Project No."; Code[20])
        {
            TableRelation = Project."Project No.";
        }
        field(2; "Task No."; Integer) { }
        field(3; Description; Text[50]) { }
    }

    keys
    {
        key(PK; "Project No.", "Task No.") { }
    }
}
