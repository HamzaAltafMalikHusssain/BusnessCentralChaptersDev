pageextension 60007 "Purchases & Payables Setup Ext" extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(General)
        {
            field("PO Via Project"; Rec."PO Via Project")
            {
                ApplicationArea = All;
                ToolTip = 'Indicates whether to use project when creating purchase order. The posting impact will be accordingly and the PO cost cannot increase the allowed on Project';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}