// Anti pattern: every procedure is implicit public even though only
// ValidateLineAmounts is called from outside the app.
// This exposes internal helpers across the app boundary unnecessarily.

codeunit 50100 "Order Processor"
{
    // Only called from within this codeunit — should be local
    procedure ValidateLineAmounts(SalesLine: Record "Sales Line"): Boolean
    begin
        exit(SalesLine.Amount > 0);
    end;

    // Only called from within the same app — should be internal
    procedure ReserveStock(ItemNo: Code[20]; Quantity: Decimal)
    begin
        // reservation logic
    end;

    // Legitimately public — this one is fine without a modifier
    procedure PostOrder(SalesHeader: Record "Sales Header")
    begin
        if not ValidateLineAmounts(SalesHeader) then
            Error('Invalid line amounts.');
        ReserveStock(SalesHeader."No.", 1);
        // post logic
    end;
}
