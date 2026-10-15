# This Script is used for Labels DLP on Purview

$labels = Get-Label


foreach ($label in $labels) {
>>     Write-Host "Label original: $($label.DisplayName)" -ForegroundColor Cyan
>>     if ($label.LocaleSettings) {
>>         # Converter cada bloco JSON em objeto
>>         foreach ($jsonString in $label.LocaleSettings) {
>>             $parsed = $null
>>             try {
>>                 $parsed = $jsonString | ConvertFrom-Json
>>             } catch {
>>                 Write-Host "  ⚠️ Error" -ForegroundColor Red
>>                 continue
>>             }
>>
>>             $keyType = $parsed.LocaleKey
>>             foreach ($setting in $parsed.Settings) {
>>                 Write-Host "  [$($setting.Key)] $keyType : $($setting.Value)"
>>             }
>>         }
>>     } else {
>>         Write-Host "  - Nothing found (LocaleSettings null)." -ForegroundColor Yellow
>>     }
>>
>>     Write-Host ""
>> }
