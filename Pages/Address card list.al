// <summary>
// The <c>Address List</c> page shows a list of addresses.  It is used as part of the address management feature in Business Central, and is linked to the <c>Address Card</c> page which shows details of a single address.
// </summary>
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
