$content = Get-Content .\2021_day_5_input.txt

$xObject = @()
$yObject = @()
$content | ForEach-Object {
    $object = $_.Replace(" ","").split("->")
    $object = $object | Where-Object {($_)}
    $x1 = $object[0].Split(",")[0]
    $y1 = $object[0].Split(",")[1]
    $x2 = $object[1].Split(",")[0]
    $y2 = $object[1].Split(",")[1]
    $yObject += $y1
    $yObject += $y2
    $xObject += $x1
    $xObject += $x2
}

$grid = New-object 'object[,]' (($xObject | Measure-Object -Maximum).Maximum + 1),(($yObject | Measure-Object -Maximum).Maximum + 1)
$content | ForEach-Object {
    $object = $_.Replace(" ","").split("->")
    $object = $object | Where-Object {($_)}
    $x1 = $object[0].Split(",")[0]
    $y1 = $object[0].Split(",")[1]
    $x2 = $object[1].Split(",")[0]
    $y2 = $object[1].Split(",")[1]
    if($x1 -eq $x2){
        $y1..$y2 | ForEach-Object {
            if(!$grid[$x1,$_]){
                $grid[$x1,$_] = 0
            }
            $grid[$x1,$_]++
        }
    }
    if($y1 -eq $y2){
        $x1..$x2 | ForEach-Object {
            if(!$grid[$_,$y1]){
                $grid[$_,$y1] = 0
            }
            $grid[$_,$y1]++
        }
    }
}

Write-Host "Correct answer: $(($grid | Where-Object {($_ -ge 2)}).Count)"