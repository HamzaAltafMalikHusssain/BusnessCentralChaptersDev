page 50113 "Television Show Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TelevisionShow;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Synopsis"; Rec.Synopsis)
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Release Date"; Rec.ReleaseDate)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MyAction)
            {
                ApplicationArea = All;
                Caption = 'Change Status';
                trigger OnAction()
                begin
                    if rec.Status = rec.Status::Active then
                        rec.Status := rec.Status::Finished
                    else
                        rec.Status := rec.Status::Active;
                    rec.Modify(true);

                end;

            }
        }
    }

    trigger OnAfterGetRecord()
    var
        UserRec: Record User;
        CreatedByName: Text;
        ModifiedByName: Text;
    begin
        // Resolve Created By user
        if UserRec.Get(Rec.SystemCreatedBy) then
            CreatedByName := UserRec."User Name"
        else
            CreatedByName := Format(Rec.SystemCreatedBy);

        // Resolve Modified By user
        if UserRec.Get(Rec.SystemModifiedBy) then
            ModifiedByName := UserRec."User Name"
        else
            ModifiedByName := Format(Rec.SystemModifiedBy);

        Message(
            'System Information:\' +
            'SystemId: %1\' +
            'Created At: %2\' +
            'Created By: %3\' +
            'Modified At: %4\' +
            'Modified By: %5',
            Rec.SystemId,
            Rec.SystemCreatedAt,
            CreatedByName,
            Rec.SystemModifiedAt,
            ModifiedByName
        );
    end;

}
