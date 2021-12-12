$content = Get-Content .\2021_day_6_input.txt
$fish = $content.split(",")
$fishAmount = $fish.count
$day = 0
$totalDays = 256
$show = @(50,60,70,75,76,77,78,79,80)

[System.Collections.ArrayList]$fish = foreach($number in $fish) {
    try {
        [int]::parse($number)
    }catch{
        Invoke-Expression -Command $number;
    }
}

while($day -ne $totalDays){
    0..($fishAmount - 1) | ForEach-Object {
        if($fish[$_] -eq 0){
            $add = $fish.Add(8)
            $fish[$_] = 6
        }else{
            $fish[$_]--
        }
    }
    $fishAmount = $fish.count
    $day++
    if($day -in $show){
        $day
    }
}

$fish.Count