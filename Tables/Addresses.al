table 60003 Address
{
    Caption = 'Addresses information';
    DataPerCompany = true;

    fields
    {
        field(1; Address; Text[50])
        {
            Caption = 'Address retrieved by Service';
            // in 2024 release wave 2, you can define that table fields are included in optimized text search
            OptimizeForTextSearch = true;
        }
        field(2; Locality; Text[30])
        {
            Caption = 'Locality retrieved by Service';
            Description = 'Locality feature likely to change in vNext'; // Internal note (not shown in the client)
            OptimizeForTextSearch = true;
        }
        field(3; "Town/City"; Text[30])
        {
            Caption = 'Town/City retrieved by Service';
            // in 2024 release wave 1, you can define tooltips on the table field level            
            ToolTip = 'Town/City retrieved by Service';
            OptimizeForTextSearch = true;
        }
        field(4; County; Text[30])
        {
            Caption = 'County retrieved by Service';
            OptimizeForTextSearch = true;

            // this is how you define field validation on the table level
            trigger OnValidate()
            begin
                ValidateCounty(County);
            end;

        }
        field(5; IsValidated; Boolean)
        {
            Caption = 'Address validated yet?';
            InitValue = false; // this is how you define default values 
        }
    }

    keys
    {
        key(PrimaryKey; Address)
        {
            Clustered = true;
        }
    }

    procedure ValidateCounty(CountyValue: Text[30])
    begin
        // Add your county validation logic here
    end;
}