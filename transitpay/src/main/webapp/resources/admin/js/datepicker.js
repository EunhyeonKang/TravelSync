$(function () {
  $(".startDate_TP").datepicker({
    dateFormat: "yy-mm-dd",
    minDate: 0,
    onSelect: function () {
      var TP_datepickerEnd = $(".endDate_TP");
      var startDate = $(this).datepicker("getDate");
      var minDate = $(this).datepicker("getDate");
      var TP_datepickerEndDate = TP_datepickerEnd.datepicker("getDate");
      //difference in days. 86400 seconds in day, 1000 ms in second
      var dateDiff = (TP_datepickerEndDate - minDate) / (86400 * 1000);

      startDate.setDate(startDate.getDate() + 14);
      if (TP_datepickerEndDate == null || dateDiff < 0) {
        TP_datepickerEnd.datepicker("setDate", minDate);
      } else if (dateDiff > 7) {
        TP_datepickerEnd.datepicker("setDate", startDate);
      }
      //sets TP_datepickerEnd maxDate to the last day of 30 days window
      TP_datepickerEnd.datepicker("option", "maxDate", startDate);
      TP_datepickerEnd.datepicker("option", "minDate", minDate);
    },
  });

  $(".endDate_TP").datepicker({
    dateFormat: "yy-mm-dd",
    minDate: 0,
  });

});
