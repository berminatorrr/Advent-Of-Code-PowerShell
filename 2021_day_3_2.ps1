$content = Get-Content .\2021_day_3_input.txt
$binaryLength = $content[0].Length
0..($binaryLength - 1) | ForEach-Object {
    $position = $_
    $count = 0
    $content | ForEach-Object {
        $count += $_.substring($position,1)
    }
    if($content.count -eq 1){
        $content = $content
    }elseif($count -ge ($content.Length / 2)){
        $content = $content | Where-Object {($_.Substring($position,1) -eq 1)}
    }else{
        $content = $content | Where-Object {($_.Substring($position,1) -eq 0)}   
    }
}
$oxygen = $content
$content = Get-Content .\2021_day_3_input.txt
$binaryLength = $content[0].Length
0..($binaryLength - 1) | ForEach-Object {
    $position = $_
    $count = 0
    $content | ForEach-Object {
        $count += $_.substring($position,1)
    }
    if($content.count -eq 1){
        $content = $content
    }elseif($count -ge ($content.Length / 2)){
        $content = $content | Where-Object {($_.Substring($position,1) -eq 0)}
    }else{
        $content = $content | Where-Object {($_.Substring($position,1) -eq 1)}   
    }
}
$c02 = $content
[convert]::ToInt32($oxygen,2) * [convert]::ToInt32($c02,2)