tableextension 60005 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(60000; "Project Nos."; Code[20])
        {
            Caption = 'Project Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }
}