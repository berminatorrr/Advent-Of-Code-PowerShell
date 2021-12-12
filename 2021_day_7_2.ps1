$content = Get-Content .\2021_day_7_input.txt
$crabs = $content.Split(",")
[array]$crabs = foreach($number in $crabs) {
    try {
        [int]::parse($number)
    }catch{
        Invoke-Expression -Command $number;
    }
}
$measure = $crabs | Measure-Object -Minimum -Maximum -Average
$lowest = $measure.Minimum
$highest = $measure.Maximum
$answers = @()
$lowestfuel = 0
for($i = 0;$i -ne $highest;$i++){
    $i
    $fuel = 0
    $position = $i
    foreach($crab in $crabs){
        if($crab -lt $i){
            $fuel = $fuel + ((1 + $i - $crab) / 2) * ($i - $crab)
        }elseif($crab -gt $i){
            $fuel = $fuel + ((1 + $crab - $i) / 2) * ($crab - $i)
        }
    }
    if($fuel -lt $lowestfuel){
        $lowestfuel = $fuel
    }elseif($lowestfuel -eq 0){
        $lowestfuel = $fuel
    }
}
$lowestfuel