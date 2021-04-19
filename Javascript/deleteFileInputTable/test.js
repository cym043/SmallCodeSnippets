$(document).ready(function () {
    $("#fileInputValue").on("change", fileInputValueControlEventHandler);
});

result = [];

function fileInputValueControlEventHandler(event){

    if(event.target.files && event.target.files.length >0){
        $("#selectedList").children().remove();
    }
    counter = 0;

    var files = event.target.files;

    for(let file of files){
        result.push(file.name);
        let li = `<li id="${counter}" onClick="deleteFromArray(this.id)">${file.name}, ${file.size}, ${file.type},  id ${counter},  </li>`;
        //let a = `<p><a onClick="deleteFromArray(this.id)" href="#" id="${counter}">remove</a></p>`;
        console.log(file.name);
        $("#selectedList").append(li);
        counter++;
    }

    console.log(files);
    console.log("innerhalb func");
    return files;
}

console.log(result);

function deleteFromArray(id){
    var test = document.getElementById(id);
    console.log(id);
    //array.splice(id,1);
    test.remove();
    //id.parentNode.removeChild(id);
}