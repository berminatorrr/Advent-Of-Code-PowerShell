$content = Get-Content .\2021_day_4_input.txt
$numbers = $content[0].Split(",")
$boards = $content | Where-Object {($_ -and $_ -ne $content[0])}
$boardsAmount = $boards.count / 5
$skipRow = 0
$takeRow = 5
$bingoWon = $false
$skip = 0
$take = 5
$numbersDrawn = 0
$boardsWon = @()
do{
    1..$boardsAmount | ForEach-Object {
        $skipRow = ($_ * 5) - 5
        $takeRow = ($_ * 5)
        $board = $_
        0..4 | ForEach-Object {
            $index = $_
            $verticalBingo = 0
            $skipRow..($takeRow - 1) | ForEach-Object {
                $row = $_
                $nr = ($boards[$row].split(" ") | Where-Object {($_)})[$index]
                if($nr -in $numbers[$skip..($take - 1)]){
                    $verticalBingo++
                }
            }
            if($verticalBingo -eq 5 -and $board -notin $boardsWon){
                $numbersDrawn = $numbers[$skip..($take - 1)]
                Write-Host "Vertical bingo at column $index which is board $board"
                Write-Host "$($numbersDrawn.count) numbers drawn: $numbersDrawn"
                $bingoWon = $true
                $boardsWon += $board
                $lastBoard = $board
            }
        }
        $skipRow..($takeRow - 1) | ForEach-Object {
            $row = $_
            $horizontalBingo = 0
            ($boards[$row].split(" ") | Where-Object {($_)}) | ForEach-Object {
                if($_ -in $numbers[$skip..($take - 1)]){
                    $horizontalBingo++
                }
            }
            if($horizontalBingo -eq 5 -and $board -notin $boardsWon){
                $numbersDrawn = $numbers[$skip..($take - 1)]
                Write-Host "Horizontal bingo at row $_ which is board $board"
                Write-Host "$($numbersDrawn.count) numbers drawn: $numbersDrawn"
                $bingoWon = $true
                $boardsWon += $board
                $lastBoard = $board
            }
        }

    }
    $take++
}while($take -le 100 -and $boardsAmount -ge $boardsWon.count)

if($bingoWon){
    $check = $boards[(($lastBoard * 5) - 5)..(($lastBoard * 5) - 1)]
    $uncheckedNumbers = 0
    $check = $check.split(" ") | Where-Object {($_)}
    $check | ForEach-Object {
        if($_ -notin $numbersDrawn){
            $uncheckedNumbers += $_
        }
    }
    Write-Host "Answer is: $($uncheckedNumbers * $numbersDrawn[-1])"
}