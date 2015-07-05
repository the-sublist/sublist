var happy = {
    validatePhone: function (val) {
      return /^\(?(\d{3})\)?[\- ]?\d{3}[\- ]?\d{4}$/.test(val);
    },
    validateDate: function (val) {
      debugger;
      // return new Date(val) >= new Date
      // if (new Date > new Date(val)) return false
    }
};
