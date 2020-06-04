<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>File Status</title>
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vega@5.8.1"></script>
<script src="https://cdn.jsdelivr.net/npm/vega-lite@4.0.0-beta.12"></script>
<script src="https://cdn.jsdelivr.net/npm/vega-embed@6.1.0"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</head>
<body>
	<h2>Welcome to File Visualization</h2>
	<table>

		<tr>
			<td colspan="2"><input type="button" id="submit" value="Display Json And Flow Chart" /></td>
		</tr>
	</table>
	
	<hr/>
	<div id="displayDiv" style="display:none"><h3>JSON Data returned from Server after processing</h3>
		<div id="processedData"></div>
	</div>
	<div id="barchart"></div>
	<div id="piechart"></div>
	<div id="donutchart"></div>
	<div id="line"></div>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
    <script>
    
    //Code for designed Bar, Piechart and Dount Chart for data Visualization    
    function piechartVega(data){
    	console.log(" now rendering vega ");
    	var piechart ={
    			  "$schema": "https://vega.github.io/schema/vega/v5.json",
    			  "width": 200,
    			  "height": 200,
    			  "autosize": "none",

    			  "data": [
    			    {
    			      "name": "table",
    			      "values": data,
    			      "transform": [
    			        {
    			          "type": "pie",
    			          "field": "statValue" 
    			        }
    			      ]
    			    }
    			  ],

    			  "scales": [
    			    {
    			      "name": "color",
    			      "type": "ordinal",
    			      "domain": {"data": "table", "field": "statName"},
    			      "range": {"scheme": "category20"}
    			    }
    			  ],

    			  "marks": [
    			    {
    			      "type": "arc",
    			      "from": {"data": "table"},
    			      "encode": {
    			        "enter": {
    			          "fill": {"scale": "color", "field": "statName"},
    			          "x": {"signal": "width / 2"},
    			          "y": {"signal": "height / 2"}
    			        },
    			        "update": {
    			          "startAngle": {"field": "startAngle"},
    			          "endAngle": {"field": "endAngle"},     
    			          
    			          "outerRadius": {"signal": "width / 2"}
    			        }
    			      }
    			    }
    			  ]
    			}
        //Placed chart on #piechart div   
    	vegaEmbed('#piechart',piechart);
    	
    }
    
    function donutchartVega(data){
    	//console.log(" now rendering vega ");
    	var donutchart ={
    			  "$schema": "https://vega.github.io/schema/vega/v3.0.json",
    			  "width": 300,
    			  "height": 300,
    			  "autosize": "pad",
    			  "signals": [
    			    {"name": "startAngle", "value": 0},
    			    {"name": "endAngle", "value": 6.29},
    			    {"name": "padAngle", "value": 0},
    			    {"name": "sort", "value": true},
    			    {"name": "strokeWidth", "value": 2},
    			    {
    			      "name": "selected",
    			      "value": "",
    			      "on": [{"events": "mouseover", "update": "datum"}]
    			    }
    			  ],
    			  "data": [
    			    {
    			      "name": "table",
    			      "values": data,
    			      "transform": [
    			        {
    			          "type": "pie",
    			          "field": "statValue",
    			          "startAngle": {"signal": "startAngle"},
    			          "endAngle": {"signal": "endAngle"},
    			          "sort": {"signal": "sort"}
    			        }
    			      ]
    			    },
    			    {
    			      "name": "fieldSum",
    			      "source": "table",
    			      "transform": [
    			        {
    			          "type": "aggregate",
    			          "fields": ["statValue"],
    			          "ops": ["sum"],
    			          "as": ["sum"]
    			        }
    			      ]
    			    }
    			  ],
    			  "legends": [
    			    {
    			      "fill": "color",
    			      "title": "Legends",
    			      "orient": "none",
    			      "padding": {"value": 10},
    			      "encode": {
    			        "symbols": {"enter": {"fillOpacity": {"value": 1}}},
    			        "legend": {
    			          "update": {
    			            "x": {
    			              "signal": "(width / 2) + if(selected && selected.statName == datum.statName, if(width >= height, height, width) / 2 * 1.1 * 0.8, if(width >= height, height, width) / 2 * 0.8)",
    			              "offset": 20
    			            },
    			            "y": {"signal": "(height / 2)", "offset": 50}
    			          }
    			        }
    			      }
    			    }
    			  ],
    			  "scales": [
    			    {"name": "color", "type": "ordinal", "range": {"scheme": "category20"}}
    			  ],
    			  "marks": [
    			    {
    			      "type": "arc",
    			      "from": {"data": "table"},
    			      "encode": {
    			        "enter": {
    			          "fill": {"scale": "color", "field": "statName"},
    			          "x": {"signal": "width / 2"},
    			          "y": {"signal": "height / 2"}
    			        },
    			        "update": {
    			          "startAngle": {"field": "startAngle"},
    			          "endAngle": {"field": "endAngle"},
    			          "padAngle": {
    			            "signal": "if(selected && selected.statName == datum.statName, 0.015, 0.015)"
    			          },
    			          "innerRadius": {
    			            "signal": "if(selected && selected.statName == datum.statName, if(width >= height, height, width) / 2 * 0.45, if(width >= height, height, width) / 2 * 0.5)"
    			          },
    			          "outerRadius": {
    			            "signal": "if(selected && selected.statName == datum.statName, if(width >= height, height, width) / 2 * 1.05 * 0.8, if(width >= height, height, width) / 2 * 0.8)"
    			          },
    			          "opacity": {
    			            "signal": "if(selected && selected.statName !== datum.statName, 1, 1)"
    			          },
    			          "stroke": {"signal": "scale('color', datum.statName)"},
    			          "strokeWidth": {"signal": "strokeWidth"},
    			          "fillOpacity": {
    			            "signal": "if(selected && selected.statName == datum.statName, 0.8, 0.8)"
    			          }
    			        }
    			      }
    			    },
    			    {
    			      "type": "text",
    			      "encode": {
    			        "enter": {"fill": {"value": "#525252"}, "text": {"value": ""}},
    			        "update": {
    			          "opacity": {"value": 1},
    			          "x": {"signal": "width / 2"},
    			          "y": {"signal": "height / 2"},
    			          "align": {"value": "center"},
    			          "baseline": {"value": "middle"},
    			          "fontSize": {"signal": "if(width >= height, height, width) * 0.05"},
    			          "text": {"value": "File Status Stats"}
    			        }
    			      }
    			    },
    			    {
    			      "name": "mark_population",
    			      "type": "text",
    			      "from": {"data": "table"},
    			      "encode": {
    			        "enter": {
    			          "text": {
    			            "signal": "if(datum['endAngle'] - datum['startAngle'] < 0.3, '', format(datum['statValue'] / 1, '.2f'))"
    			          },
    			          "x": {"signal": "if(width >= height, height, width) / 2"},
    			          "y": {"signal": "if(width >= height, height, width) / 2"},
    			          "radius": {
    			            "signal": "if(selected && selected.statName == datum.statName, if(width >= height, height, width) / 2 * 1.05 * 0.65, if(width >= height, height, width) / 2 * 0.65)"
    			          },
    			          "theta": {"signal": "(datum['startAngle'] + datum['endAngle'])/2"},
    			          "fill": {"value": "#FFFFFF"},
    			          "fontSize": {"value": 12},
    			          "align": {"value": "center"},
    			          "baseline": {"value": "middle"}
    			        }
    			      }
    			    }
    			  ]
    			}
		//Placed chart on #donutchart div 
    	vegaEmbed('#donutchart',donutchart);    	
    }
    	
    function barchartVega(data){
    	console.log(" now rendering vega ");
    	var barchart = {
    			  "$schema": "https://vega.github.io/schema/vega/v5.json",
    			  "width": 400,
    			  "height": 200,
    			  "padding": 5,

    			  "data": [
    			    {
    			      "name": "table",
    			      "values": data
    			    }
    			  ],

    			  "signals": [
    			    {
    			      "name": "tooltip",
    			      "value": {},
    			      "on": [
    			        {"events": "rect:mouseover", "update": "datum"},
    			        {"events": "rect:mouseout",  "update": "{}"}
    			      ]
    			    }
    			  ],

    			  "scales": [
    			    {
    			      "name": "xscale",
    			      "type": "band",
    			      "domain": {"data": "table", "field": "statName"},
    			      "range": "width",
    			      "padding": 0.4,
    			      "round": true
    			    },
    			    {
    			      "name": "yscale",
    			      "domain": {"data": "table", "field": "statValue"},
    			      "nice": true,
    			      "range": "height"
    			    }
    			  ],

    			  "axes": [
    			    { "orient": "bottom", "scale": "xscale", "title": "StatName on X-Axis" },
    			    { "orient": "left", "scale": "yscale","title": "StatValue on Y-Axis" }
    			  ],

    			  "marks": [
    			    {
    			      "type": "rect",
    			      "from": {"data":"table"},
    			      "encode": {
    			        "enter": {
    			          "x": {"scale": "xscale", "field": "statName"},
    			          "width": {"scale": "xscale", "band": 1},
    			          "y": {"scale": "yscale", "field": "statValue"},
    			          "y2": {"scale": "yscale", "value": 0}
    			        },
    			        "update": {
    			          "fill": {"value": "steelblue"}
    			        },
    			        "hover": {
    			          "fill": {"value": "red"}
    			        }
    			      }
    			    },
    			    {
    			      "type": "text",
    			      "encode": {
    			        "enter": {
    			          "align": {"value": "center"},
    			          "baseline": {"value": "bottom"},
    			          "fill": {"value": "#333"}
    			        },
    			        "update": {
    			          "x": {"scale": "xscale", "signal": "tooltip.statName", "band": 0.5},
    			          "y": {"scale": "yscale", "signal": "tooltip.statValue", "offset": -2},
    			          "text": {"signal": "tooltip.statValue"},
    			          "fillOpacity": [
    			            {"test": "datum === tooltip", "value": 0},
    			            {"value": 1}
    			          ]
    			        }
    			      }
    			    }
    			  ]
    			}
    	//Placed chart on #barchart div 
    	vegaEmbed('#barchart', barchart);
    	
    }
    function lineChart(data) {
    	console.log("Line Chart");
    	console.log(data);
    	var line= {
    		  "$schema": "https://vega.github.io/schema/vega/v5.json",
    		  "width": 500,
    		  "height": 200,
    		  "padding": 5,

    		  "signals": [
    		    {
    		      "name": "interpolate",
    		      "value": "linear",
    		      "bind": {
    		        "input": "select",
    		        "options": [
    		          "basis",
    		          "cardinal",
    		          "catmull-rom",
    		          "linear",
    		          "monotone",
    		          "natural",
    		          "step",
    		          "step-after",
    		          "step-before"
    		        ]
    		      }
    		    }
    		  ],

    		  "data": [
    		    {
    		      "name": "table",
    		       //"values": data
    		      "values": [
    		        {"statName": 0, "statValue": 116457, "x":0}, {"statName": 0, "statValue": 106457, "x":1},
    		        {"statName": 1, "statValue": 86457, "x":0}, {"statName": 1, "statValue": 76457, "x":1},
    		        {"statName": 5, "statValue": 136457, "x":0},  {"statName": 9, "statValue": 126457, "x":1}
    		      ]
    		    }
    		  ],

    		  "scales": [
    		    {
    		      "name": "statName",
    		      "type": "point",
    		      "range": "width",
    		      "domain": {"data": "table", "field": "statName"}
    		    },
    		    {
    		      "name": "statValue",
    		      "type": "linear",
    		      "range": "height",
    		      "nice": true,
    		      "zero": true,
    		      "domain": {"data": "table", "field": "statValue"}
    		    },
    		    {
    		      "name": "color",
    		      "type": "ordinal",
    		      "range": "category",
    		      "domain": {"data": "table", "field": "x"}
    		    }
    		  ],

    		  "axes": [
    		    {"orient": "bottom", "scale": "statName"},
    		    {"orient": "left", "scale": "statValue"}
    		  ],

    		  "marks": [
    		    {
    		      "type": "group",
    		      "from": {
    		        "facet": {
    		          "name": "series",
    		          "data": "table",
    		          "groupby": "x"
    		        }
    		      },
    		      "marks": [
    		        {
    		          "type": "line",
    		          "from": {"data": "series"},
    		          "encode": {
    		            "enter": {
    		              "x": {"scale": "statName", "field": "statName"},
    		              "y": {"scale": "statValue", "field": "statValue"},
    		              "stroke": {"scale": "color", "field": "x"},
    		              "strokeWidth": {"value": 2}
    		            },
    		            "update": {
    		              "interpolate": {"signal": "interpolate"},
    		              "fillOpacity": {"value": 1}
    		            },
    		            "hover": {
    		              "fillOpacity": {"value": 0.5}
    		            }
    		          }
    		        }
    		      ]
    		    }
    		  ]
    		}
    	vegaEmbed('#line', line);
    	}
    //Implement the jquery and ajax to retreive the data 
    
    
    
	jQuery(document).ready(function($) {

		$("#submit").click(function(){
			var contactDetails = {};
			var token="eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOlsiYWRtaW4iXSwiaWF0IjoxNTc1NDU1NzA5LCJleHAiOjE1NzU1NDIxMDl9.ZlEuIvnmoNQFFHCQ0U8lyufuA_B-eRyu1H7m1qs9sws";
			$.ajax({
				type : "GET",
				contentType : "application/json",
				//url : "postEmployee",
				url:"http://10.213.11.11:8080/digi-frontend/dashboard/file/stats",
				//data : JSON.stringify(employeeData),
				headers: {
					"Authorization": "Bearer " + token
				},
				dataType : 'json',				
				success : function(data) {
					//alert("Get data Successfully");
					console.log(data);
					statuses = {"1":"NEW", "2": "Checkout", "3":"InProcess", 
							"4":"Released", "5":"Pending", 
							"6":"DEO-Finish", "7":"Val-Inprocess",
							"8":"Val-Lock", "9":"Val-Finish"};
					data = data.map((d) => {
						console.log(d);
						d.statusVal = statuses[d.statusVal];
						return d;
					});
					console.log(data);
					//contactDetails = data;
					//console.log(contactDetails);
					barchartVega(data);
					console.log(data);
					piechartVega(data);
					donutchartVega(data);
					lineChart(data);
					//piechartVega2(contactDetails);
					//lineAndbarVega(contactDetails);
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

  </body>
  </html>