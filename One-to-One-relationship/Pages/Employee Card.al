page 50150 "Employees Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Employees;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }

            group(Profile)
            {
                field("CNIC No."; EmpProfile."CNIC No.")
                {
                    ApplicationArea = All;
                }
                field("Blood Group"; EmpProfile."Blood Group")
                {
                    ApplicationArea = All;
                }
                field("Date of Birth"; EmpProfile."Date of Birth")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        // adEmployeeProfile();
    end;

    var
        EmpProfile: Record "Employee Profile";

    local procedure LoadEmployeeProfile()
    begin
        // Only load profile if Employee exists
        if Rec."Employee No." = '' then
            exit;

        if not EmpProfile.Get(Rec."Employee No.") then begin
            EmpProfile.Init();
            EmpProfile."Employee No." := Rec."Employee No.";
            EmpProfile.Insert(true);
        end;
    end;
}
