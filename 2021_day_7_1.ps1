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
for($i = 0;$i -ne $highest;$i++){
    $fuel = 0
    $position = $i
    foreach($crab in $crabs){
        if($crab -lt $i){
            $fuel += ($i - $crab)
        }elseif($crab -gt $i){
            $fuel += ($crab - $i)
        }
    }
    $answers += $fuel
}
$answers | Sort-Object -Descending | Select-Object -Last 1