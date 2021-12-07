$content = Get-Content "C:\Temp\aoc_day1.txt"
$floor = 0
$content.ToCharArray() | Foreach-Object {
    switch($_){
        "(" {$floor++}
        ")" {$floor--}
    }
}
$floor