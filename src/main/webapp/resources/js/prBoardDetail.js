/**
 * 
 */
 
 
// productQuantity
 $('.minus').on('click', function() {

			var amount = parseInt($(this).next().val());
			var price = $('#productPrice').text();
			price = parseInt(price.replace(/(,|원)/g, ""));
			console.log(price);
			if (amount > 0) {
				amount = parseInt(amount) - 1;
				$(this).next().val(amount);
				var totalPrice = amount * price;
				$('#totalPrice').val(totalPrice);
				localeTotal = totalPrice.toLocaleString('ko-KR') + "원";
				$('#totalPriceText').text(localeTotal);
			}

		});

		$('.plus').on('click', function() {
			var amount = parseInt($(this).prev().val());
			var price = $('#productPrice').text();
			price = parseInt(price.replace(/(,|원)/g, ""));

			if (amount >= 0) {
				amount = parseInt(amount) + 1;
				$(this).prev().val(amount);
				var totalPrice = amount * price;
				console.log(totalPrice);
				$('#totalPrice').val(totalPrice);
				localeTotal = totalPrice.toLocaleString('ko-KR') + "원";
				$('#totalPriceText').text(localeTotal);
			}
		});

// scrab




 
 
 
// highChart 
 	var data = [ 1.3, 2.1, 3.4, 4.5, 5 ];

			data.forEach(function(element, index) {
				if (element.value === 0) {
					data[index] = null;
				}
			});

			Highcharts.chart('chart4', {
				chart : {
					type : "area",
					polar : true,
					// 		    width: 280,
					height : 280,

				},
				xAxis : {
					min : 0.5,
					max : 5.5,
					categories : [ '매운맛', '짠맛', '신맛', '쓴맛', '단맛' ],
					labels : {
						distance : 2,
						style : {
							color : 'red',
							fontSize : "11px",
							fontWeight : "bold"
						}

					},
					tickmarkPlacement : "on",
					lineWidth : 0,
					gridLineColor : "",
					title : {
						"style" : {
							"fontFamily" : "\"Lucida Grande\", \"Lucida Sans Unicode\", Verdana, Arial, Helvetica, sans-serif",
							"color" : "#666666",
							"fontSize" : "10px",
							"fontWeight" : "bold",
							"fontStyle" : "normal"
						}
					}
				},
				yAxis : {
					// 		    plotBands: [{
					// 		      from: 1,
					// 		      to: 2,
					// 		      color: "#f8c4c0",
					// 		      outerRadius: "105%",
					// 		      thickness: "50%"
					// 		    }, {
					// 		      from: 2,
					// 		      to: 3,
					// 		      color: "#f39d96",
					// 		      outerRadius: "105%",
					// 		      thickness: "50%"
					// 		    }, {
					// 		      from: 3,
					// 		      to: 4,
					// 		      color: "#ee766d",
					// 		      outerRadius: "105%",
					// 		      thickness: "50%"
					// 		    }, {
					// 		      from: 4,
					// 		      to: 5,
					// 		      color: "#eb584d",
					// 		      outerRadius: "105%",
					// 		      thickness: "50%"
					// 		    }],
					plotBands : [ {
						from : 1,
						to : 2,
						color : "rgba(248, 196, 192, 0.9)",
						outerRadius : "105%",
						thickness : "50%"
					}, {
						from : 2,
						to : 3,
						color : "rgba(243, 157, 150, 0.9)",
						outerRadius : "105%",
						thickness : "50%"
					}, {
						from : 3,
						to : 4,
						color : "rgba(238, 118, 109, 0.9)",
						outerRadius : "105%",
						thickness : "50%"
					}, {
						from : 4,
						to : 5,
						color : "rgba(235, 88, 77, 0.9)",
						outerRadius : "105%",
						thickness : "50%"
					} ],
					reversed : false,
					min : 0,
					max : 5,
					allowDecimals : true,
					tickInterval : 1,
					tickAmount : 6,
					tickLength : 10,
					gridLineInterpolation : "polygon",
					gridLineColor : "",
					lineWidth : 0,
					tickmarkPlacement : "between",
					tickPixelInterval : 100,
					tickPosition : "outside",
					labels : {
						enabled : false,
					}
				},
				title : {
					"text" : ""
				},
				series : [ {
					name : "맛",
					data : data,
				} ],
				responsive : {
					rules : [ {
						condition : {
							maxWidth : 300,
						}
					} ]
				},
				plotOptions : {
					series : {
						animation : true,
						lineWidth : 1,
						color : "rgba(255, 237, 211, 0.8)",
						fillOpacity : 0.6,
						marker : {
							radius : 1.2,
							symbol : "circle"
						},

						_colorIndex : 0,
						_symbolIndex : 0
					}
				},
				legend : {
					enabled : false
				},
				exporting : {
					enabled : false
				},
				credits : {
					enabled : false
				},
				colors : [ "#7cb5ec", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#2b908f", "#f45b5b", "#91e8e1" ]
			});