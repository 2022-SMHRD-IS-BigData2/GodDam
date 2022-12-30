$('#testsubmit').on("click",function(){
	let ttlscore=0;
	var answer=[];
	for(var i=1;i<=10;i++){
		if(document.querySelector('input[name="question '+i+'"]:checked')!=null){
			var ans=document.querySelector('input[name="question '+i+'"]:checked')
			answer.push(ans.value)
		}
	};
	
	console.log(answer);
	if(answer.length<10){
		alert("모든 문항을 선택해 주세요",{
			title: "모든 문항이 선택되었는지 확인해주세요"
		})
		answer=[];
	}else{
		if(answer[0]=="네"){
			if(answer[1]=="5"){
				ttlscore+=25;
			}else if(answer[1]=="10"){
				ttlscore+=20;
			}else if(answer[1]=="15"){
				ttlscore+=15;
			}else if(answer[1]=="20"){
				ttlscore+=10;
			}else if(answer[1]=="30"){
				ttlscore+=0;
			}
			if(answer[2]=="네"){
				ttlscore+=15;
			}
			if(answer[3]=="네"){
				ttlscore+=15;
			}if(answer[4]=="네"){
				ttlscore+=10;
			}if(answer[5]=="네"){
				ttlscore+=10;
			}if(answer[6]=="네"){
				ttlscore+=5;
			}
			if(answer[7]=="네"){
				ttlscore+=5;
			}if(answer[9]=="네"){
				if(answer[8]=="1"){
					ttlscore+=0;
				}else if(answer[8]=="2"){
					ttlscore+=3;
				}else if(answer[8]=="3"){
					ttlscore+=5;
				}else if(answer[8]=="4"){
					ttlscore+=8;
				}else if(answer[8]=="5"){
					ttlscore+=10;
				}
				console.log(ttlscore);
			}else if(answer[9]=="아니요"){
				if(answer[8]=="1"){
					ttlscore+=1;
				}else if(answer[8]=="2"){
					ttlscore+=5;
				}else if(answer[8]=="3"){
					ttlscore+=7;
				}else if(answer[8]=="4"){
					ttlscore+=10;
				}else if(answer[8]=="5"){
					ttlscore+=15;
				}
				console.log(ttlscore);
			}
		}else if(answer[0]=="아니요"){
			if(answer[1]=="5"){
				ttlscore+=20;
			}else if(answer[1]=="10"){
				ttlscore+=17;
			}else if(answer[1]=="15"){
				ttlscore+=15;
			}else if(answer[1]=="20"){
				ttlscore+=10;
			}else if(answer[1]=="30"){
				ttlscore+=0;
			}
			if(answer[2]=="네"){
				ttlscore+=12;
			}
			console.log(ttlscore);
			if(answer[3]=="네"){
				ttlscore+=12;
			}if(answer[4]=="네"){
				ttlscore+=9;
			}if(answer[5]=="네"){
				ttlscore+=9;
			}if(answer[6]=="네"){
				ttlscore+=9;
			}if(answer[7]=="네"){
				ttlscore+=9;
			}if(answer[9]=="네"){
				if(answer[8]=="1"){
					ttlscore+=0;
				}else if(answer[8]=="2"){
					ttlscore+=10;
				}else if(answer[8]=="3"){
					ttlscore+=15;
				}else if(answer[8]=="4"){
					ttlscore+=20;
				}else if(answer[8]=="5"){
					ttlscore+=20;
				}
			}else if(answer[9]=="아니요"){
				if(answer[8]=="1"){
					ttlscore+=5;
				}else if(answer[8]=="2"){
					ttlscore+=15;
				}else if(answer[8]=="3"){
					ttlscore+=20;
				}else if(answer[8]=="4"){
					ttlscore+=20;
				}else if(answer[8]=="5"){
					ttlscore+=20;
				}
			}
		}
		
	console.log(ttlscore)
	if(ttlscore>=100){
		alert("대단하시네요! 만점입니다!");
		answer=[];
		$('.question').prop('checked',false);
	}else if(ttlscore>=0){
		alert("사용자님의 물절약 점수는 "+ttlscore+" 점 입니다.");
		answer=[];
		$('.question').prop('checked',false);
	}else if(ttlscore<0){
		alert("사용자님의 물절약 점수는 0점 입니다.");
		answer=[];
		$('.question').prop('checked',false);
	}
}
})
$('#checkreset').on("click",function(){
	$('.question').prop('checked',false);
	
})