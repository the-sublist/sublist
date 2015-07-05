$(document).ready(function() {
    var standardMessage = "This field is required"


  // SCHOOL REGISTRATION VALIDATION
  $('#school_registration_form').isHappy({
    fields: {
      // reference the field you're talking about, probably by `id`
      // but you could certainly do $('[name=name]') as well.
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
      '#school_contact_phone': {
        required: true,
        message: 'Please provide a 10-digit number',
        test: function() {
          number = $("#school_contact_phone").val();
          return /^[0-9]{10}$/.test(number);
        }
      },
      '#school_address': {
        required: true,
        message: standardMessage
      }
    }
  });




});
