
var datelabel = function(date1, date2) {
	var labels = [];
	var startdate=new Date(date1);
	var enddate=new Date(date2);
	while (true) {
		var year=startdate.getFullYear();
		var month=startdate.getMonth()+1;
		var day=startdate.getDate();
		var datelabel=year+'-'+month+'-'+day;
		labels.push(datelabel);
		if(enddate<startdate){
			break;
		}else{
			startdate=new Date(startdate.setMonth(startdate.getMonth()+1));
			}
	}
	return labels;
}
var datavow_rate = function(res) {
	var datalist = [];
	for (var i = 0; i < res.length; i++) {
		var date=new Date(res[i].d_date);
		var year=date.getFullYear();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var datelabel2=year+'-'+month+'-'+day;
		var data={x:datelabel2,y:res[i].d_vow_rate}
		datalist.push(data);
	}
	return datalist;
}
var datainflow = function(res) {
	var datalist = [];
	for (var i = 0; i < res.length; i++) {
		var date=new Date(res[i].d_date);
		var year=date.getFullYear();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var datelabel2=year+'-'+month+'-'+day;
		var data={x:datelabel2,y:res[i].d_inflow}
		datalist.push(data);
	}
	return datalist;
}
var dataoutflow = function(res) {
	var datalist = [];
	for (var i = 0; i < res.length; i++) {
		var date=new Date(res[i].d_date);
		var year=date.getFullYear();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var datelabel2=year+'-'+month+'-'+day;
		var data={x:datelabel2,y:res[i].d_ttl_outflow}
		datalist.push(data);
	}
	return datalist;
}

$('#submitwin').on("click", function() {
	var damName = $('#damNamewin').val();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	console.log(damName, startDate, endDate)
	$.ajax({
		url: "SelectDay.do",
		type: "post",
		data: { damName: damName, startDate: startDate, endDate: endDate },
		dataType: "json",
		success: function(res) {//call back함수, 응답값이 res로 자동으로 담김

			console.log('요청성공');
			console.log(res);
			var selectDay = res;
			$('#chartWinContainner').html('<canvas id="chartWin" width="100%"></canvas>')
			var chartArea = document.getElementById('chartWin');
			// 차트를 생성한다. 
			console.log(res[0].d_date,res[res.length-1].d_date)
			var myChartWin = new Chart(chartArea, {
				// ①차트의 종류(String)
				type: 'line',
				// ②차트의 데이터(Object)
				data: {
					// ③x축에 들어갈 이름들(Array)
					//labels: datelabel(res[0].d_date,res[res.length-1].d_date),
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets: [
					{
						// ⑤dataset의 이름(String)
						label: '저수량(%)',
						// ⑥dataset값(Array)
						data: datavow_rate(res),
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						fill: false,
    					borderColor: 'rgb(0, 0, 0)',
    					pointBorderColor : 'rgba(255,255,255,0)',
   					    pointBackgroundColor : 'rgba(255, 255, 255 , 0)',
    					pointHoverBackgroundColor : 'rgba(0,0,0,1)',
    					pointHoverBorderColor : 'rgba(0,0,0,1)',
    					pointHoverBorderWidth : 3,
    					tension: 0.2,
    					pointHitRadius : 1

					},
					{
						// ⑤dataset의 이름(String)
						label: '유입량',
						// ⑥dataset값(Array)
						data: datainflow(res),
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						fill: false,
    					borderColor: 'rgb(85, 113, 252)',
    					pointBorderColor : 'rgba(255,255,255,0)',
    				    pointBackgroundColor : 'rgba(255, 255, 255 , 0)',
    					pointHoverBackgroundColor : 'rgba(85, 113, 252, 1)',
    					pointHoverBorderColor : 'rgba(85, 113, 252, 1)',
    				    pointHoverBorderWidth : 3,
    					tension: 0.2,
    					pointHitRadius : 1
						
					},
					{
						// ⑤dataset의 이름(String)
						label: '총방류량',
						// ⑥dataset값(Array)
						data: dataoutflow(res),
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						fill: false,
    					borderColor: 'rgb(106, 236, 121)',
    					pointBorderColor : 'rgba(255,255,255,0)',
    				    pointBackgroundColor : 'rgba(255, 255, 255 , 0)',
    					pointHoverBackgroundColor : 'rgba(106, 236, 121, 1)',
    					pointHoverBorderColor : 'rgba(106, 236, 121, 1)',
    				    pointHoverBorderWidth : 3,
    					tension: 0.2,
    					pointHitRadius : 1

					}
					]
				},

				// ⑩차트의 설정(Object)
				options: {
					responsive: true,
					interaction: {
						mode: 'index',
						intersect: false,
					},
					stacked: false,
					plugins: {
						title: {
							display: true,
							text: '기간별 상세 정보'
						}
					},
					scales: {
						y: {
							type: 'linear',
							display: true,
							position: 'left',
						},
						y1: {
							type: 'linear',
							display: true,
							position: 'right',

							// grid line settings
							grid: {
								drawOnChartArea: false, // only want the grid lines for one axis to show up
							},
						},
					}
				},
			});
			$('#tableContainner').html(`<table border="1" style=";
			overflow: hidden;
    		width: 100%;
   			min-width: 28em;
    		border: 1px solid #D2D2D2;
    		table-layout: fixed;
    		border-collapse: collapse;
    		border-spacing: 0;
    		text-size-adjust: none;
    		word-wrap: break-word;
    		word-break: keep-all;
    		text-align:center>
    		<thead>
    		<tr>
    		<th scope="row"></th>
    		<th scope="row">날짜</th>
    		<th scope="row">저수량<br>(백만㎥)</th>
    		<th scope="row">수위<br>(EL.m)</th>
    		<th scope="row">저수율<br>(%)</th>
    		<th scope="row">유입량<br>(㎥/s)</th>
    		<th scope="row">총방류량<br>(㎥/s)</th>
    		</tr>
    		</thead>
    		<tbody id="datatable"><tbody>`);
    		
    		for(var i=res.length-1;i>=0;i--){
				var date=new Date(res[i].d_date);
				var year=date.getFullYear();
				var month=date.getMonth()+1;
				var day=date.getDate();
				var datelabel2=year+'-'+month+'-'+day;
				$('#datatable').append(
					`<tr>
				<td align="center">`+ datelabel2 + `</td>
				<td align="center">`+ res[i].d_vow + `</td>
				<td align="center">`+ res[i].d_level + `</td>
				<td align="center">`+ res[i].d_vow_rate + `</td>
				<td align="center">`+ res[i].d_inflow + `</td>
				<td align="center">`+ res[i].d_ttl_outflow + `</td>
					</tr>`
					)
			}
			},

		// 3. 요청이 실패할때 실행할 함수 : 오류임!
		erro: function() {
			console.log('요청실패!');
		}
	})
})