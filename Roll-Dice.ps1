<#

.SYNOPSIS
Roll-Dice [ options ] [ dice_string ]

.DESCRIPTION
Roll-Dice rolls virtual dice. The dice string passed on the command line contain information on the dice to
roll in a format comparable to the formate used in most role playing games.

If no dice strings are provided as command line arguments, Roll-Dice uses 1d20 instead.

.EXAMPLE
./Roll-Dice.ps1 2d20+4

.EXAMPLE
./Roll-Dice.ps1 4d6-3

.LINK
https://github.com/doug-wade/Roll-Dice

#>

if ($args.Length -gt 0)
{
    $argument_array = $args[0].split("d")
    $number_of_dice = $argument_array[0]
    $dice_type_with_modifier = $argument_array[1]

    $modifier
    $dice_type
    if ($dice_type_with_modifier -Match "-")
    {
        $split_number_of_dice_arg = $dice_type_with_modifier.split("-")
        $dice_type = $split_number_of_dice_arg[0]
        $modifier = -1 * $split_number_of_dice_arg[1]
    }
    elseif ($dice_type_with_modifier -Match "\+")
    {
        $split_number_of_dice_arg = $dice_type_with_modifier.split("+")
        $dice_type = $split_number_of_dice_arg[0]
        $modifier = 1 * $split_number_of_dice_arg[1] # Coerce to int?
    }
    else
    {
        $dice_type = $dice_type_with_modifier
        $modifier = 0
    }

    $total
    for ($i = 0; $i -lt $number_of_dice; $i++)
    {
        $dice_roll = Get-Random -Minimum 1 -Maximum (1 + $dice_type)
        $total += $dice_roll
    }

    $total += $modifier

    Write-Output $total
}
else
{
    $rand = Get-Random -Minimum 1 -Maximum 21
    Write-Output "default case"
    Write-Output $rand
}