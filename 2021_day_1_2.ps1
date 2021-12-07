$content = Get-Content .\input.txt
$take = 2
$previous = $false
$increase = 0
0..($content.length -1) | ForEach-Object {
    $block = 0
    $content[$_..($_ + $take)] | ForEach-Object {
        $block += $_
    }
    if($previous){
        if($block -gt $previous){
            $increase++
        }
    }
    $previous = $block
}
$increase