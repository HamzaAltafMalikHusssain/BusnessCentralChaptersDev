// Table 60100 - Project Cue Table
table 60100 "Project Cue Table"
{
    DataClassification = CustomerContent;
    Caption = 'Project Cue Table';

    fields
    {
        // Primary Key (required for FlowField tables)
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        // Cue 1: Total Projects Count
        field(2; "Total Projects"; Integer)
        {
            Caption = 'Total Projects';
            FieldClass = FlowField;
            CalcFormula = count(Project);
        }

        // Cue 2: Total Costings Count
        field(3; "Total Costings"; Integer)
        {
            Caption = 'Total Costings';
            FieldClass = FlowField;
            CalcFormula = count("Project Costing");
        }

        // Cue 3: Total Allowed Amount (from Project table)
        field(4; "Total Allowed Amount"; Decimal)
        {
            Caption = 'Total Allowed Amount';
            FieldClass = FlowField;
            CalcFormula = sum(Project."Allowed costing amount");
        }

        // Cue 4: Total Consumed Amount (from Costing Lines)
        field(5; "Total Consumed Amount"; Decimal)
        {
            Caption = 'Total Consumed Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Project Costing Lines"."Cost Amount");
        }

        // Option 1: Calculate Available Amount in the Page (Recommended)
        // Option 2: Make it a FlowField from a query (if you create a query)
        // For now, let's keep it simple and calculate in the page
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    // Valid triggers for Tables are:
    // OnInsert, OnModify, OnDelete, OnRename
    // OnAfterInsert, OnAfterModify, OnAfterDelete, OnAfterRename
    // OnBeforeInsert, OnBeforeModify, OnBeforeDelete, OnBeforeRename

    trigger OnInsert()
    begin
        // Set a default primary key value
        if "Primary Key" = '' then
            "Primary Key" := 'MAIN';
    end;
}