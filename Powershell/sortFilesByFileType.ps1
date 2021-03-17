function sortFilesByExtension($path){
    
    #Get the files from the passed path and put them into an array
    $arr = (dir $path)
    
    #Iterate through the files by index
    for($i=0;$i -lt $arr.Length; $i++){
        
        #Get the extension name
        $entry = $arr[$i].Extension
        
        #Write the file to the console
        Write-Host $entry
        
        #If the directory for file extension exists, move the file in the folder
        if(Test-Path($path +"\"+ $arr[$i].Extension)){
            Move-Item $arr[$i].FullName -Destination $arr[$i].Extension
            
        #Else create the folder and move the file into the created folder
        }else{
            New-Item -Path $path -Name $arr[$i].Extension -ItemType directory
            Move-Item $arr[$i].FullName -Destination $arr[$i].Extension
        }

    }

}
