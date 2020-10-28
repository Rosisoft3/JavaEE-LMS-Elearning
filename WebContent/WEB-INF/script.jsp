<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<!-- jQuery 2.1.3 -->
	<script src=" plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src=" bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- InputMask -->
	<script src=" plugins/input-mask/jquery.inputmask.js"
		type="text/javascript"></script>
	<script src=" plugins/input-mask/jquery.inputmask.date.extensions.js"
		type="text/javascript"></script>
	<script src=" plugins/input-mask/jquery.inputmask.extensions.js"
		type="text/javascript"></script>
	<!-- date-range-picker -->
	<script src=" plugins/daterangepicker/daterangepicker.js"
		type="text/javascript"></script>
	<!-- bootstrap color picker -->
	<script src=" plugins/colorpicker/bootstrap-colorpicker.min.js"
		type="text/javascript"></script>
	<!-- bootstrap time picker -->
	<script src=" plugins/timepicker/bootstrap-timepicker.min.js"
		type="text/javascript"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src=" plugins/slimScroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- iCheck 1.0.1 -->
	<script src=" plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<!-- FastClick -->
	<script src=' plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src=" dist/js/app.min.js" type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src=" dist/js/demo.js" type="text/javascript"></script>
	<!-- Page script -->
	<script type="text/javascript">
      $(function () {
        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
                {
                  ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    'Last 7 Days': [moment().subtract('days', 6), moment()],
                    'Last 30 Days': [moment().subtract('days', 29), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                  },
                  startDate: moment().subtract('days', 29),
                  endDate: moment()
                },
        function (start, end) {
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        );

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
          checkboxClass: 'icheckbox_minimal-blue',
          radioClass: 'iradio_minimal-blue'
        });
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
          checkboxClass: 'icheckbox_minimal-red',
          radioClass: 'iradio_minimal-red'
        });
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
          checkboxClass: 'icheckbox_flat-green',
          radioClass: 'iradio_flat-green'
        });

        //Colorpicker
        $(".my-colorpicker1").colorpicker();
        //color picker with addon
        $(".my-colorpicker2").colorpicker();

        //Timepicker
        $(".timepicker").timepicker({
          showInputs: false
        });
      });
    </script>
    
    

    
    
