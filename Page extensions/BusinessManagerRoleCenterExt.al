pageextension 60023 BusinessManagerRoleCenterExt extends "Business Manager Role Center"
{
    actions
    {
        addlast(sections)
        {
            group(FinancialProjectManagement)
            {
                Caption = 'Financial Project Management';
                action(TelevisionShowList)
                {
                    ApplicationArea = All;
                    Caption = 'Television Show List';
                    RunObject = Page 50114;
                }
                action(ProjectList)
                {
                    ApplicationArea = All;
                    Caption = 'Project List';
                    RunObject = Page 60010;
                }
                action(ProjectCostingList)
                {
                    ApplicationArea = All;
                    Caption = 'Project Costing List';
                    RunObject = Page 60020;
                }
                action(AddressList)
                {
                    ApplicationArea = All;
                    Caption = 'Address List';
                    RunObject = Page 50111;
                }
            }
        }
    }
}