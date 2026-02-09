page 60100 "Project Cost Management RC"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Project Cost Management Accountant';

    actions
    {
        // this section is the navbar
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
        // Embedding shows the area below navbar the sub navigation where the menu Item
        // are added that would open pages or code units 

        area(Embedding)
        {
            action(ProjectListEmbed)
            {
                ApplicationArea = All;
                RunObject = page 60010;
                Caption = 'Projects';
            }

            action(ProjectCostingEmbed)
            {
                ApplicationArea = All;
                RunObject = page 60020;
                Caption = 'Project Costing';
            }
            action(AddressListEmbed)
            {
                ApplicationArea = All;
                RunObject = page 50111;
                Caption = 'Address Book';
            }
            action(TelevisionListEmbed)
            {
                ApplicationArea = All;
                RunObject = page 50114;
                Caption = 'Television Shows';
            }
        }

        area(Processing)
        {
            // group(ProjectActions)
            // {
            //     Caption = 'Project';

            //     action(ProjectListAction)
            //     {
            //         ApplicationArea = All;
            //         RunObject = page 60010;
            //         Caption = 'Project List ACT';
            //     }

            //     action(ProjectCostingAction)
            //     {
            //         ApplicationArea = All;
            //         RunObject = page 60020;
            //         Caption = 'Project Costing ACT';
            //     }
            // }
        }
    }
}
