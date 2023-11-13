var path=$("#path").attr("path");
$(function() {
	var title = {
		text : 'Bill chart of the last 12 months'
	};
	var subtitle = {
		text : 'CHANGEX'
	};
	var xAxis = {
		categories : ['January',
			'February',
			'March',
			'April',
			'May',
			'June',
			'July',
			'August',
			'September',
			'October',
			'November',
			'December']
	};
	var yAxis = {
		title : {
			text : 'Money Amount (\$)'
		},
		plotLines : [ {
			value : 0,
			width : 1,
			color : '#808080'
		} ]
	};

	var tooltip = {
		valueSuffix : '\Dollar'
	}

	var legend = {
		layout : 'vertical',
		align : 'right',
		verticalAlign : 'middle',
		borderWidth : 0
	};

	var series = [
			{
				name : 'Last 12 months billing curve',
				data : [ 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3,
						18.3, 13.9, 9.6 ]
			},
	 ];

	var json = {};
	json.title = title;
	json.subtitle = subtitle;
	json.xAxis = xAxis;
	json.yAxis = yAxis;
	json.tooltip = tooltip;
	json.legend = legend;
	json.series = series;
	$("#monthChart").highcharts(json);
});
$(function(){
	var title = {
			text : 'Bill chart for the last 5 years'
		};
		var subtitle = {
			text : 'Source: xxxx.com'
		};
		var xAxis = {
			categories : [ 'January',
				'February',
				'March',
				'April',
				'May' ]
		};
		var yAxis = {
			title : {
				text : 'Money Amount (\$)'
			},
			plotLines : [ {
				value : 0,
				width : 1,
				color : '#808080'
			} ]
		};

		var tooltip = {
			valueSuffix : '\$'
		}

		var legend = {
			layout : 'vertical',
			align : 'right',
			verticalAlign : 'middle',
			borderWidth : 0
		};

		var series = [
			
				{
					name : 'London',
					data : [ 3.9, 4.2, 5.7, 8.5, 11.9 ]
				} ];

		var json = {};
		json.title = title;
		json.subtitle = subtitle;
		json.xAxis = xAxis;
		json.yAxis = yAxis;
		json.tooltip = tooltip;
		json.legend = legend;
		json.series = series;
		$("#yearChart").highcharts(json);
});







