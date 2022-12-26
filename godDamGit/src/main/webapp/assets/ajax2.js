  $(document).ready(function(){         
      $.ajax({
            url: "https://api.openweathermap.org/data/2.5/weather?q=Gwangju&appid=b4032dcdcb4afdf78c8947acaffbf03c",
            type: "GET",
            dataType: "json",
            async: "false",
            success: function(res) {
 //               console.log(res);
                console.log('날씨데이터 성공');
              
               
//                console.log("날씨 : "+ res.weather[0].main );
//                console.log("상세날씨설명 : "+ res.weather[0].description );
//                console.log("날씨 이미지 : "+ res.weather[0].icon );
//                console.log("바람   : "+ res.wind.speed );c
//                console.log("나라   : "+ res.sys.country );
//                console.log("도시이름  : "+ res.name )
//                console.log("구름  : "+ (res.clouds.all) +"%" );



            
            var hot = String((res.main.temp - 273)).substring(0,3);
			var date = new Date();
			
			
             $(".weatherarea").append(res.name);
             $(".weatherdes").append(res.weather[0].description);
            $(".weatherhot").append("현재온도 : " + hot);
            $(".weatherwind").append(("풍속 : " + res.wind.speed ));
            $(".weathercloud").append(("구름  : "+ (res.clouds.all) +"%" ));


          var weathericonUrl =
            '<img src= "http://openweathermap.org/img/wn/'
            + res.weather[0].icon +
            '.png" alt="' + res.weather[0].description + '"/>'

        $('.weathericon').html(weathericonUrl);   

             
                               
            },
                       // 3. 요청이 실패할때 실행할 함수 : 오류임!
           erro:function(){
               console.log('요청실패!');
           }

   })
     
});
	

