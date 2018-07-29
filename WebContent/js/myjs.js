/* print */
$(document).ready(function(e) {
	$('#coursetype').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#coursename').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#courseselection').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#example1').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#example2').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#example3').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#studentexam').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(function() {
	$("#txtDate").datepicker({
		dateFormat : 'dd/mm/yy',
		changeMonth : true,
		changeYear : true,
		onClose : function(dateText, inst) {
			$(this).focus();
			$(this).focusNextInputField();
		}
	});
});

$(document).ready(function(e) {
	$('#examregform #ddlExamcode').change(function() {
		var examid = $('#examregform #ddlExamcode option:selected').val();
		if (examid == "0") {
			$('#examregform #txtExamname').val('');
		} else {
			$.ajax({
				url : 'ExamRegistrationServlet',
				type : 'post',
				data : {
					"Examid" : examid,
					"Option" : "Option"
				},
				dataType : 'json',
				success : function(data) {
					$('#examregform #txtExamname').val(data.Examname);
				}
			});
		}
	});
});

$(document).ready(function(e) {
	$('#examregform #ddlCode').change(function() {
		var examid = $('#examregform #ddlCode option:selected').val();
		if (examid == "0") {
			$('#examregform #txtExam').val('');
		} else {
			$.ajax({
				url : 'ExamRegistrationServlet',
				type : 'post',
				data : {
					"Examid" : examid,
					"Option" : "Option"
				},
				dataType : 'json',
				success : function(data) {
					$('#examregform #txtExam').val(data.Examname);
				}
			});
		}
	});
});

$(document).ready(function(e) {
	$('#students').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#studentdetails2').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(function() {
	$('#examregform #txtDate').datepicker({
		changeMonth : true,
		changeYear : true,
		onClose : function(dateText, inst) {
			$(this).focus();
			$(this).focusNextInputField();
		}
	});
});


function isNumber(evt) {
	evt = (evt) ? evt : window.event;
	var charcode = (evt.which) ? evt.which : evt.keyCode;
	if (charcode > 31 && (charcode < 48 || charcode > 57)) {
		return false;
	}
	return true;
}

$('#examregform #txtExamname').keydown(function(e) {
	return false;
});

$('#examregform #txtExamname').bind('cut paste', function(e) {
	e.preventDefault();
});

$(function() {
	$('#examregform #txtDate').datepicker({
		changeMonth : true,
		changeYear : true,
		onClose : function(dateText, inst) {
			$(this).focus();
			$(this).focusNextInputField();
		}
	});
});

/* Delete candidate */
$(document).ready(function(e) {
	$('#examregform #Deletecandidate').click(function(e) {
		e.preventDefault();
		var candidateid = $(this).attr("value");
		if (confirm("Are you sure you want to delete this?")) {
			$.ajax({
				url : 'ExamRegistrationServlet',
				type : 'post',
				dataType : 'json',
				data : {
					"Candidateid" : candidateid,
					"Delete" : "Deletecandidate"
				},
				dataType : 'json',
				success : function(data) {
					alert(data.Result);
					location.reload();
				}
			});
		} else {
			return false;
		}
	});
});

$(function() {
	$('#examregform #txtdate').datepicker({
		changeMonth : true,
		changeYear : true,
		onClose : function(dateText, inst) {
			$(this).focus();
			$(this).focusNextInputField();
		}
	});
});

/* remove exam */
$(document).ready(function(e) {
	$('#examregform #btnRemove').click(function(e) {
		var radioValue = $("input[name='radiogroup']:checked").val();
		if (radioValue) {
			if (confirm("Are you sure you want to delete this?")) {
				$.ajax({
					url : 'ExamRegistrationServlet',
					type : 'post',
					dataType : 'json',
					data : {
						"Canexamid" : radioValue,
						"Delete" : "Deleteexam"
					},
					dataType : 'json',
					success : function(data) {
						alert(data.Result);
						location.reload();
					}
				});
			} else {
				return false;
			}
		}
	});
});

$(document).ready(function(e) {
	$('#examregform #ddlCode').change(function() {
		var examid = $('#examregform #ddlCode option:selected').val();
		if (examid == "0") {
			$('#examregform #txtname').val('');
		} else {
			$.ajax({
				url : 'ExamRegistrationServlet',
				type : 'post',
				data : {
					"Examid" : examid,
					"Option" : "Option"
				},
				dataType : 'json',
				success : function(data) {
					$('#examregform #txtExamName').val(data.Examname);
				}
			});
		}
	});
});

/* Exam code */
$(document).ready(function(e) {
	$('#examregform #ddlExamcode').change(function() {
		var examid = $('#examregform #ddlExamcode option:selected').val();
		if (examid == "0") {
			$('#examregform #txtExamname').val('');
		} else {
			$.ajax({
				url : 'ExamRegistrationServlet',
				type : 'post',
				data : {
					"Examid" : examid,
					"Option" : "Option"
				},
				dataType : 'json',
				success : function(data) {
					$('#examregform #txtExamname').val(data.Examname);
				}
			});
		}
	});
});

/* Reset */
$(document).ready(function(e) {
	$('#examregform #btnClear').click(function(e) {
		$('#examregform #txtName').val('');
		$('#examregform #txtAddress').val('');
		$('#examregform #txtMobile').val('');
		$('#examregform #txtEmail').val('');
		$('#examregform #txtComapny').val('');
		$('#examregform #txtName').focus();
		$('#examregform #txtCandidateid').val('');
		$('#examregform #ddlExamcode').val('0');
		$('#examregform #txtExamname').val('');
		$('#examregform #txtVoucherno').val('');
		$('#examregform #txtDate').val('');

		$('#examregform #txtName').removeAttr('readonly');
		$('#examregform #txtAddress').removeAttr('readonly');
		$('#examregform #txtMobile').removeAttr('readonly');
		$('#examregform #txtEmail').removeAttr('readonly');
		$('#examregform #txtComapny').removeAttr('readonly');
		$('#examregform #txtCandidateid').removeAttr('readonly');
		$('#examregform #ddlExamcode').prop('disabled', false);
		$('#examregform #txtExamname').removeAttr('readonly');
		$('#examregform #txtVoucherno').removeAttr('readonly');
		$('#examregform #txtDate').removeAttr('readonly');
		$('#examregform #btnSave').prop('disabled', false);
		$('#examregform #btnSave').text('Save');
	});
});

$(document).ready(function(e) {
	$('#candidateedit').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#example').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});

$(document).ready(function(e) {
	$('#scandidate').DataTable({
		responsive : {
			details : {
				display : $.fn.dataTable.Responsive.display.modal({
					header : function(row) {
						var data = row.data();
						return 'Details for ' + data[0] + ' ' + data[1];
					}
				}),
				renderer : $.fn.dataTable.Responsive.renderer.tableAll({
					tableClass : 'table'
				})
			}
		}
	});
});
