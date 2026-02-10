pageextension 60006 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        // Add to the existing Number Series group
        addlast("Number Series")
        {
            field("Project Nos."; Rec."Project Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number series code for Project records.';
            }
        }
    }
}