$content = Get-Content .\2021_day_9_input.txt
$index = New-Object 'object[,]' ($content[0].Length + 1),($content.Count + 1)
$count = 0
foreach($row in $content){
    for($i = 0;$i -lt ($row.Length);$i++){
        $index[$i,$count] = $row[$i]
    }
    $count++
}


$lowNumbers = @()
[int]$y = 0
foreach($row in $content){
    [int]$x = 0
    foreach($number in ($row.ToCharArray())){
        $surroundingNumbers = @()
        if($index[$x,($y - 1)]){
            $surroundingNumbers += $index[$x,($y - 1)] #up
        }
        if($index[($x - 1),$y]){
            $surroundingNumbers += $index[($x - 1),$y] #left
        }
        if($index[($x + 1),$y]){
            $surroundingNumbers += $index[($x + 1),$y] #right
        }
        if($index[$x,($y + 1)]){
            $surroundingNumbers += $index[$x,($y + 1)] #down
        }
        $noLowNumber = $false
        foreach($n in $surroundingNumbers){
            if([int]$n -le $number){
                $noLowNumber = $true
            }
        }
        if(!$noLowNumber){
            $lowNumbers += $number
        }
        $x++
    }
    $y++
}

[int]$total = 0
foreach($num in $lowNumbers){
    $total += [convert]::ToInt32($num, 10) + 1
}
$total
