// Best practice: use getter methods for every identifier argument.
// The getter is the single source of truth; renaming the value in production
// automatically propagates to all TestData call sites.

codeunit 99001 "Good TestData Setup"
{
    var
        RecurringLabelHelper: Codeunit "Recurring Label Helper";

    procedure InsertShippingData()
    begin
        InsertShippingAgentServices(
            RecurringLabelHelper.GetShippingAgentDHLCode(),
            RecurringLabelHelper.GetShippingAgentServiceDHLStandardCode(),
            'Standardzustellung',
            RecurringLabelHelper.GetEULOCOMappingDhlStdCode());
    end;
}
