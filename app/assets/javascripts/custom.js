window.onerror = function(errorMsg) {
	$('#console').html($('#console').html()+'<br>'+errorMsg)
}*/
$('#datetimepicker').datetimepicker({
dayOfWeekStart : 1,
lang:'en',
mask:'9999/19/39 29:59'

});





  $('#calendar').fullCalendar({
    events: '/bookings.json',
    eventLimit: true, 
    header: {
				left: 'prev,next today',
				center: 'title',s
				right: 'month,agendaWeek,agendaDay'
			}
  });

