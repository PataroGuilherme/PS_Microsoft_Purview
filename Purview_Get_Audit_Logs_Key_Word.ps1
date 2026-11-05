# Parameters
$Keyword = "KEY_WORD"

# Date range (Yesterday to Today)
$StartDate = (Get-Date).Date.AddDays(-1)
$EndDate   = (Get-Date)

# Connect to Exchange Online
Connect-ExchangeOnline

# Search Unified Audit Log
$AuditLogs = Search-UnifiedAuditLog `
    -StartDate $StartDate `
    -EndDate $EndDate `
    -FreeText $Keyword `
    -ResultSize 5000

# Display results
$AuditLogs | Format-Table CreationDate, UserIds, Operations, AuditData -AutoSize

# Export results
$AuditLogs | Export-Csv ".\Purview_Audit_Report.csv" -NoTypeInformation -Encoding UTF8

# Disconnect
Disconnect-ExchangeOnline -Confirm:$false