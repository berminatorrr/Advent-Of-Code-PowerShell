$content = Get-Content .\2021_day_2_input.txt
$horizontal = 0
$vertical = 0
$aim = 0
0..($content.length -1) | ForEach-Object {
    $move = $content[$_].split(" ")
    switch($move[0]){
        "up" {
            $aim = $aim - $move[-1]
        }
        "down" {
            $aim = $aim + $move[-1]
        }
        "forward" {
            $horizontal = $horizontal + $move[-1]
            $vertical = $vertical + ($aim * $move[-1])
        }
    }
}
$horizontal * $vertical