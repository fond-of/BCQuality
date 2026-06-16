// Anti-pattern: hardcoded text constants as identifier arguments
// The values are invisibly coupled to the production codeunit.
// If any code or key changes, the test data silently breaks.

codeunit 99000 "Bad TestData Setup"
{
    procedure InsertShippingData()
    begin
        InsertShippingAgentServices('DHL', 'STANDARD', 'Standardzustellung', 'STANDARD');
    end;
}
