namespace Udvikling.Udvikling;

using Microsoft.Sales.Customer;

pageextension 50000 Pag21Ext extends "Customer Card"
{
    layout
    {
        Addlast(Invoicing)
        {
            field("Webkunde"; Rec.Webkunde)
            {
                Caption = 'Webkunde';
                 ApplicationArea = All;
            }
            field("Customer cateogri"; Rec."Customer cateogri")
            {
                Caption = 'Customer cateogri';
                 ApplicationArea = All;
            }
            field("Creation date"; Rec."Creation date")
            {
                Caption = 'Creation date';
                 ApplicationArea = All;
            }

            field("Web Username"; Rec."Web Username")
            {
                Caption = 'Web Username';
                 ApplicationArea = All;

            }

            field("Web E-mail"; Rec."Web E-mail")
            {
                Caption = 'Web E-mail';
                 ApplicationArea = All;

            }

        }

    }
}
