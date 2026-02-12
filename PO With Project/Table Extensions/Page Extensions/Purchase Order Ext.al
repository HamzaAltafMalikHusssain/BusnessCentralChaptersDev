pageextension 60005 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            group(ProjectGroup)
            {
                Visible = ProjectVisible;
                ShowCaption = false;

                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the project related to this purchase order.';
                }
            }
        }

        modify("Buy-from Vendor Name")
        {
            trigger OnLookup(var SelectedVendorName: Text): Boolean
            var
                Vendor: Record Vendor;
                VendorList: Page "Vendor List";
                VendorFilter: Text;
                IsFeatureEnabled: Boolean;
                OriginalVendorNo: Code[20];
            begin
                IsFeatureEnabled := false;

                if PurchPaySetup.Get() then
                    IsFeatureEnabled := PurchPaySetup."PO Via Project";

                // Only handle when feature is enabled AND project is selected
                if IsFeatureEnabled and (Rec."Project No." <> '') then begin
                    VendorFilter := GetApprovedVendorsFilter(Rec."Project No.");

                    if VendorFilter = '' then
                        Error('No approved vendors defined for Project %1.', Rec."Project No.");

                    Vendor.Reset();
                    Vendor.SetFilter("No.", VendorFilter);
                    Vendor.SetFilter("Date Filter", Rec.GetFilter("Date Filter"));

                    VendorList.SetTableView(Vendor);
                    VendorList.LookupMode(true);

                    if VendorList.RunModal() = Action::LookupOK then begin
                        VendorList.GetRecord(Vendor);
                        Rec.Validate("Buy-from Vendor No.", Vendor."No.");
                        SelectedVendorName := Vendor.Name;
                        CurrPage.Update();
                        exit(true);
                    end;
                    exit(false);
                end;

                // For all other cases, replicate the OOB lookup functionality
                Vendor.Reset();
                Vendor.SetFilter("Date Filter", Rec.GetFilter("Date Filter"));

                // Store original vendor number to check if it changed
                OriginalVendorNo := Rec."Buy-from Vendor No.";

                if Vendor.SelectVendor(Vendor) then begin
                    if Rec."Buy-from Vendor No." <> Vendor."No." then begin
                        Rec.Validate("Buy-from Vendor No.", Vendor."No.");
                        SelectedVendorName := Vendor.Name;
                        CurrPage.Update();
                    end else begin
                        SelectedVendorName := Vendor.Name;
                    end;
                    exit(true);
                end;

                exit(false);
            end;
        }
    }

    trigger OnOpenPage()
    begin
        InitializeVisibility();
    end;

    var
        ProjectVisible: Boolean;
        PurchPaySetup: Record "Purchases & Payables Setup";
        ApprovedVendor: Record "Project Approved Vendors";

    local procedure InitializeVisibility()
    begin
        if PurchPaySetup.Get() then
            ProjectVisible := PurchPaySetup."PO Via Project"
        else
            ProjectVisible := false;
    end;

    local procedure GetApprovedVendorsFilter(ProjectNo: Code[20]): Text
    var
        VendorFilter: Text;
    begin
        ApprovedVendor.Reset();
        ApprovedVendor.SetRange("Project No.", ProjectNo);

        if ApprovedVendor.FindSet() then
            repeat
                if VendorFilter = '' then
                    VendorFilter := ApprovedVendor."Approved project vendor"
                else
                    VendorFilter += '|' + ApprovedVendor."Approved project vendor";
            until ApprovedVendor.Next() = 0;

        exit(VendorFilter);
    end;
}