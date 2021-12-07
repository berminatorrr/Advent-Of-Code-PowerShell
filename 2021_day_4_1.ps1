$content = Get-Content .\2021_day_4_input.txt
$bingo = $content[0].Split(",")
$content = $content | Where-Object {($_ -ne $content[0])}
$croppedContent = $content | Where-Object {($_)}
$boards = $croppedContent.count / 3
$scoreObject = @()

0..($boards - 1) | ForEach-Object {
    $scoreObject += New-Object psobject -Property @{
        $_ = New-Object psobject -Property @{
            0 = 0
            1 = 0
            2 = 0
            3 = 0
            4 = 0
            5 = 0
            a = 0
            b = 0
            c = 0
            d = 0
            e = 0
        }
    }
}

foreach ($nr in $bingo) {
    0..($boards - 1) | Foreach-Object {
        $row = $croppedContent[$_]
        $rowCount = $_
        $rowArray = $row.Split(" ")
        $rowArray = $rowArray | Where-Object {($_)}
        0..4 | ForEach-Object {
            $checkNr = $rowArray[$_]
            if($checkNr -eq $nr){
                $scoreObject[$rowCount][$_] = 1
                #$croppedContent[$rowCount]["$_"] = "M$nr"
            }
        }
    }
}


$count = 0
$content | Foreach-Object {
    if(!$_){
        $count = 0
    }else{
        $count++
    }
}

foreach($nr in $bingo){

}