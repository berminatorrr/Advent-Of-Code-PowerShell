$content = Get-Content .\2021_day_2_input.txt
$horizontal = 0
$vertical = 0
0..($content.length -1) | ForEach-Object {
    $move = $content[$_].split(" ")
    switch($move[0]){
        "up" {
            $vertical = $vertical - $move[-1]
        }
        "down" {
            $vertical = $vertical + $move[-1]
        }
        "forward" {
            $horizontal = $horizontal + $move[-1]
        }
    }
}
$horizontal * $vertical