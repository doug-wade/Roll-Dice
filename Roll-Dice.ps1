if ($args.Length -gt 0)
{
    $argument_array = $args[0].split("d")
    $number_of_dice = $argument_array[0]
    $dice_type = $argument_array[1]
    
    $total
    for ($i = 0; $i -lt $number_of_dice; $i++)
    {
        $total += Get-Random -Minimum 1 -Maximum $dice_type
    }

    Write-Output $total
}
else
{
    $rand = Get-Random -Minimum 1 -Maximum 21
    Write-Output "default case"
    Write-Output $rand
}