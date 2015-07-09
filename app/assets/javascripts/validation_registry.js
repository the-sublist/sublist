$(document).ready(function() {
  var standardMessage = "This field is required"
  var phoneMessage = 'Please provide a valid 10-digit phone number'

  // SCHOOL REGISTRATION VALIDATIONS
  $('#school_registration_form').isHappy({
    fields: {
      '#school_email': {
        required: true,
        message: standardMessage
      },
      '#school_password': {
        required: true,
        message: standardMessage
      },
      '#school_password_confirmation': {
        required: true,
        message: standardMessage
      },
      '#school_name': {
        required: true,
        message: standardMessage
      },
      '#school_phone': {
        required: true,
        message: phoneMessage,
        test: happy.validatePhone
      },
      '#school_address': {
        required: true,
        message: standardMessage
      }
    }
  });

  // SCHOOL EDIT VALIDATIONS
  $('.edit_school').isHappy({
    fields: {
      '#school_school_name': {
        required: true,
        message: standardMessage
      },
      '#school_address': {
        required: true,
        message: standardMessage
      },
      '#school_contact_phone': {
        required: true,
        message: phoneMessage,
        test: happy.validatePhone
      },
    }
  });

  // TEACHER REGISTRATION VALIDATIONS
  $('#teacher_registration_form').isHappy({
    fields: {
      '#teacher_first_name': {
        required: true,
        message: standardMessage
      },
      '#teacher_last_name': {
        required: true,
        message: standardMessage
      },
      '#teacher_email': {
        required: true,
        message: standardMessage
      },
      '#teacher_password': {
        required: true,
        message: standardMessage
      },
      '#teacher_password_confirmation': {
        required: true,
        message: standardMessage
      },
      '#teacher_phone': {
        required: true,
        message: phoneMessage,
        test: happy.validatePhone
      }
    }
  });

  // TEACHER EDIT VALIDATIONS
  $('.edit_teacher').isHappy({
    fields: {
      '#teacher_first_name': {
        required: true,
        message: standardMessage
      },
      '#teacher_last_name': {
        required: true,
        message: standardMessage
      },
      '#teacher_phone_number': {
        required: true,
        message: phoneMessage,
        test: happy.validatePhone
      },
    }
  });

  // REQUEST VALIDATIONS
  $("#new_request").isHappy({
    fields: {
      '#request_request_name': {
        required: true,
        message: standardMessage
      },
      '#request_payment': {
        required: true,
        message: "Please indicate payment in dollars"
      },
      '#request_date': {
        required: true,
        message: "Please select a date, today or in the future",
        test: happy.dateCheck,
        arg: function() {
          var year = new Date().getFullYear().toString();
          var month = ("0" + (new Date().getMonth() + 1).toString()).slice(-2);
          var date = ("0" + new Date().getDate().toString()).slice(-2);
          return year + "-" + month + "-" + date
        }
      },
      '#request_start_time': {
        required: true,
        message: "Start time must be earlier than end time",
        when: "submit",
        test: happy.amTimecheck,
        arg: function() {
          return $("#request_end_time").val();
        }
      },
      '#request_end_time': {
        required: true,
        message: "End time must be later than start time",
        when: "submit",
        test: happy.pmTimecheck,
        arg: function() {
          return $("#request_start_time").val();
        }
      },
      '#request_grade': {
        required: true,
        message: "Please select a grade for this opening"
      },
    }
  });
});
