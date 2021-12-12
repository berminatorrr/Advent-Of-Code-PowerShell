$content = Get-Content .\2021_day_6_input.txt
$fish = $content.split(",")
$fishAmount = $fish.count
$day = 0
$totalDays = 256

[System.Collections.ArrayList]$fish = foreach($number in $fish) {
    try {
        [int]::parse($number)
    }catch{
        Invoke-Expression -Command $number;
    }
}

[hashtable]$f = @{} 
$f["0"] = ($fish | Where-Object {($_ -eq 0)}).count
$f["1"] = ($fish | Where-Object {($_ -eq 1)}).count
$f["2"] = ($fish | Where-Object {($_ -eq 2)}).count
$f["3"] = ($fish | Where-Object {($_ -eq 3)}).count
$f["4"] = ($fish | Where-Object {($_ -eq 4)}).count
$f["5"] = ($fish | Where-Object {($_ -eq 5)}).count
$f["6"] = ($fish | Where-Object {($_ -eq 6)}).count
$f["7"] = ($fish | Where-Object {($_ -eq 7)}).count
$f["8"] = ($fish | Where-Object {($_ -eq 8)}).count

$totalDays = 256
for($i=0;$i -ne $totalDays;$i++){
    $days0s = $f["0"]
    $f["0"] = $f["1"]
    $f["1"] = $f["2"]
    $f["2"] = $f["3"]
    $f["3"] = $f["4"]
    $f["4"] = $f["5"]
    $f["5"] = $f["6"]
    $f["6"] = $f["7"]
    $f["7"] = $f["8"]
    $f["6"] = $f["6"] + $days0s
    $f["8"] = $days0s
}

$answer = $f["0"] + $f["1"] + $f["2"] + $f["3"] + $f["4"] + $f["5"] + $f["6"] + $f["7"] + $f["8"]

$answer