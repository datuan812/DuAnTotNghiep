// var getDatePart = function (date) {
//     var datestr = date + '';
//     return datestr.split('T')[0];
// }
// function convertMillisecondsToFormattedDate(milliseconds) {
//     return Highcharts.dateFormat('%d/%m/%Y', milliseconds);
// }
// $.ajax({
//     url: '/api/hoadon/thongkedssp',
//     method: 'GET',
//     success: function (data) {
//
//
//     }
//
//         })
//


// let ArmsIndex = new Highcharts.Chart("ArmsIndex", {
//     chart: {
//         events: {
//             load() {
//                 const chart = this,
//                     startDate = Date.parse(getDatePart(data.startDate)),
//                     endDate = Date.parse(getDatePart(data.endDate))
//
//                 chart.xAxis[0].setExtremes(startDate, endDate)
//             }
//         }
//     },
//     rangeSelector: {
//         enable: true,
//         buttonTheme: {
//             fill: 'none',
//             stroke: 'none',
//             'stroke-width': 0,
//             r: 8,
//             style: {
//                 color: '#01579b',
//                 fontWeight: 'bold'
//             },
//             states: {
//                 hover: {
//                 },
//                 select: {
//                     fill: '#01579b',
//                     style: {
//                         color: 'white'
//                     }
//                 }
//             }
//         },
//         inputBoxBorderColor: 'gray',
//         inputBoxWidth: 120,
//         inputBoxHeight: 18,
//         inputStyle: {
//             color: '#01579b',
//             fontWeight: 'bold'
//         },
//         labelStyle: {
//             color: '#01579b',
//             fontWeight: 'bold'
//         },
//         inputEnabled: true,
//         inputDateFormat: '%d/%m/%Y'
//     },
//     title: {
//         text: "ARMs Index",
//         align: "center",
//         y: 40,
//         style: {
//             color: "#666666"
//         }
//     },
//     yAxis: [
//         {
//             height: "100%",
//             title: null,
//             gridLineWidth: 0,
//             labels: {
//                 formatter: function () {
//                     let label = this.axis.defaultLabelFormatter.call(this);
//                     if (label == 0) {
//                         return "-";
//                     }
//                     return parseFloat(label).toFixed(1);
//                 }
//             },
//             //maxPadding: 3
//         },
//         {
//             height: "100%",
//             opposite: true,
//             title: null,
//             gridLineWidth: 0,
//             labels: {
//                 formatter: function () {
//                     let label = this.axis.defaultLabelFormatter.call(this);
//                     if (label == 0) {
//                         return "-";
//                     }
//                     return label;
//                 }
//             }
//         }
//     ],
//     exporting: { enabled: false },
//     credits: { enabled: false },
//     navigator: { enabled: true },
//     xAxis: {
//         type: "datetime",
//         dateTimeLabelFormats: {
//             day: "%e-%b"
//         }
//     },
//
//     legend: {
//         enabled: false
//     },
//
//     //plotOptions: {
//     //    series: {
//     //        label: {
//     //            connectorAllowed: false,
//     //            enabled: false
//     //        }
//     //    }
//     //},
//     tooltip: {
//         split: false,
//         shared: true,
//         xDateFormat: "Ngày: %d/%m/%Y",
//         pointFormat:
//             '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> {point.change}<br/>',
//         //valueDecimals: 1
//     },
//     series: [
//         {
//             name: "Arms Index",
//             color: "#66a2d8",
//             type: "line",
//             lineWidth: 2,
//             marker: { enabled: false },
//             data: armarr,
//             yAxis: 0
//         },
//         {
//             name: chiso,
//             color: "#91ca57",
//             type: "line",
//             lineWidth: 2,
//             marker: { enabled: false },
//             data: indexarr,
//             yAxis: 1
//         },
//     ]
// });