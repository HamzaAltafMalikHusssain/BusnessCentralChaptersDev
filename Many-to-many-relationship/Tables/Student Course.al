table 50132 "Student Course"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            TableRelation = Student;
        }
        field(2; "Course Code"; Code[20])
        {
            TableRelation = Course;
        }
    }

    keys
    {
        key(PK; "Student No.", "Course Code") { Clustered = true; }
    }
}
