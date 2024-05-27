codeunit 50000 "MON Multi"
{
    PROCEDURE CreateSlesHeaderFromCustomer(Parm_Cust: Record Customer; Parm_DocumentType: Enum DocumentType);
    VAR
        Loc_SH: Record "Sales Header";
    BEGIN
        IF Parm_Cust.Blocked <> Parm_Cust.Blocked::" " THEN
            ERROR('Customer no. %1 is blocked!', Parm_Cust."No.");

        Loc_SH."Document Type" := Parm_DocumentType;
        Loc_SH.INSERT(TRUE);
        Loc_SH.VALIDATE(Loc_SH."Sell-to Customer No.", Parm_Cust."No.");
        Loc_SH.MODIFY;

        CASE Loc_SH."Document Type" OF
            Loc_SH."Document Type"::Quote:
                PAGE.RUN(41, Loc_SH);
            Loc_SH."Document Type"::Order:
                PAGE.RUN(42, Loc_SH);
            Loc_SH."Document Type"::Invoice:
                PAGE.RUN(43, Loc_SH);
            Loc_SH."Document Type"::"Credit Memo":
                PAGE.RUN(44, Loc_SH);
            Loc_SH."Document Type"::"Blanket Order":
                PAGE.RUN(507, Loc_SH);
            Loc_SH."Document Type"::"Return Order":
                PAGE.RUN(6630, Loc_SH);
        END;
    END;



    VAR
        //Text001@1000000000 : TextConst 'DAN=Varenr. %1 findes ikke!;ENU=Item no. %1 does not exist!';
        SalesLineTestRec: Record "Sales Line";
        NewentryNo: Integer;
        LotNoFundet: Boolean;
        Glob_ItemTrackingLine: Record "Reservation Entry";
    //Text002@1000000005 : TextConst 'DAN=Debitornr. %1 er sp‘rret!;ENU=Customer no. %1 is blocked!';

    PROCEDURE InsertSLExtText(SalesLine: Record "Sales Line");
    VAR
        SalesHeader: Record "Sales Header";
        Item: Record Item;
        AttachedLines: Record "Sales Line";
    BEGIN
        IF SalesHeader.GET(SalesLine."Document Type", SalesLine."Document No.") THEN BEGIN
            IF SalesHeader.Weborder THEN BEGIN
                IF Item.GET(SalesLine."No.") THEN BEGIN
                    //Tjekker om der er indsat udv. tekst
                    IF Item."Automatic Ext. Texts" THEN BEGIN
                        AttachedLines.SETRANGE("Document Type", SalesLine."Document Type");
                        AttachedLines.SETRANGE("Document No.", SalesLine."Document No.");
                        AttachedLines.SETRANGE("Attached to Line No.", SalesLine."Line No.");
                        IF NOT AttachedLines.FIND('-') THEN BEGIN
                            //Inds‘t udv. tekst
                            InsertSalesExtTextWeb(SalesLine, SalesHeader);
                        END;
                    END;
                END;
            END;
        END;
    END;



    LOCAL PROCEDURE InsertSalesExtTextWeb(SL: Record "Sales Line"; SH: Record "Sales Header");
    VAR
        AutoText: Boolean;
        Item: Record Item;
        ExtTextHeader: Record "Extended Text Header";
        TmpExtTextLine: Record "Extended Text Line" temporary;
        ExtTextLine: Record "Extended Text Line";
        ToSalesLine: Record "Sales Line";
        NextLineNo: Integer;
        LineCounter: Integer;
    BEGIN
        AutoText := FALSE;

        IF SL.Type = SL.Type::Item THEN BEGIN
            IF Item.GET(SL."No.") THEN
                AutoText := Item."Automatic Ext. Texts";
        END;

        IF AutoText THEN BEGIN
            SL.TESTFIELD("Document No.");
            ExtTextHeader.SETRANGE("Table Name", SL.Type);
            ExtTextHeader.SETRANGE("No.", SL."No.");
            ExtTextHeader.SETRANGE("Sales Order", TRUE);

            ExtTextHeader.SETCURRENTKEY(
              "Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
            ExtTextHeader.SETRANGE("Starting Date", 0D, SH."Document Date");
            ExtTextHeader.SETFILTER("Ending Date", '%1..|%2', SH."Document Date", 0D);
            IF SH."Language Code" = '' THEN BEGIN
                ExtTextHeader.SETRANGE("Language Code", '');
                IF NOT ExtTextHeader.FIND('+') THEN
                    //EXIT;
                    AutoText := FALSE;
            END ELSE BEGIN
                ExtTextHeader.SETRANGE("Language Code", SH."Language Code");
                IF NOT ExtTextHeader.FIND('+') THEN BEGIN
                    ExtTextHeader.SETRANGE("All Language Codes", TRUE);
                    ExtTextHeader.SETRANGE("Language Code", '');
                    IF NOT ExtTextHeader.FIND('+') THEN
                        //EXIT;
                        AutoText := FALSE;
                END;
            END;
        END;

        IF AutoText THEN BEGIN
            ExtTextLine.SETRANGE("Table Name", ExtTextHeader."Table Name");
            ExtTextLine.SETRANGE("No.", ExtTextHeader."No.");
            ExtTextLine.SETRANGE("Language Code", ExtTextHeader."Language Code");
            ExtTextLine.SETRANGE("Text No.", ExtTextHeader."Text No.");
            IF ExtTextLine.FIND('-') THEN BEGIN
                TmpExtTextLine.DELETEALL;
                REPEAT
                    TmpExtTextLine := ExtTextLine;
                    TmpExtTextLine.INSERT;
                UNTIL ExtTextLine.NEXT = 0;
            END;

            NextLineNo := SL."Line No." + 10;

            TmpExtTextLine.RESET;
            IF TmpExtTextLine.FIND('-') THEN BEGIN
                REPEAT
                    ToSalesLine.INIT;
                    ToSalesLine."Document Type" := SL."Document Type";
                    ToSalesLine."Document No." := SL."Document No.";
                    ToSalesLine."Line No." := NextLineNo;
                    NextLineNo := NextLineNo + 10;
                    ToSalesLine.Description := TmpExtTextLine.Text;
                    ToSalesLine."Attached to Line No." := SL."Line No.";
                    ToSalesLine.INSERT;
                UNTIL TmpExtTextLine.NEXT = 0;
            END;
            TmpExtTextLine.DELETEALL;

            LineCounter := LineCounter + 10000;
        END;
    END;

}
