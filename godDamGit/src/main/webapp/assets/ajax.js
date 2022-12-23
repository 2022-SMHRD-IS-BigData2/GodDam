	$(document).ready(function(){ // ajax로 damList 만들기
    	$.ajax({
        url:"DamList.do",
        type:"post",
        data:{num:15}, //없어도됨
        dataType:"json",
        success:function(res){//call back함수, 응답값이 res로 자동으로 담김
            console.log('요청성공');
            console.log(res);
            var damList=res;
        },
        // 3. 요청이 실패할때 실행할 함수 : 오류임!
        erro:function(){
            console.log('요청실패!');
        }
    	})
	});
	$(document).ready(function(){ // ajax로 lastList 만들기
	    	$.ajax({
	        url:"LastDam.do",
	        type:"post",
	        data:{num:15}, //없어도됨
	        dataType:"json",
	        success:function(res){//call back함수, 응답값이 res로 자동으로 담김
	            console.log('요청성공');
	            console.log(res);
	            var lastList=res;
	        },
	        // 3. 요청이 실패할때 실행할 함수 : 오류임!
	        erro:function(){
	            console.log('요청실패!');
	        }
	    	})
		});
	$('#submit').on("click",function(){
		var damName=$('#damName').val();
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		console.log(damName,startDate,endDate)
		$.ajax({
			url:"SelectDay.do",
			type:"post",
			data:{damName:damName,startDate:startDate,endDate:endDate},
			dataType:"json",
			success:function(res){//call back함수, 응답값이 res로 자동으로 담김
	            console.log('요청성공');
	            console.log(res);
	            var selectDay=res;
	        },
	        // 3. 요청이 실패할때 실행할 함수 : 오류임!
	        erro:function(){
	            console.log('요청실패!');
	        }
		})																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											
	})
		
		