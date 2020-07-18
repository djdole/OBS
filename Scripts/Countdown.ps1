param(
	[string] $Seconds=300,
	[string] $File="./Countdown.txt",
	[string] $Prepend="",
	[string] $Append="",
	[string] $Format="{0:m:ss}"
)

$T_Minus = $Seconds
while ($T_Minus -ge 0)
{
  $ts =  [timespan]::fromseconds($T_Minus)
  $tm = ($Format -f ([datetime]$ts.Ticks))
  $Line = $Prepend + $tm + $Append
  Out-File -FilePath "$File" -InputObject "$Line" -Encoding ASCII
  start-sleep 1
  $T_Minus -= 1
}