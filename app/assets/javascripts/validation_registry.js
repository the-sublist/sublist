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
        message: standardMessage
      },
      '#request_date': {
        required: true,
        message: standardMessage,
      },
      '#request_start_time': {
        required: true,
        message: standardMessage
      },
      '#request_end_time': {
        required: true,
        message: standardMessage
      },
      '#request_grade': {
        required: true,
        message: standardMessage
      },
    }
  });
});
