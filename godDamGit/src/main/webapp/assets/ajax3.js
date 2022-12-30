


// 2페이지 오른쪽 일 상세보기 페이지
$('#dayradio').on('click', function() { // ajax로 damList 만들기
	$.ajax({
		url: "DamList.do",
		type: "post",
		data: { num: 15 }, //없어도됨
		dataType: "json",
		success: function(res) {//call back함수, 응답값이 res로 자동으로 담김
			console.log('요청성공');
			console.log(res);
			var damList = res;
			$('#selecttagin').html(`<select id=damName 
								style = "width:168px ; height:50px ;font-size:25px"><select>`)
			for (var i = 0; i < res.length; i++) {
				$('#damName').append(`<option value='` + res[i].dam_name + `'>` + res[i].dam_namekor + `</option>`)
			};
			$('#damName').after(`<input type="text" id="startDate" name = "startDate"
								style = "width:168px ; height:44px ;font-size:30px" 
			>`);
			$('#startDate').after(`<input type="submit" id="submit2page" value="검색"
								style = "width:164px ; height:49px ;font-size:26px"
			>`);


			$('#submit2page').on("click", function() {
				var damName = $('#damName').val();
				var startDate = $('#startDate').val();
				console.log(damName, startDate)
				$.ajax({
					url: "DetailDay.do",
					type: "post",
					data: { damName: damName, startDate: startDate },
					dataType: "json",
					success: function(res2) {//call back함수, 응답값이 res로 자동으로 담김
						console.log('요청성공');
						console.log(res2);
						var detailday = [res2.d_level, res2.d_vow, res2.d_vow_rate, res2.d_inflow, res2.d_ttl_outflow];

						$('#detailchart').html('<canvas id="chartWin2" width="1500px" height="1000px"></canvas>')
						var chartArea2 = document.getElementById('chartWin2');
						var label2 = ['저수위', '저수량', '저수율', '유입량', '총방출량']
						var date = new Date(res2.d_date);
						var year = date.getFullYear();
						var month = date.getMonth() + 1;
						var day = date.getDate();
						var datelabel2 = year + '-' + month + '-' + day;
						// 차트를 생성한다. 
						console.log(res2.d_date, res2)
						var myChartWin2 = new Chart(chartArea2, {
							// ①차트의 종류(String)
							type: 'bar',
							// ②차트의 데이터(Object)

							data: {
								// ③x축에 들어갈 이름들(Array)
								//labels: datelabel(res[0].d_date,res[res.length-1].d_date),
								// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다..
								labels: ['저수위', '저수량', '저수율', '유입량', '총방출량'],
								datasets: [
									{
										label: datelabel2,
										data: [res2.d_level, res2.d_vow, res2.d_vow_rate, res2.d_inflow, res2.d_ttl_outflow],

										backgroundColor: [
											'rgba(255, 99, 132, 1)',
											'rgba(255, 159, 64, 1)',
											'rgba(255, 205, 86, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(54, 162, 235, 1)',
										],
									},

								],

							},
							options: {

								indexAxis: 'y',

								// Elements options apply to all of the options unless overridden in a dataset
								// In this case, we are setting the border of each horizontal bar to be 2px wide
								elements: {
									bar: {
										borderWidth: 2,
									}
								},
								responsive: true,

							},

							// ⑩차트의 설정(Object)

						});
			
				$('#detailtable').html(`<table border="1" style=";
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
				
				
					var date=new Date(res2.d_date);
					var year=date.getFullYear();
					var month=date.getMonth()+1;
					var day=date.getDate();
					var datelabel2=year+'-'+month+'-'+day;
					$('#datatable').append(
						`<tr>
					<td align="center">`+ datelabel2 + `</td>
					<td align="center">`+ res2.d_vow + `</td>
					<td align="center">`+ res2.d_level + `</td>
					<td align="center">`+ res2.d_vow_rate + `</td>
					<td align="center">`+ res2.d_inflow + `</td>
					<td align="center">`+ res2.d_ttl_outflow + `</td>
						</tr>`
						)
				
					},

					// 3. 요청이 실패할때 실행할 함수 : 오류임!
					erro: function() {
						console.log('요청실패!');
					}
				})
			})

			$.datepicker.setDefaults($.datepicker.regional['ko']);

			$("#startDate").datepicker({
				changeMonth: true,
				changeYear: true,
				nextText: '다음 달',
				prevText: '이전 달',
				dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dateFormat: "yy-mm-dd",
				minDate: -1095,
				maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)

				onClose: function(selectedDate) {
					//시작일(startDate) datepicker가 닫힐때
					$("#endDate").datepicker("option", "minDate", selectedDate);
				}
			});

		},


		// 3. 요청이 실패할때 실행할 함수 : 오류임!
		erro: function() {
			console.log('요청실패!');
		}
	})
});




/*1226 우종빈 window 관련 함수 삭제함 */




// 2페이지 오른쪽 월 상세보기 페이지	
$('#monthradio').on('click', function() { // ajax로 damList 만들기
	$.ajax({
		url: "DamList.do",
		type: "post",
		data: { num: 15 }, //없어도됨
		dataType: "json",
		success: function(res) {//call back함수, 응답값이 res로 자동으로 담김
			console.log('요청성공');
			console.log(res);
			var damList = res;
			$('#selecttagin').html(`<select id=damName
									style = "width:168px ; height:50px ;font-size:25px"
									><select> 
									<select id=yearselect
									style = "width:168px ; height:50px ;font-size:25px"
									><select> 
									<select id=monthselect
									style = "width:168px ; height:50px ;font-size:25px"
									><select> `)
			for (var i = 0; i < res.length; i++) {
				$('#damName').append(`<option value='` + res[i].dam_name + `'>` + res[i].dam_namekor + `</option>`)
			};

			for (var i = 2020; i < 2023; i++) {
				$('#yearselect').append(`<option value='` + i + `'>` + i + `</option>`)
			};

			for (var i = 1; i < 13; i++) {
				if (i < 10) {
					$('#monthselect').append(`<option value='0` + i + `'>0` + i + `</option>`)
				} else {
					$('#monthselect').append(`<option value='` + i + `'>` + i + `</option>`)
				}
			};


			$('#monthselect').after(`<input type="submit" id="submit2page2" value="검색"
									style = "width:168px ; height:50px ;font-size:25px"
			>`);

			$('#submit2page2').on("click", function() {
				var damName = $('#damName').val();
				var startDate = $('#yearselect').val()+'-' + $('#monthselect').val()+'-' + '01'
				console.log(damName, startDate)
				$.ajax({
					url: "DetailMonth.do",
					type: "post",
					data: { damName: damName, startDate: startDate },
					dataType: "json",
					success: function(res3) {//call back함수, 응답값이 res로 자동으로 담김
						console.log('요청성공');
						console.log(res3);
						var detailday = [res3.m_level, res3.m_vow, res3.m_vow_rate, res3.m_inflow, res3.m_ttl_outflow];

						$('#detailchart').html('<canvas id="chartWin3" width="1500px" height="1000px"></canvas>')
						var chartArea3 = document.getElementById('chartWin3');
						var label3 = ['저수위', '저수량', '저수율', '유입량', '총방출량']
						var date = new Date(res3.m_date);
						var year = date.getFullYear();
						var month = date.getMonth() + 1;
						var day = date.getDate();
						var datelabel3 = year + '-' + month + '-' + day;
						// 차트를 생성한다. 
						console.log(res3.m_date, res3)
						var myChartWin3 = new Chart(chartArea3, {
							// ①차트의 종류(String)
							type: 'bar',
							// ②차트의 데이터(Object)
							
							data: {
								// ③x축에 들어갈 이름들(Array)
								//labels: datelabel(res[0].d_date,res[res.length-1].d_date),
								// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다..
								labels: ['저수위', '저수량', '저수율', '유입량', '총방출량'],
								datasets: [
									{
										label: datelabel3,
										data: [res3.m_level, res3.m_vow, res3.m_vow_rate, res3.m_inflow, res3.m_ttl_outflow],

										backgroundColor: [
											'rgba(255, 99, 132, 1)',
											'rgba(255, 159, 64, 1)',
											'rgba(255, 205, 86, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(54, 162, 235, 1)',
										],
									},

								],

							},
							options: {

								indexAxis: 'y',

								// Elements options apply to all of the options unless overridden in a dataset
								// In this case, we are setting the border of each horizontal bar to be 2px wide
								elements: {
									bar: {
										borderWidth: 2,
									}
								},
								responsive: true,

							},

							// ⑩차트의 설정(Object)
});
				$('#detailtable').html(`<table border="1" style=";
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
				
				
					var date=new Date(res3.m_date);
					var year=date.getFullYear();
					var month=date.getMonth()+1;
					var day=date.getDate();
					var datelabel2=year+'-'+month+'-'+day;
					$('#datatable').append(
						`<tr>
					<td align="center">`+ datelabel2 + `</td>
					<td align="center">`+ res3.m_vow + `</td>
					<td align="center">`+ res3.m_level + `</td>
					<td align="center">`+ res3.m_vow_rate + `</td>
					<td align="center">`+ res3.m_inflow + `</td>
					<td align="center">`+ res3.m_ttl_outflow + `</td>
						</tr>`
						)
				
					},

					// 3. 요청이 실패할때 실행할 함수 : 오류임!
					erro: function() {
						console.log('요청실패!');
					}
				})
			})

		},


		// 3. 요청이 실패할때 실행할 함수 : 오류임!
		erro: function() {
			console.log('요청실패!');
		}
	})
});