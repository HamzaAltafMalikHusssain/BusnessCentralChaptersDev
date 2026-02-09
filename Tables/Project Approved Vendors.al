table 60008 "Project Approved Vendors"
{
    DataClassification = ToBeClassified;
    Extensible = true;

    fields
    {
        field(1; "Project No."; Code[20])
        {
            TableRelation = Project."Project No.";
        }
        field(2; "Approved project vendor"; Code[20])
        {
            Caption = 'Approved Project Vendor';
            TableRelation = Vendor."No.";

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
        field(3; "Vendor Name"; Text[100])
        {
            Editable = false;
        }
        field(4; "Approved date"; Date)
        {
            Caption = 'Approved Date';
        }
    }

    keys
    {
        key(PK; "Project No.", "Approved project vendor")
        {
            Clustered = true;
        }
    }
}
