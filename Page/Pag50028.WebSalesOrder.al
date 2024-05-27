page 50028 WebSalesOrder
{
    ApplicationArea = All;
    Caption = 'WebSalesOrder';
    PageType = Document;
    SourceTable = "Sales Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                    //Peterpeterpeter
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the estimate.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer associated with the sales return.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies when the sales invoice was created.';
                }
                field(Weborder; Rec.Weborder)
                {
                    ToolTip = 'Specifies the value of the Weborder field.';
                }
                field(WeborderID; Rec.WeborderID)
                {
                    ToolTip = 'Specifies the value of the WeborderID field.';
                }
                field(WebReference; Rec.WebReference)
                {
                    trigger OnValidate()

                    BEGIN
                        Rec."Your Reference" := COPYSTR(Rec.WebReference, 1, 35);

                    END;

                }

            }
            field("Shipment Date"; Rec."Shipment Date")
            {
                ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
            }
            part(Lines; WebSalesLine)
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = true;
                SubPageLink = "Document No." = FIELD("No."), "Document Type" = field("Document Type");


            }
        }
    }

}