$content = Get-Content .\input.txt
$increase = 0
$content | ForEach-Object {
    if($previous){
        $dif = $_ - $previous
        if($dif -gt 0){
            $increase++
        }
    }
    $previous = $_
}
$increase