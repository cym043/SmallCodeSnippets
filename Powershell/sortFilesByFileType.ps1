function sortFilesByExtension($path){
    $arr = (dir $path)

    for ($i=0;$i -lt $arr.Length; $i++){
        $entry = $arr[$i].Extension
        Write-Host $entry
        if(Test-Path($path +"\"+ $arr[$i].Extension)){
            Move-Item $arr[$i].FullName -Destination $arr[$i].Extension
        }else{
            New-Item -Path $path -Name $arr[$i].Extension -ItemType directory
            Move-Item $arr[$i].FullName -Destination $arr[$i].Extension
        }

    }

}