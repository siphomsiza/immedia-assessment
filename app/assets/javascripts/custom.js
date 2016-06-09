var LocalFormPlugins = function () {
  "use strict";
  return {
    //main function
    init: function () {
      $('.datepicker-default').datepicker({
        todayHighlight: true,
        format: "dd/mm/yyyy",
        endDate: new Date()
      });
      $(".default-select2").select2();
    }
  };
}();
