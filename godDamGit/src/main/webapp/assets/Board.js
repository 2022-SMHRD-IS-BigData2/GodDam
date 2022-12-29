
/*
function postnum(id) {
	
	let hiddenForm = document.createElement('form');
	var val = document.getElementById(id)

	let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('id', 'page');
    obj.setAttribute('value', id);
	
	hiddenForm.appendChild(obj);
    hiddenForm.setAttribute('method', 'post');
    hiddenForm.setAttribute('action', '/GoBoard.do');
    document.body.appendChild(hiddenForm);
    hiddenForm.submit();
	
	
	
	
}
*/



function postnum(page){

	console.log("Test "+page)
	location.href= "./GoBoard.do?page="+page;
	//document.move.page.value = page;
	//document.move.submit();
	
	
}


function aname(){
	 location.href="./goMain.do#chart123"

}

function aname2(){
	 location.href="./goMain.do#map123"

}












