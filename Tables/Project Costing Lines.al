table 60007 "Project Costing Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Costing ID"; Code[20])
        {
            TableRelation = "Project Costing"."Costing ID";
        }
        field(2; "Task No."; Integer)
        {
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Cost Type"; Option)
        {
            OptionMembers = Material,Labor,Overhead,Subcontractor,Other;
        }
        field(5; "Cost Amount"; Decimal)
        {
            trigger OnValidate()
            begin
                ValidateTotalCostingAmount();
            end;
        }
        field(6; "Approved project vendor"; Code[20])
        {
            Caption = 'Activity Vendor';

            trigger OnLookup()
            var
                VendorRec: Record Vendor;
                ApprovedVendor: Record "Project Approved Vendors";
                CostingHeader: Record "Project Costing";
                VendorFilter: Text;
            begin
                if not CostingHeader.Get("Costing ID") then
                    exit;

                ApprovedVendor.SetRange("Project No.", CostingHeader."Project No.");
                if not ApprovedVendor.FindSet() then
                    exit;

                repeat
                    if VendorFilter = '' then
                        VendorFilter := ApprovedVendor."Approved project vendor"
                    else
                        VendorFilter += '|' + ApprovedVendor."Approved project vendor";
                until ApprovedVendor.Next() = 0;

                VendorRec.SetFilter("No.", VendorFilter);

                if Page.RunModal(Page::"Vendor List", VendorRec) = Action::LookupOK then
                    Validate("Approved project vendor", VendorRec."No.");
            end;

            trigger OnValidate()
            var
                VendorRec: Record Vendor;
            begin
                if "Approved project vendor" = '' then begin
                    "Vendor Name" := '';
                    exit;
                end;

                if VendorRec.Get("Approved project vendor") then
                    "Vendor Name" := VendorRec.Name;
            end;
        }
        field(7; "Vendor Name"; Text[100])
        {
            Editable = false;
            Caption = 'Vendor Name';
        }
    }

    keys
    {
        key(PK; "Costing ID", "Task No.")
        {
            Clustered = true;
        }
    }

    local procedure ValidateTotalCostingAmount()
    var
        CostingHeader: Record "Project Costing";
        ProjectRec: Record Project;
        CostingLine: Record "Project Costing Lines";
        TotalAmount: Decimal;
    begin
        if not CostingHeader.Get("Costing ID") then
            exit;

        if not ProjectRec.Get(CostingHeader."Project No.") then
            exit;

        CostingLine.SetRange("Costing ID", "Costing ID");
        TotalAmount := 0;

        if CostingLine.FindSet() then
            repeat
                TotalAmount += CostingLine."Cost Amount";
            until CostingLine.Next() = 0;

        if TotalAmount > ProjectRec."Allowed costing amount" then
            Error(
                'Total costing amount (%1) exceeds the allowed amount (%2) for Project %3.',
                TotalAmount,
                ProjectRec."Allowed costing amount",
                ProjectRec."Project No."
            );
    end;
}
