page 50112 "Address Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Address;

    layout
    {
        area(Content)
        {
            group(General)
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
