page 50111 "Address List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Address;
    CardPageId = "Address Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field(Locality; Rec.Locality)
                {
                    ApplicationArea = All;
                }
                field("Town/City"; Rec."Town/City")
                {
                    ApplicationArea = All;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                }
                field(IsValidated; Rec.IsValidated)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
