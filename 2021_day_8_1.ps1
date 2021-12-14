$content = Get-Content .\2021_day_8_input.txt
$1 = 0
$4 = 0
$7 = 0
$8 = 0

$content | ForEach-Object {
    $inValue = $_.split("|")[0]
    $outValue = $_.split("|")[1]
    $inValue = $inValue.Split(" ") | Where-Object {($_)}
    $outValue = $outValue.Split(" ") | Where-Object {($_)}
    $outValue | ForEach-Object {
        switch($_.length){
            2 {$1++}
            3 {$7++}
            4 {$4++}
            7 {$8++}
        }
    }
}

Write-Host "Answer: $($1 + $4 + $7 + $8)"