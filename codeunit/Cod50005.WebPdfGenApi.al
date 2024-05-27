codeunit 50005 WebPdfGenApi
{
    PROCEDURE ReturnPdf(VAR PdfDocument: BigText; InvoiceNumber: Text[20]; DocType: Text[30]; AccountNumber: Code[30]);
    VAR
        SH: Record 112;
        SC: Record 114;
        "Sales Invoice Header": Record 112;
        IStream: InStream;
        "Sales Cr.Memo Header": Record 114;
        SalesInvoiceLine: Record "Sales Invoice Line";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        DocumentAttachment: Record "Document Attachment";
        SalesInvoiceReport: Report "Standard Sales - Invoice";
        ReportParameters: Text;
        PageParameters: Text;
        XmlParameters: Text;
        Stream: OutStream;
        Stream2: OutStream;
        Instr: InStream;
        Ostr: OutStream;
        RFormat: ReportFormat;
        Flag: Boolean;
        tempblob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        Base64String: Text;
        DocInstream: InStream;
    BEGIN
        IF InvoiceNumber = '' THEN
            ERROR('Invoicenumber should be specified');


        IF ("Sales Invoice Header".GET(InvoiceNumber)) AND (DocType = 'Invoice') THEN BEGIN

            IF "Sales Invoice Header"."Sell-to Customer No." <> AccountNumber THEN
                ERROR('Invoicenumber does not belong to specified customer');

            ReportParameters := '<?xml version="1.0" standalone="yes"?><ReportParameters name="Standard Sales - Invoice" id="1306">';
            ReportParameters += '<Options>';
            ReportParameters += '<Field name="LogInteraction">false</Field><Field name="DisplayAssemblyInformation">false</Field>';
            ReportParameters += '<Field name="DisplayShipmentInformation">false</Field>';
            ReportParameters += '<Field name="DisplayAdditionalFeeNote">false</Field>';
            ReportParameters += '</Options>';
            ReportParameters += '<DataItems>';
            ReportParameters += '<DataItem name="Header">VERSION(1) SORTING(Field3) WHERE(Field3=1(' + InvoiceNumber + '))';
            ReportParameters += '</DataItem>';
            ReportParameters += '</DataItems>';
            ReportParameters += '</ReportParameters>';
            RFormat := ReportFormat::Pdf;
            tempblob.CreateOutStream(Stream);
            Flag := Report.SaveAs(1306, ReportParameters, RFormat, Stream);

            if tempblob.HasValue() then begin
                tempblob.CreateInStream(DocInstream);
                Base64String := Base64Convert.ToBase64(DocInstream);
                PdfDocument.AddText(Base64String);


            END;
        END ELSE BEGIN
            IF DocType = 'Invoice' THEN
                ERROR('Not found');
        END;
        IF ("Sales Cr.Memo Header".GET(InvoiceNumber)) AND (DocType = 'Creditmemo') THEN BEGIN

            IF "Sales Cr.Memo Header"."Sell-to Customer No." <> AccountNumber THEN
                ERROR('Invoicenumber does not belong to specified customer');
            ReportParameters := '<?xml version="1.0" standalone="yes"?><ReportParameters name="Standard Sales - Credit Memo" id="1307">';
            ReportParameters += '<Options>';
            ReportParameters += '<Field name="LogInteraction">false</Field><Field name="DisplayAssemblyInformation">false</Field>';
            ReportParameters += '<Field name="DisplayShipmentInformation">false</Field>';
            ReportParameters += '<Field name="DisplayAdditionalFeeNote">false</Field>';
            ReportParameters += '</Options>';
            ReportParameters += '<DataItems>';
            ReportParameters += '<DataItem name="Header">VERSION(1) SORTING(Field3) WHERE(Field3=1(' + InvoiceNumber + '))';
            ReportParameters += '</DataItem>';
            ReportParameters += '</DataItems>';
            ReportParameters += '</ReportParameters>';
            RFormat := ReportFormat::Pdf;
            tempblob.CreateOutStream(Stream);
            Flag := Report.SaveAs(1307, ReportParameters, RFormat, Stream);
            if tempblob.HasValue() then begin
                tempblob.CreateInStream(DocInstream);
                Base64String := Base64Convert.ToBase64(DocInstream);
                PdfDocument.AddText(Base64String);
            End;


        END ELSE BEGIN
            IF DocType = 'Creditmemo' THEN
                ERROR('Not found');
        END;
    END;
}
