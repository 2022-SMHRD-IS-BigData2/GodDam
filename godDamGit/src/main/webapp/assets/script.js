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
      backgroundColor: "white"
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
var cw = c.width = 550;
var ch = c.height = 350;
var cx = cw / 2,
  cy = ch / 2;
var rad = Math.PI / 180;
var frames = 0;

ctx.lineWidth = 1;
ctx.strokeStyle = "#999";
ctx.fillStyle = "#ccc";
ctx.font = "14px monospace";

var grd = ctx.createLinearGradient(0, 0, 0, cy);
grd.addColorStop(0, "hsla(167,72%,60%,1)");
grd.addColorStop(1, "hsla(167,72%,60%,0)");

var oData = {
  "2015": 70.1,
  "2016": 72.7,
  "2017": 64.5,
  "2018": 56.0,
  "2019": 40.3,
  "2020": 38.4,
  "2021": 35.7,
  "2022": 26.0
};

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
var aStep = (chartHeight - 50) / (vData);

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
      y: A.y + 25,
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
  "day": "1월",
  "2021년": 87.65,
  "2022년": 65.67,
  
}, {
  "day": "2월",
  "2021년": 67.50,
  "2022년": 50.84,
  
}, {
  "day": "3월",
  "2021년": 72.72,
  "2022년": 61.64,
  
}, {
  "day": "4월",
  "2021년": 70.94,
  "2022년": 52.48,
  
}, {
  "day": "5월",
  "2021년": 80.81,
  "2022년": 47.67,
  
}, {
  "day": "6월",
  "2021년": 64.28,
  "2022년": 36.58,
  
}, {
  "day": "7월",
  "2021년": 74.58,
  "2022년": 28.49,
  
}, {
  "day": "8월",
  "2021년": 63.56,
  "2022년": 25.87,
  
}, {
  "day": "9월",
  "2021년": 67.69,
  "2022년": 23.71,
  
}, {
  "day": "10월",
  "2021년": 58.21,
  "2022년": 28.54,
  
}, {
  "day": "11월",
  "2021년": 64.54,
  "2022년": 26.80,
  
}, {
  "day": "12월",
  "2021년": 60.42,
  "2022년": 30.21,
  
}];

chart.dateFormatter.inputDateFormat = "dd";
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.minGridDistance = 60;
dateAxis.startLocation = 0.5;
dateAxis.endLocation = 0.5;
dateAxis.baseInterval = {
  timeUnit: "day",
  count: 1
}

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.tooltip.disabled = true;

var series = chart.series.push(new am4charts.LineSeries());
series.name = "2021년 저수율(%)";
series.dataFields.dateX = "day";
series.dataFields.valueY = "2021년";
// series.tooltipHTML = "<img src='https://www.amcharts.com/lib/3/images/car.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>{valueY.value}</b></span>";
series.tooltipText = "[#000]댐：{valueY.value}[/]";
series.tooltip.background.fill = am4core.color("#FFF");
series.tooltip.getStrokeFromObject = true;
series.tooltip.background.strokeWidth = 3;
series.tooltip.getFillFromObject = false;
series.fillOpacity = 0.6;
series.strokeWidth = 2;
series.stacked = true;

var series2 = chart.series.push(new am4charts.LineSeries());
series2.name = "2022년 저수율(%)";
series2.dataFields.dateX = "day";
series2.dataFields.valueY = "2022년";
// series2.tooltipHTML = "<img src='https://www.amcharts.com/lib/3/images/motorcycle.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>{valueY.value}</b></span>";
series2.tooltipText = "[#000]댐：{valueY.value}[/]";
series2.tooltip.background.fill = am4core.color("#FFF");
series2.tooltip.getFillFromObject = false;
series2.tooltip.getStrokeFromObject = true;
series2.tooltip.background.strokeWidth = 3;
series2.sequencedInterpolation = true;
series2.fillOpacity = 0.6;
series2.stacked = true;
series2.strokeWidth = 2;

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
                             text: '주암댐'
                             }
                         }
                    });
                    
                },
                error : function(){
                    console.log('요청실패');
                }

            });
            
/* 1223 김민석 차트 js 추가 */










