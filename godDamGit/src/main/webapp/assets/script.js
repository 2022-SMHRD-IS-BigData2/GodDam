/* 이스터에그 트리거 */  
function dis_non() {
  document.getElementsByClassName("typing_demo")[0].style.display="none";
  
}
self.setTimeout("dis_non()",3900); // 1초: 1000

//setTimeout(".typing_demo_in",2000)

/* document.body.onclick =function() {
  console.log('SCROLLING...');
  const el = document.getElementsByClassName('scrllap_ap');
  const pos = el.getBoundingClientRect();
  const selection = document.querySelector('.sections');
  sections.scrollTo(0,pos.top);
} */










/* 1223 김민석: 차트 js 추가 */

// 메인 서브 차트3 js
var ctx = document.getElementById("barChart").getContext('2d');
var barChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월","10월", "11월", "12월"],
    datasets: [{
      label: '2021년',
      data: [56.84, 52.01, 49.66, 47.92, 43.32, 38.65, 58.49, 61.41, 62.20, 58.87, 53.60, 48.35],
      backgroundColor: "#6495ed" /* 1226 김민석 : 색상 변경 */
    }, {
      label: '2022년',
      data: [42.88, 37.60, 33.79, 33.27, 30.53, 26.60, 25.05, 36.94, 39.91, 33.91, 31.70, 30.48],
      backgroundColor: "grey"
    }]
  }
});

// ==========================================================================================


// 메인 서브 차트1 js
var label = document.querySelector(".label");
var c = document.getElementById("ctx");
var ctx = c.getContext("2d");
var cw = c.width = 500;
var ch = c.height = 350;
var cx = cw / 2,
  cy = ch / 2;
var rad = Math.PI / 180;
var frames = 0;

ctx.lineWidth = 1;
ctx.strokeStyle = "#000000";
ctx.fillStyle = "#000000";
ctx.font = "14px monospace";

var grd = ctx.createLinearGradient(0, 0, 0, cy);
grd.addColorStop(0, "hsla(167,72%,60%,1)");
grd.addColorStop(1, "hsla(167,72%,60%,0)");

var oData = {
  "1월": 42.88,
  "2월": 37.60,
  "3월": 33.79,
  "4월": 33.27,
  "5월": 30.53,
  "6월": 26.60,
  "7월": 25.05,
  "8월": 36.94,
  "9월": 39.91,
  "10월": 33.91,
  "11월": 31.70,
  "12월": 30.48
};
// 1227 김민석: 71~82줄 서브차트 데이터 변경 

var valuesRy = [];
var propsRy = [];
for (var prop in oData) {

  valuesRy.push(oData[prop]);
  propsRy.push(prop);
}


var vData = 4;
var hData = valuesRy.length;
var offset = 50.5; //offset chart axis
var chartHeight = ch - 2 * offset;
var chartWidth = cw - 2 * offset;
var t = 1 / 7; // curvature : 0 = no curvature 
var speed = 2; // for the animation

var A = {
  x: offset,
  y: offset
}
var B = {
  x: offset,
  y: offset + chartHeight
}
var C = {
  x: offset + chartWidth,
  y: offset + chartHeight
}

/*
      A  ^
	    |  |  
	    + 25
	    |
	    |
	    |
	    + 25  
      |__|_________________________________  C
      B
*/

// CHART AXIS -------------------------
ctx.beginPath();
ctx.moveTo(A.x, A.y);
ctx.lineTo(B.x, B.y);
ctx.lineTo(C.x, C.y);
ctx.stroke();

// vertical ( A - B )
var aStep = (chartHeight - 110) / (vData);   // 1227 김민석: 데이터 변경

var Max = Math.ceil(arrayMax(valuesRy) / 10) * 10;
var Min = Math.floor(arrayMin(valuesRy) / 10) * 10;
var aStepValue = (Max - Min) / (vData);
console.log("aStepValue: " + aStepValue); //8 units
var verticalUnit = aStep / aStepValue;

var a = [];
ctx.textAlign = "right";
ctx.textBaseline = "middle";
for (var i = 0; i <= vData; i++) {

  if (i == 0) {
    a[i] = {
      x: A.x,
      y: A.y,
      val: Max
    }
  } else {
    a[i] = {}
    a[i].x = a[i - 1].x;
    a[i].y = a[i - 1].y + aStep;
    a[i].val = a[i - 1].val - aStepValue;
  }
  drawCoords(a[i], 3, 0);
}

//horizontal ( B - C )
var b = [];
ctx.textAlign = "center";
ctx.textBaseline = "hanging";
var bStep = chartWidth / (hData + 1);

for (var i = 0; i < hData; i++) {
  if (i == 0) {
    b[i] = {
      x: B.x + bStep,
      y: B.y,
      val: propsRy[0]
    };
  } else {
    b[i] = {}
    b[i].x = b[i - 1].x + bStep;
    b[i].y = b[i - 1].y;
    b[i].val = propsRy[i]
  }
  drawCoords(b[i], 0, 3)
}

function drawCoords(o, offX, offY) {
  ctx.beginPath();
  ctx.moveTo(o.x - offX, o.y - offY);
  ctx.lineTo(o.x + offX, o.y + offY);
  ctx.stroke();

  ctx.fillText(o.val, o.x - 2 * offX, o.y + 2 * offY);
}
//----------------------------------------------------------

// DATA
var oDots = [];
var oFlat = [];
var i = 0;

for (var prop in oData) {
  oDots[i] = {}
  oFlat[i] = {}

  oDots[i].x = b[i].x;
  oFlat[i].x = b[i].x;

  oDots[i].y = b[i].y - oData[prop] * verticalUnit - 25;
  oFlat[i].y = b[i].y - 25;

  oDots[i].val = oData[b[i].val];
  
  i++
}



///// Animation Chart ///////////////////////////
//var speed = 3;
function animateChart() {
  requestId = window.requestAnimationFrame(animateChart);
  frames += speed; //console.log(frames)
  ctx.clearRect(60, 0, cw, ch - 60);
  
  for (var i = 0; i < oFlat.length; i++) {
    if (oFlat[i].y > oDots[i].y) {
      oFlat[i].y -= speed;
    }
  }
  drawCurve(oFlat);
  for (var i = 0; i < oFlat.length; i++) {
      ctx.fillText(oDots[i].val, oFlat[i].x, oFlat[i].y - 25);
      ctx.beginPath();
      ctx.arc(oFlat[i].x, oFlat[i].y, 3, 0, 2 * Math.PI);
      ctx.fill();
    }

  if (frames >= Max * verticalUnit) {
    window.cancelAnimationFrame(requestId);
    
  }
}
requestId = window.requestAnimationFrame(animateChart);

/////// EVENTS //////////////////////
c.addEventListener("mousemove", function(e) {
  label.innerHTML = "";
  label.style.display = "none";
  this.style.cursor = "default";

  var m = oMousePos(this, e);
  for (var i = 0; i < oDots.length; i++) {

    output(m, i);
  }

}, false);

function output(m, i) {
  ctx.beginPath();
  ctx.arc(oDots[i].x, oDots[i].y, 20, 0, 2 * Math.PI);
  if (ctx.isPointInPath(m.x, m.y)) {
    //console.log(i);
    label.style.display = "block";
    label.style.top = (m.y + 10) + "px";
    label.style.left = (m.x + 10) + "px";
    label.innerHTML = "<strong>" + propsRy[i] + "</strong>: " + valuesRy[i] + "%";
    c.style.cursor = "pointer";
  }
}

// CURVATURE
function controlPoints(p) {
  // given the points array p calculate the control points
  var pc = [];
  for (var i = 1; i < p.length - 1; i++) {
    var dx = p[i - 1].x - p[i + 1].x; // difference x
    var dy = p[i - 1].y - p[i + 1].y; // difference y
    // the first control point
    var x1 = p[i].x - dx * t;
    var y1 = p[i].y - dy * t;
    var o1 = {
      x: x1,
      y: y1
    };

    // the second control point
    var x2 = p[i].x + dx * t;
    var y2 = p[i].y + dy * t;
    var o2 = {
      x: x2,
      y: y2
    };

    // building the control points array
    pc[i] = [];
    pc[i].push(o1);
    pc[i].push(o2);
  }
  return pc;
}

function drawCurve(p) {

  var pc = controlPoints(p); // the control points array

  ctx.beginPath();
  //ctx.moveTo(p[0].x, B.y- 25);
  ctx.lineTo(p[0].x, p[0].y);
  // the first & the last curve are quadratic Bezier
  // because I'm using push(), pc[i][1] comes before pc[i][0]
  ctx.quadraticCurveTo(pc[1][1].x, pc[1][1].y, p[1].x, p[1].y);

  if (p.length > 2) {
    // central curves are cubic Bezier
    for (var i = 1; i < p.length - 2; i++) {
      ctx.bezierCurveTo(pc[i][0].x, pc[i][0].y, pc[i + 1][1].x, pc[i + 1][1].y, p[i + 1].x, p[i + 1].y);
    }
    // the first & the last curve are quadratic Bezier
    var n = p.length - 1;
    ctx.quadraticCurveTo(pc[n - 1][0].x, pc[n - 1][0].y, p[n].x, p[n].y);
  }

  //ctx.lineTo(p[p.length-1].x, B.y- 25);
  ctx.stroke();
  ctx.save();
  ctx.fillStyle = grd;
  ctx.fill();
  ctx.restore();
}

function arrayMax(array) {
  return Math.max.apply(Math, array);
};

function arrayMin(array) {
  return Math.min.apply(Math, array);
};

function oMousePos(canvas, evt) {
  var ClientRect = canvas.getBoundingClientRect();
  return { //objeto
    x: Math.round(evt.clientX - ClientRect.left),
    y: Math.round(evt.clientY - ClientRect.top)
  }
}
// ========================================================================================


/*
// 메인 서브 차트2 
var options = {
    chart: {
      type: 'bar'
    },
    series: [{
      name: '주암댐 월별 저수율(%)',
      data: [42.88, 37.60, 33.79, 33.27, 30.53, 26.60, 25.05, 36.94, 39.91, 33.91, 31.70, 30.48]
    }],
    xaxis: {
      categories: [1,2,3,4,5,6,7,8,9,10,11,12]
    }
  }
  
  var chart = new ApexCharts(document.querySelector("#chart2"), options);
  
  
  chart.render(); 
*/
// ======================================================================================



// 메인 차트 js
// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);



chart.data = [{
  "months": "1월",
  "2021년": 87.65,
  "2022년": 65.67,
  
}, {
  "months": "2월",
  "2021년": 67.50,
  "2022년": 50.84,
  
}, {
  "months": "3월",
  "2021년": 72.72,
  "2022년": 61.64,
  
}, {
  "months": "4월",
  "2021년": 70.94,
  "2022년": 52.48,
  
}, {
  "months": "5월",
  "2021년": 80.81,
  "2022년": 47.67,
  
}, {
  "months": "6월",
  "2021년": 64.28,
  "2022년": 36.58,
  
}, {
  "months": "7월",
  "2021년": 74.58,
  "2022년": 28.49,
  
}, {
  "months": "8월",
  "2021년": 63.56,
  "2022년": 25.87,
  
}, {
  "months": "9월",
  "2021년": 67.69,
  "2022년": 23.71,
  
}, {
  "months": "10월",
  "2021년": 58.21,
  "2022년": 28.54,
  
}, {
  "months": "11월",
  "2021년": 64.54,
  "2022년": 26.80,
  
}, {
  "months": "12월",
  "2021년": 60.42,
  "2022년": 30.21,
  
}];

chart.dateFormatter.inputDateFormat = "MM";
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.minGridDistance = 60;
dateAxis.startLocation = 0.5;
dateAxis.endLocation = 0.5;
dateAxis.baseInterval = {
  timeUnit: "months",
  count: 1
}

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.tooltip.disabled = true;

var series = chart.series.push(new am4charts.LineSeries());
series.name = "2022년 저수율(%)";
series.dataFields.dateX = "months";
series.dataFields.valueY = "2022년";
// series.tooltipHTML = "<img src='https://www.amcharts.com/lib/3/images/car.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>{valueY.value}</b></span>";
series.tooltipText = "[#000]2022년：{valueY.value}%[/]";
series.tooltip.background.fill = am4core.color("#ff3333");
series.tooltip.getStrokeFromObject = true;
series.tooltip.background.strokeWidth = 3;
series.tooltip.getFillFromObject = false;
series.fillOpacity = 0.6;
series.strokeWidth = 5;
series.stacked = true;

var series2 = chart.series.push(new am4charts.LineSeries());
series2.name = "2021년 저수율(%)";
series2.dataFields.dateX = "months";
series2.dataFields.valueY = "2021년";  // 1227 김민석: 463줄, 477줄 데이터 변경
// series2.tooltipHTML = "<img src='https://www.amcharts.com/lib/3/images/motorcycle.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>{valueY.value}</b></span>";
series2.tooltipText = "[#000]2021년：{valueY.value}%[/]";
series2.tooltip.background.fill = am4core.color("#00bf00");
series2.tooltip.getFillFromObject = false;
series2.tooltip.getStrokeFromObject = true;
series2.tooltip.background.strokeWidth = 3;
series2.sequencedInterpolation = true;
series2.fillOpacity = 0.6;
series2.stacked = true;
series2.strokeWidth = 5;

// 1227 김민석: day를 monts로 다 변경, 여러 데이터 변경 등등..

chart.cursor = new am4charts.XYCursor();
chart.cursor.xAxis = dateAxis;
chart.scrollbarX = new am4core.Scrollbar();

// Add a legend
chart.legend = new am4charts.Legend();
chart.legend.position = "bottom right";

// axis ranges
var range = dateAxis.axisRanges.create();
range.date = new Date(100, 0, 1);
range.endDate = new Date(100, 0, 1);
range.axisFill.fill = chart.colors.getIndex(7);
range.axisFill.fillOpacity = 0.2;

// range.label.text = "Fines for speeding increased";
// range.label.inside = true;
// range.label.rotation = 90;
// range.label.horizontalCenter = "right";
// range.label.verticalCenter = "bottom";

// var range2 = dateAxis.axisRanges.create();
// range2.date = new Date(2007, 0, 1);
// range2.grid.stroke = chart.colors.getIndex(7);
// range2.grid.strokeOpacity = 0.6;
// range2.grid.strokeDasharray = "5,2";


// range2.label.text = "Motorcycle fee introduced";
// range2.label.inside = true;
// range2.label.rotation = 90;
// range2.label.horizontalCenter = "right";
// range2.label.verticalCenter = "bottom";
// ==========================================================================================



// 메인 서브 차트4 js
var obsdh = [];
var rsqty = [];
var rsrt = [];
var iqty = [];
var tdqty = [];
//setTimeout(".typing_demo_in",2000)

$.ajax({
    url : "http://www.wamis.go.kr:8080/wamis/openapi/wkd/mn_hrdata?damcd=4007110&output=json&key=39c52f275d8ac14c511db84cec9adf3640b3b8f2af",

    success : function(res){
    // 3. 응답받은 데이터를 console 출력
      let list = res['list'];
      console.log(list);
        for(var i =list.length-169; i < list.length; i++){
            obsdh.push(list[i].obsdh);
            rsqty.push(list[i].rsqty);
            rsrt.push(list[i].rsrt);
            iqty.push(list[i].iqty);
            tdqty.push(list[i].tdqty);
            }
            const ctx = document.getElementById('myChart');
            new Chart(ctx, {
                type: 'line',
                  data: {
                      labels: obsdh,
                      datasets: [{
                         label: '저수량',
                         data: rsqty,
                      fill:false
                         }, {
                        label: '저수율',
                        data: rsrt,
                         fill:false
                        }, {
                        label: '유입량',
                        data: iqty,
                         fill:false
                        }, {
                        label: '총 방류량',
                        data: tdqty,
                        fill:false
                        }]
                      },
                      options: {
                         title: {
                             display: true,
                             text: '실시간 주암댐 데이터' // 1227 김민석 : 데이터 변경
                             }
                         }
                    });
                    
                },
                error : function(){
                    console.log('요청실패');
                }

            });
            
/* 1223 김민석 차트 js 추가 */


/* 221226 최일남 js 사진페이지 버튼 */

var ak1 = '<i class="fa-sharp fa-solid fa-circle-dot"></i> <i class="fa-sharp fa-solid fa-circle"></i> <i class="fa-sharp fa-solid fa-circle"></i>'
var ak2 = '<i class="fa-sharp fa-solid fa-circle"></i> <i class="fa-sharp fa-solid fa-circle"></i> <i class="fa-sharp fa-solid fa-circle-dot"></i>'
var ak3 = '<i class="fa-sharp fa-solid fa-circle"></i> <i class="fa-sharp fa-solid fa-circle-dot"></i> <i class="fa-sharp fa-solid fa-circle"></i>'

var testimg = 'https://i.pinimg.com/564x/4c/fc/b0/4cfcb0cb3a4a4a18656c4fb7e1481f35.jpg'
var testimg2 = 'https://i.pinimg.com/564x/a5/9b/a9/a59ba9009b7a9337074795578cddc6e8.jpg'

var cat = document.querySelector('#b')

var testlist = [testimg, testimg2]
var templist = [ak1, ak2, ak3]

$('body').on('keydown', function (event) {

  console.log(event);

  function movelr(e) {
    if (e == 37) {
      $('#ab').html(templist[0])
      cat.setAttribute('src',testlist[0])
    }else if (e == 39) {
      $('#ab').html(templist[1])
      cat.setAttribute('src',testlist[1])

    }
  }

  function resetc() {
    $('#ab').html(templist[2])
  }
  


  movelr(event.keyCode);
  setTimeout(resetc,0200);


})


 // 1초: 1000


// 1226 김민석 : 스크롤 상단 버튼 추가 js 
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('#boxicon').show();
	} else{
		$('#boxicon').hide();
	}
});
$('#boxicon').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
// 1226 김민석 : 스크롤 상단 버튼 추가 js 




// 1228 김민석: 1페이지 물 사용량 수칙 추가 js

// Created for an Articles on:
// https://www.html5andbeyond.com/bubbling-text-effect-no-canvas-required/

jQuery(document).ready(function($){
 
    // Define a blank array for the effect positions. This will be populated based on width of the title.
    var bArray = [];
    // Define a size array, this will be used to vary bubble sizes
    var sArray = [5,10,15,20];
 
    // Push the header width values to bArray
    for (var i = 0; i < $('.bubbles').width(); i++) {
        bArray.push(i);
    }
     
    // Function to select random array element
    // Used within the setInterval a few times
    function randomValue(arr) {
        return arr[Math.floor(Math.random() * arr.length)];
    }
 
    // setInterval function used to create new bubble every 350 milliseconds
    setInterval(function(){
         
        // Get a random size, defined as variable so it can be used for both width and height
        var size = randomValue(sArray);
        // New bubble appeneded to div with it's size and left position being set inline
        // Left value is set through getting a random value from bArray
        $('.bubbles').append('<div class="individual-bubble" style="left: ' + randomValue(bArray) + 'px; width: ' + size + 'px; height:' + size + 'px;"></div>');
         
        // Animate each bubble to the top (bottom 100%) and reduce opacity as it moves
        // Callback function used to remove finsihed animations from the page
        $('.individual-bubble').animate({
            'bottom': '100%',
            'opacity' : '-=0.7'
        }, 3000, function(){
            $(this).remove()
        }
        );
 
 
    }, 350);
 
});

// 1228 김민석: 1페이지 물 사용량 수칙 추가 js