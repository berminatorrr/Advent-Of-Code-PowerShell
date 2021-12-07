$content = Get-Content "C:\Temp\aoc_day1.txt"
$floor = 0
$count = 0
$content.ToCharArray() | Foreach-Object {
    $count++
    switch($_){
        "(" {$floor++}
        ")" {$floor--}
    }
    if($floor -eq -1){
        $count
    }
}