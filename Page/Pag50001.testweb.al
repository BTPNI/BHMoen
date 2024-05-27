page 50001 "test web"
{
    ApplicationArea = All;
    Caption = 'test web';
    PageType = Card;
    SourceTable = "Integer";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Test PDF function")
            {
                trigger OnAction()
                var
                    Webtest: Codeunit WebPdfGenApi;
                    BigTexttest: BigText;
                    BigtextLen: Integer;
                    EmailCU: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    Instr: InStream;
                    outstr: OutStream;
                    tempblob: Codeunit "Temp Blob";
                begin
                    Webtest.ReturnPdf(BigTexttest, '142240', 'Invoice', '34974632');
                    BigtextLen := BigTexttest.Length();
                    EmailMessage.Create('pni@bakertilly.dk', 'Filer til SuperOffice', 'Eksempel på web service som returnerer faktura/cm som PDF');
                    tempblob.CreateOutStream(outstr);

                    BigTexttest.Write(outstr);
                    if tempblob.HasValue() then
                        tempblob.CreateInStream(Instr);

                    EmailMessage.AddAttachment('test.pdf', 'PDF', Instr);
                    EmailCU.send(EmailMessage, Enum::"Email Scenario"::Default);

                end;
            }
        }
    }
}