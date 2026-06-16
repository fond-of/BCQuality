// Best practice: assign the narrowest visibility that satisfies actual callers.

codeunit 50100 "Order Processor"
{
    // Called only from within this codeunit → local
    local procedure ValidateLineAmounts(SalesLine: Record "Sales Line"): Boolean
    begin
        exit(SalesLine.Amount > 0);
    end;

    // Called from other codeunits inside the same app → internal
    internal procedure ReserveStock(ItemNo: Code[20]; Quantity: Decimal)
    begin
        // reservation logic
    end;

    // Called from a dependent / consuming app → no modifier (implicit public)
    procedure PostOrder(SalesHeader: Record "Sales Header")
    begin
        if not ValidateLineAmounts(SalesHeader) then
            Error('Invalid line amounts.');
        ReserveStock(SalesHeader."No.", 1);
        // post logic
    end;
}
