<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>File Status</title>
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src = "https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>



</head>
<body>
    
    
    <h2>Welcome to High chart Visualization</h2>
	<table>

		<tr>
			<td colspan="2"><input type="button" id="submit" value="Display Json And Flow Chart" /></td>
		</tr>
	</table>
	
	<hr/>
	
	<style>
	#watermark{	
	position: fixed;
	top: 50%;
	left: 300px;
	transform: rotate(310deg);
	transform-origin: 35% 65%;
	opacity: .2;
	font-size: 70px;
	color: black;
	width: 1100px;
	text-align: left;
	background-color: gray;
    }
	#containerline { float:left; width:400px; height:500px; }
	#container{ float:right; width:400px; height:500px; }
	#containerpie { float:right; width:600px; height:500px;}
	#containerCombine { float:left; width:400px; height:500px; }
	#containerseries { float:right; width:400px; height:500px; }
	#containerdonut { float:right; width:600px; height:500px; }
	#container3d { float:left; width:600px; height:500px; }
	#containerMultiLine {min-width: 300px;max-width: 800px;height: 300px;margin: 1em auto;
}
	
	
	</style>
	
	<div id="displayDiv" style="display:none"><h3>JSON Data returned from Server after processing</h3>
	<div id="processedData"></div>
	</div>
	<div id = "containerline"></div>
	<div id = "container"></div>
	<div id = "containerpie"></div>
	<div id = "containerCombine"></div>
	<div id = "containerseries"></div>
	<div id = "containerdonut"></div>
	<div id = "container3d"></div>
	<div id="containerMultiLine"></div>
	<div id="watermark">Data Visualization Charts</div>
	
    <script>
    function highchart(statusArr) {
    	Highcharts.chart('container', {
    	    chart: {
    	        type: 'column'
    	    },
    	    title: {
    	        text: 'Data Visualization Bar Chart'
    	    },
    	    subtitle: {
    	        text: 'Source: <a href="https://en.wikipedia.org/wiki/World_population">Wikipedia.org</a>'
    	    },
    	    xAxis: {
    	        categories: ['New', 'Checkout', 'InProcess', 'Released', 'Pending', 'DEO-Finish','Val-Inprocess', 'Val-Lock', 'Val-Finish'],
    	        title: {
    	            text: null
    	        }
    	    },
    	    yAxis: {
    	        min: 0,
    	        title: {
    	            text: 'File Status',
    	            align: 'high'
    	        },
    	        labels: {
    	            overflow: 'justify'
    	        }
    	    },
    	    tooltip: {
    	        valueSuffix: ''
    	    },
    	    plotOptions: {
    	        bar: {
    	            dataLabels: {
    	                enabled: true
    	            }
    	        }
    	    },
    	    legend: {
    	        layout: 'vertical',
    	        align: 'right',
    	        verticalAlign: 'bottom',
    	        x: -40,
    	        y: 80,
    	        floating: true,
    	        borderWidth: 1,
    	        backgroundColor:
    	            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
    	        shadow: true
    	    },
    	    credits: {
    	        enabled: false
    	    },
    	    series: [{
    	        //data: [107, 31, 635, 203, 2,200,256,54,85]
    	    	name : 'FileStats',
    	    	data: statusArr
    	    }]
    	});
    }
    
    function MultiLinehighchart(statusArr) {

    	const chart = Highcharts.chart('containerMultiLine', {
    	  title: {
    	    text: 'Monthly Average Temperature',
    	    x: -20 //center
    	  },
    	  subtitle: {
    	    text: 'Source: WorldClimate.com',
    	    x: -20
    	  },
    	  xAxis: {
    	    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    	      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    	    ]
    	  },
    	  yAxis: {
    	    title: {
    	      text: 'Temperature (°C)'
    	    },
    	    plotLines: [{
    	      value: 0,
    	      width: 1,
    	      color: '#808080'
    	    }]
    	  },
    	  tooltip: {
    	    valueSuffix: '°C'
    	  },
    	  legend: {
    	    layout: 'vertical',
    	    align: 'right',
    	    verticalAlign: 'middle',
    	    borderWidth: 0,
    	    showInLegend: false
    	  },
    	  series: [{
    	    marker: {
    	      fillColor: 'transparent',
    	      lineColor: Highcharts.getOptions().colors[0]
    	    },
    	    data: [0.1,0.2,0.8,0.4,0.5,0.3,0.4,0.5,0.6,0.7,0.8,0.9]
    	  }, {
    	    marker: {
    	      fillColor: 'transparent'
    	    },
    	    data: [0.9,0.8,0.7,0.6,0.5,0.4,0.2,0.1,0.6,0.7,0.8,0.9]
    	  }, {

    	   data: [0.5,0.6,0.7,0.8,0.9,0.1,0.2,0.3,0.4,0.7,0.8,0.9]
    	  }, {
    	    lineColor: 'red',
    	    data: [0.15,0.26,0.88,0.48,0.58,0.39,0.49,0.59,0.67,0.78,0.89,0.9]
    	  }]
    	})
    	
    }
    
    //Line high chart
    function highlinechart(statusArr) {
    var chart = Highcharts.chart('containerline', {
    	title: {
	        text: 'Data Visualization Line Chart'
	    },
	    subtitle: {
	        text: 'Source: <a href="https://en.wikipedia.org/wiki/World_population">Wikipedia.org</a>'
	    },
    xAxis: {
        categories: ['New', 'Checkout', 'InProcess', 'Released', 'Pending', 'DEO-Finish','Val-Inprocess', 'Val-Lock', 'Val-Finish'],
        title: {
            text: 'File Status',
            align: 'high'
        },
        labels: {
            overflow: 'justify'
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Total Count',
            align: 'high'
        },
        labels: {
            overflow: 'justify'
        }
    },
    plotOptions: {
        series: {
            allowPointSelect: true
        }
    },
    series: [{
    	name : 'FileStats',
        data: statusArr
    }]
	});
    }
    
    //Pie Chart
    function piechart(statusArr){
    var chart = Highcharts.chart('containerpie', {
  	chart: {
  	type: 'pie'
  	},
  	title: {
    text: 'Data Visualization Pie Chart'
  	},
  	subtitle: {
    text: 'Source: <a href="https://en.wikipedia.org/wiki/World_population">Wikipedia.org</a>'
  	},
 	xAxis: {
	categories: ['New', 'Checkout', 'InProcess', 'Released', 'Pending', 'DEO-Finish','Val-Inprocess', 'Val-Lock', 'Val-Finish'],
    title: {
    text: null
    }
  	},
  	yAxis: {
    min: 0,
    title: {
    text: 'File Status',
    align: 'high'
    },
    labels: {
    overflow: 'justify'
    }
  	},
  	tooltip: {
    valueSuffix: ''
  	},
  	plotOptions: {
    bar: {
    dataLabels: {
    enabled: true
    }
    },
    pie: {
    dataLabels: {
    formatter: function() {
    var sliceIndex = this.point.index;
    var sliceName = this.series.chart.axes[0].categories[sliceIndex];
    return sliceName
    }
    }
    }
  	},
  	legend: {
    layout: 'vertical',
    align: 'right',
    verticalAlign: 'top',
    x: -40,
    y: 80,
    floating: true,
    borderWidth: 1,
    backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
    shadow: true
  	},
  	credits: {
    enabled: false
  	},
  	series: [{
    name: 'FileStat',
    data: statusArr
  	}]
	});
    }
    
    //Combine High  Chart
    
    function combinechart(statusArr){
    Highcharts.chart('containerCombine', {
    title: {
        text: 'Combination chart'
    },
    xAxis: {
       categories: ['New', 'Checkout', 'InProcess', 'Released', 'Pending', 'DEO-Finish','Val-Inprocess', 'Val-Lock', 'Val-Finish']
    },
    labels: {
        items: [{
            html: 'Total Count File Stats',
            style: {
                left: '50px',
                top: '18px',
                color: ( // theme
                    Highcharts.defaultOptions.title.style &&
                    Highcharts.defaultOptions.title.style.color
                ) || 'black'
            }
        }]
    },
    series: [{
        type: 'column',
        name: 'File Stats',
        data: statusArr
    }, {
        type: 'spline',
        name: 'Average',
        data: statusArr,
        marker: {
            lineWidth: 2,
            lineColor: Highcharts.getOptions().colors[3],
            fillColor: 'white'
        }
    }, {
        type: 'pie',
        name: 'File Stat',
        data: statusArr,
        center: [100, 80],
        size: 100,
        showInLegend: false,
        dataLabels: {
            enabled: false
        }
    }]
});
    }
    
    // Series Chart
    function serieschart(newArr,CheckoutArr,InProcessArr,ReleasedArr,PendingArr,DEOFinishArr,ValInprocessArr,ValLockArr,ValFinishArr){
    Highcharts.chart('containerseries', {
        
        chart: {
            
            type: 'column'
        },
    title: {
        text: 'Series Chart '
    },

    subtitle: {
        text: 'Source: thesolarfoundation.com'
    },

    yAxis: {
        title: {
            text: 'File Counts'
        }
    },

    xAxis: {
        accessibility: {
            rangeDescription: 'Range: 2019 to 2020'
        }
    },

    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            },
            pointStart: 2019
        }
    },

    series: [{
        name: 'New',
        data: newArr
    }, {
        name: 'Checkout',
        data: CheckoutArr
    }, {
        name: 'InProcess',
        data: InProcessArr
    }, {
        name: 'Released',
        data: ReleasedArr
    }, {
        name: 'Pending',
        data: PendingArr
    },
    {
        name: 'DEO-Finish',
        data: DEOFinishArr
    },
    {
        name: 'Val-Inprocess',
        data: ValInprocessArr
    },
    {
        name: 'Val-Lock',
        data: ValLockArr
    },
    {
        name: 'Val-Finish',
        data: ValFinishArr
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }

});
    }
    //Donut High Chart
    
    function donutchart(newArr,CheckoutArr,InProcessArr,ReleasedArr,PendingArr,DEOFinishArr,ValInprocessArr,ValLockArr,ValFinishArr){
    console.log("Here is donut chart");
    var colors = Highcharts.getOptions().colors,
    categories = ['New', 'Checkout', 'InProcess', 'Released', 'Pending', 'DEO-Finish','Val-Inprocess', 'Val-Lock', 'Val-Finish'],
    data = [
        {
            y: 62.74,
            color: colors[2],
            drilldown: {
                name: 'New',
                categories: [
                    'New'
                   ],
                data: newArr       
                
            }
        },
        {
            y: 10.57,
            color: colors[1],
            drilldown: {
                name: 'Checkout',
                categories: [
                    'Checkout'
                   
                ],
                data: CheckoutArr
            }
        },
        {
            y: 7.23,
            color: colors[0],
            drilldown: {
                name: 'InProcess',
                categories: [
                    'InProcess'
                    
                ],
                data: InProcessArr
            }
        },
        {
            y: 5.58,
            color: colors[3],
            drilldown: {
                name: 'Released',
                categories: [
                    'Released'
                ],
                data: ReleasedArr
            }
        },
        {
            y: 4.02,
            color: colors[5],
            drilldown: {
                name: 'Pending',
                categories: [
                    'Pending'
                ],
                data:PendingArr
            }
        },
        {
            y: 1.92,
            color: colors[4],
            drilldown: {
                name: 'DEO-Finish',
                categories: [
                    'DEO-Finish'
                ],
                data: DEOFinishArr
            }
        },
        {
            y: 7.62,
            color: colors[6],
            drilldown: {
                name: 'Val-Inprocess',
                categories: [
                    'Val-Inprocess'
                ],
                data: ValInprocessArr
            }
        },
        {
            y: 7.62,
            color: colors[6],
            drilldown: {
                name: 'Val-Lock',
                categories: [
                    'Val-Lock'
                ],
                data: ValLockArr
            }
        },
        {
            y: 7.62,
            color: colors[6],
            drilldown: {
                name: 'Val-Finish',
                categories: [
                    'Val-Finish'
                ],
                data: ValFinishArr
            }
        }
    ],
    browserData = [],
    versionsData = [],
    i,
    j,
    dataLen = data.length,
    drillDataLen,
    brightness;


// Build the data arrays
for (i = 0; i < dataLen; i += 1) {

    // add browser data
    browserData.push({
        name: categories[i],
        y: data[i].y,
        color: data[i].color
    });

    // add version data
    drillDataLen = data[i].drilldown.data.length;
    for (j = 0; j < drillDataLen; j += 1) {
        brightness = 0.09 - (j / drillDataLen) / 5;
        versionsData.push({
            name: data[i].drilldown.categories[j],
            y: data[i].drilldown.data[j],
            color: Highcharts.Color(data[i].color).brighten(brightness).get()
        });
    }
// Create the chart
Highcharts.chart('containerdonut', {
    chart: {
        type: 'pie'
    },
    title: {
        text: 'Data Visualization Donut Chart'
    },
    subtitle: {
        text: 'Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
    },
    plotOptions: {
        pie: {
            shadow: false,
            center: ['50%', '50%']
        }
    },
    tooltip: {
        valueSuffix: '%'
    },
    series: [{
        name: 'FileStat',
        data: browserData,
        size: '60%',
        dataLabels: {
            formatter: function () {
                return this.y > 5 ? this.point.name : null;
            },
            color: '#ffffff',
            distance: -30
        }
    },
    {
        name: 'FileStats',
        data: versionsData,
        size: '80%',
        innerSize: '60%',
        dataLabels: {
            formatter: function () {
                // display only if larger than 1
                return this.y > 1 ? '<b>' + this.point.name + ':</b> ' +
                    this.y + '' : null;
            }
        },
        id: 'versions'
    }],
    responsive: {
        rules: [{
            condition: {
                maxWidth: 400
            },
            chartOptions: {
                series: [{
                }, {
                    id: 'versions',
                    dataLabels: {
                        enabled: false
                    }
                }]
            }
        }]
    }
    
});
}}
    
    function donut3dchart(formattedArray){
    	
    	console.log("Here is 3d donut chart");
    	Highcharts.chart('container3d', {
    	    chart: {
    	        type: 'pie',
    	        options3d: {
    	            enabled: true,
    	            alpha: 45
    	        }
    	    },
    	    title: {
    	        text: 'Contents of Highsoft\'s weekly fruit delivery'
    	    },
    	    subtitle: {
    	        text: '3D donut in Highcharts'
    	    },
    	    plotOptions: {
    	        pie: {
    	            innerSize: 100,
    	            depth: 45
    	        }
    	    },
    	    series: [{
    	        name: 'Delivered amount',
    	        data: formattedArray
    	    }]
    	});
    }
    
    
    
    
    
	jQuery(document).ready(function($) {

	$("#submit").click(function(){
	var contactDetails = {};
	//var token="eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOlsiYWRtaW4iXSwiaWF0IjoxNTc1NDU1NzA5LCJleHAiOjE1NzU1NDIxMDl9.ZlEuIvnmoNQFFHCQ0U8lyufuA_B-eRyu1H7m1qs9sws";
	$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "postFileChartView",
			//url:"http://10.213.11.11:8080/digi-frontend/dashboard/file/stats",
			data : JSON.stringify(contactDetails),
			//headers: {
			//	"Authorization": "Bearer " + token
			//},
			dataType : 'json',				
			success : function(data) {
				//alert("Get data Successfully");
				//console.log(data);
				statuses = {"1":'NEW', "2": "Checkout", "3":"InProcess", 
							"4":"Released", "5":"Pending", 
							"6":"DEO-Finish", "7":"Val-Inprocess",
							"8":"Val-Lock", "9":"Val-Finish"};
				data = data.map((d) => {
					console.log(d);
					d.statusVal = statuses[d.statusVal];
					return d;
					});
				
				var jsonString=JSON.stringify(data);
				//console.log(jsonString);
				var jsonArr=JSON.parse(jsonString);
				var statusArr=jsonArr.map(a=>parseInt(a.status));
				console.log(statusArr);
				contactDetails = data;				
				var formattedArray = data.map(i => [i.statusVal,i.status]);
				//var jsonString=JSON.stringify(formattedArray);
				//var jsonArr=JSON.parse(jsonString);

				console.log(formattedArray);
				
				
				//Arrange data for Series High Chart
				var newArr =[];
				newArr[0] = new Array(1);
				newArr[0] = statusArr[0];
				console.log(newArr);
				
				var CheckoutArr =[];
				CheckoutArr[0] = new Array(1);
				CheckoutArr[0] = statusArr[1];
				console.log(CheckoutArr);
				
				var InProcessArr =[];
				InProcessArr[0] = new Array(1);
				InProcessArr[0] = statusArr[2];
				console.log(InProcessArr);
				
				var ReleasedArr =[];
				ReleasedArr[0] = new Array(1);
				ReleasedArr[0] = statusArr[3];
				console.log(ReleasedArr);
				
				var PendingArr =[];
				PendingArr[0] = new Array(1);
				PendingArr[0] = statusArr[4];
				console.log(PendingArr);
				
				var DEOFinishArr =[];
				DEOFinishArr[0] = new Array(1);
				DEOFinishArr[0] = statusArr[5];
				console.log(DEOFinishArr);
				
				var ValInprocessArr =[];
				ValInprocessArr[0] = new Array(1);
				ValInprocessArr[0] = statusArr[6];
				console.log(ValInprocessArr);
				
				var ValLockArr =[];
				ValLockArr[0] = new Array(1);
				ValLockArr[0] = statusArr[7];
				console.log(ValLockArr);
				
				var ValFinishArr =[];
				ValFinishArr[0] = new Array(1);
				ValFinishArr[0] = statusArr[8];
				console.log(ValFinishArr);
				
				//console.log(contactDetails);
				//console.log(newData);
					
				highchart(statusArr);
				highlinechart(statusArr);
				MultiLinehighchart(statusArr);
				piechart(statusArr);
				combinechart(statusArr);
				serieschart(newArr,CheckoutArr,InProcessArr,ReleasedArr,PendingArr,DEOFinishArr,ValInprocessArr,ValLockArr,ValFinishArr);
				donutchart(newArr,CheckoutArr,InProcessArr,ReleasedArr,PendingArr,DEOFinishArr,ValInprocessArr,ValLockArr,ValFinishArr);
				donut3dchart(formattedArray);
				//var newStat =[];
				//newStat = statusArr[0];
				//console.log(newStat);
        			
				$('#processedData').html(JSON.stringify(data));
				$('#displayDiv').show();
				},
				error: function(result){
				alert("Something is wrong");
				}
				});		    
		
				});	 
			});		  
		
  </script>	
  </div>
  </body>
  </html>