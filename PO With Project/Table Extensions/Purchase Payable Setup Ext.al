tableextension 60006 "Purchase Payable Setup Ext" extends "Purchases & Payables Setup"
{
    fields
    {
        field(235; "PO Via Project"; Boolean)
        {
            Caption = 'Purchase Order Via Project';
            ToolTip = 'Indicates whether to use project when creating purchase order. The posting impact will be accordingly and the PO cost cannot increase the allowed on Project';

        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}