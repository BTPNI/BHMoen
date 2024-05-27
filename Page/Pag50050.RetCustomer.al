namespace Udvikling.Udvikling;

using Microsoft.Sales.Customer;

page 50050 RetCustomer
{
    ApplicationArea = All;
    Caption = 'RetCustomer';
    PageType = List;
    SourceTable = Customer;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                }
                field("Web E-mail"; Rec."Web E-mail")
                {
                    caption = 'Web_email';
                }

                field("Web Username"; Rec."Web Username")
                {
                    ToolTip = 'Specifies the value of the Web Username field.', Comment = '%';
                    caption = 'Web_Username';
                }
                field(Webkunde; Rec.Webkunde)
                {
                    ToolTip = 'Specifies the value of the Webkunde field.', Comment = '%';
                }
            }
        }
    }
}
