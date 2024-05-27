page 50029 WebSalesLine
{
    ApplicationArea = All;
    Caption = 'WebSalesLine';
    PageType = ListPart;
    SourceTable = "Sales line";
    AutoSplitKey = true;
    MultipleNewLines = true;
    DelayedInsert = true;
    SourceTableView = Where("Document Type" = Filter(DocumentType::Order));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the type of document that you are about to create.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the line number.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the record.';
                    trigger OnValidate()
                    var
                        Item: record Item;
                        MONMulti: Codeunit "MON Multi";
                    Begin
                        CurrPage.UPDATE(TRUE);

                        Rec.ReturnInfo := 'Webitem:' + Rec."No." + '-' + FORMAT(Rec."Line No."); //ADDV.ALS
                        IF Rec.Type = Rec.Type::Item THEN BEGIN
                            IF Item.GET(Rec."No.") THEN BEGIN
                                Rec.ReturnInfo := Rec.ReturnInfo + '-X:' + FORMAT(Item."Automatic Ext. Texts");

                                IF (Rec."Line No." <> 0) AND Item."Automatic Ext. Texts" = TRUE THEN
                                    MONMulti.InsertSLExtText(Rec);
                            END;
                        END;
                    END;



                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the quantity of the sales order line.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the price for one unit on the sales line.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }

            }
        }
    }
}
