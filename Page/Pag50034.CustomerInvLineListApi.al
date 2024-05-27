page 50034 CustomerInvLineListApi
{
    APIGroup = 'apiGroup';
    APIPublisher = 'publisherName';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'customerInvLineListApi';
    DelayedInsert = true;
    EntityName = 'CustomerInvLineApi';
    EntitySetName = 'CustomerInvLineApi';
    PageType = API;
    SourceTable = "Sales Invoice Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(unitOfMeasure; Rec."Unit of Measure")
                {
                    Caption = 'Unit of Measure';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                {
                    Caption = 'Line Discount Amount';
                }
                field(lineAmount; Rec."Line Amount")
                {
                    Caption = 'Line Amount';
                }

                field(Currency; SalesInvoiceHeader."Currency Code")
                {

                }
                field(WeborderID; SalesInvoiceHeader.WeborderID)
                {

                }

                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    Begin
        CLEAR(SalesInvoiceHeader);
        IF SalesInvoiceHeader.GET(Rec."Document No.") THEN;

    End;

    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
}
