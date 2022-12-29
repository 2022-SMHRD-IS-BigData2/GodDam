let answer=[];
$('#testsubmit').on("click",function(){
	let ttlscore=0;
	var answer2=[];
	for(var i=1;i<=10;i++){
		if(document.querySelector('input[name="question '+i+'"]:checked')!=null){
			answer2.push(document.querySelector('input[name="question '+i+'"]:checked').value)
		}
	};
	
	for(var i=0;i<answer2.length;i++){
		answer.push(answer2[i])
	}
	console.log(answer);
	if(answer.length<10){
		alert("모든 문항을 선택해 주세요",{
			title: "모든 문항이 선택되었는지 확인해주세요"
		})
		answer=[];
	}else{
		if(answer[0]="네"){
			if(answer[1]="5"){
				ttlscore+=80;
			}else if(answer[1]="10"){
				ttlscore+=40;
			}else if(answer[1]="15"){
				ttlscore+=0;
			}else if(answer[1]="20"){
				ttlscore-=40;
			}else if(answer[1]="30"){
				ttlscore-=120;
			}
			if(answer[2]="네"){
				ttlscore+=40;
			}
			if(answer[3]="네"){
				ttlscore+=40;
			}if(answer[4]="네"){
				ttlscore+=12;
			}if(answer[5]="네"){
				ttlscore+=15;
			}if(answer[6]="네"){
				ttlscore+=5;
			}if(answer[7]="네"){
				ttlscore+=5;
			}if(answer[9]="네"){
				if(answer[8]="1"){
					ttlscore-=132.5;
				}else if(answer[8]="2"){
					ttlscore-=72.5;
				}else if(answer[8]="3"){
					ttlscore-=52.5;
				}else if(answer[8]="4"){
					ttlscore-=22.5;
				}else if(answer[8]="5"){
					ttlscore-=12.5;
				}
			}else if(answer[9]="아니요"){
				if(answer[8]="1"){
					ttlscore-=82.5;
				}else if(answer[8]="2"){
					ttlscore-=37.5;
				}else if(answer[8]="3"){
					ttlscore-=22.5;
				}else if(answer[8]="4"){
					ttlscore-=0;
				}else if(answer[8]="5"){
					ttlscore+=7.5;
				}
			}
		}else if(answer[0]="아니요"){
			if(answer[1]="5"){
				ttlscore+=80;
			}else if(answer[1]="10"){
				ttlscore+=40;
			}else if(answer[1]="15"){
				ttlscore+=0;
			}else if(answer[1]="20"){
				ttlscore-=40;
			}else if(answer[1]="30"){
				ttlscore-=120;
			}
			if(answer[2]="네"){
				ttlscore+=40;
			}
			if(answer[3]="네"){
				ttlscore+=40;
			}if(answer[4]="네"){
				ttlscore+=12;
			}if(answer[5]="네"){
				ttlscore+=15;
			}if(answer[6]="네"){
				ttlscore+=15;
			}if(answer[7]="네"){
				ttlscore+=15;
			}if(answer[9]="네"){
				if(answer[8]="1"){
					ttlscore-=52.5;
				}else if(answer[8]="2"){
					ttlscore-=12.5;
				}else if(answer[8]="3"){
					ttlscore+=4;
				}else if(answer[8]="4"){
					ttlscore+=12.5;
				}else if(answer[8]="5"){
					ttlscore+=17.5;
				}
			}else if(answer[9]="아니요"){
				if(answer[8]="1"){
					ttlscore-=30;
				}else if(answer[8]="2"){
					ttlscore-=0;
				}else if(answer[8]="3"){
					ttlscore+=12.5;
				}else if(answer[8]="4"){
					ttlscore+=18;
				}else if(answer[8]="5"){
					ttlscore+=22;
				}
			}
		}
	var actscore=Math.round(ttlscore/60*100*10)/10;
	console.log(actscore)
	if(actscore>=100){
		alert("대단하시네요! 만점입니다!");
		answer=[];
		location.reload();
	}else if(actscore>=0){
		alert("사용자님의 물절약 점수는 "+actscore+" 점 입니다.");
		answer=[];
		location.reload();
	}else if(actscore<0){
		alert("사용자님의 물절약 점수는 0점 입니다.");
		answer=[];
	}
}

})