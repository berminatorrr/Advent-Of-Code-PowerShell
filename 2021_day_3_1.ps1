$content = Get-Content .\2021_day_3_input.txt
$binaryLength = $content[0].Length
$answer = @{}
0..$binaryLength | ForEach-Object {
    $answer["$_"] = 0
}
$content | ForEach-Object {
    $row = $_
    0..($binaryLength - 1) | ForEach-Object {
        [int]$answer."$_" = [int]$answer."$_" + $($row.Substring($_,1))
    }
}
$gamma = "xxxxxxxxxxxx"
$epsilon = "xxxxxxxxxxxx"
0..($binaryLength - 1) | ForEach-Object {
    if(($content.count - $answer."$_") -gt ($content.count / 2)){
        $gamma = $gamma.remove($_,1).insert($_,"1")
        $epsilon = $epsilon.remove($_,1).insert($_,"0")
    }else{
        $gamma = $gamma.remove($_,1).insert($_,"0")
        $epsilon = $epsilon.remove($_,1).insert($_,"1")
    }
}
[convert]::ToInt32($epsilon,2) * [convert]::ToInt32($gamma,2)