// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/
//
// // <script>
//
//
// $(document).ready(function() {
//   var ctx = document.getElementById("myChart");
//   var myChart = new Chart(ctx, {
//     type: 'bar',
//     data: {
//       labels: '<%= @inv_item_names.join(" ") %>'.split(' '),
//       datasets: [{
//         label: 'Item quantity',
//         data: <%= @inv_item_qts %>,
//         backgroundColor: [
//           'rgba(255, 99, 132, 0.2)',
//           'rgba(54, 162, 235, 0.2)',
//           'rgba(255, 206, 86, 0.2)',
//           'rgba(75, 192, 192, 0.2)',
//           'rgba(153, 102, 255, 0.2)',
//           'rgba(255, 159, 64, 0.2)'
//         ],
//         borderColor: [
//           'rgba(255,99,132,1)',
//           'rgba(54, 162, 235, 1)',
//           'rgba(255, 206, 86, 1)',
//           'rgba(75, 192, 192, 1)',
//           'rgba(153, 102, 255, 1)',
//           'rgba(255, 159, 64, 1)'
//         ],
//         borderWidth: 1
//       }]
//     },
//     options: {
//       legend: {
//         labels: {
//           // This more specific font property overrides the global property
//           // fontSize: 19
//         }
//       },
//       scales: {
//         yAxes: [{
//           display: true,
//           ticks: {
//             beginAtZero: true,
//           }
//         }]
//       }
//     }
//   });
// });
//
//
//
//
//
//
//
//
//
//
//
//
// // </script>
