if ($args.Length -gt 0)
{
    $argument_array = $args[0].split("d")
    $number_of_dice = $argument_array[0]
    $dice_type = $argument_array[1]
    Write-Output "Rolling $($number_of_dice)d$($dice_type)"
}
else
{
    $rand = Get-Random -Minimum 1 -Maximum 21
    Write-Output "default case"
    Write-Output $rand
}