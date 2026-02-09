page 60100 "Project Cost Management RC"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Project Cost Management Accountant';

    actions
    {
        area(Sections)
        {
            group(ProjectNav)
            {
                Caption = 'Project';

                action(ProjectListNav)
                {
                    ApplicationArea = All;
                    RunObject = page 60010;
                    Caption = 'Project List';
                }

                action(ProjectCostingNav)
                {
                    ApplicationArea = All;
                    RunObject = page 60020;
                    Caption = 'Project Costing';
                }

                action(AddressListNav)
                {
                    ApplicationArea = All;
                    RunObject = page 50111;
                    Caption = 'Address Book';
                }
            }
        }

        area(Embedding)
        {
            action(ProjectListEmbed)
            {
                ApplicationArea = All;
                RunObject = page 60010;
                Caption = 'Project List EMB';
            }

            action(ProjectCostingEmbed)
            {
                ApplicationArea = All;
                RunObject = page 60020;
                Caption = 'Project Costing EMB';
            }
        }

        area(Processing)
        {
            group(ProjectActions)
            {
                Caption = 'Project';

                action(ProjectListAction)
                {
                    ApplicationArea = All;
                    RunObject = page 60010;
                    Caption = 'Project List ACT';
                }

                action(ProjectCostingAction)
                {
                    ApplicationArea = All;
                    RunObject = page 60020;
                    Caption = 'Project Costing ACT';
                }
            }
        }
    }
}
