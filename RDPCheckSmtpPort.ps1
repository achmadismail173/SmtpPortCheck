param (
    [string]$hostname = "smtp.gmail.com",
    [int[]]$ports = @(25, 465, 587)
)

foreach ($port in $ports) {
    $result = Test-NetConnection $hostname -Port $port -WarningAction SilentlyContinue
    [PSCustomObject]@{
        Hostname       = $hostname
        Port           = $port
        TcpTestSucceeded = $result.TcpTestSucceeded
        Status         = if ($result.TcpTestSucceeded) { "Open" } else { "Closed or Blocked" }
    }
}
