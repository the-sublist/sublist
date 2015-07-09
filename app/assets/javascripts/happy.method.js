var happy = {
    validatePhone: function (val) {
      return /^\(?(\d{3})\)?[\- ]?\d{3}[\- ]?\d{4}$/.test(val);
    },
    dateCheck: function (val, today) {
      return val >= today
    },
    amTimecheck: function (val, end) {
      return val < end;
    },
    pmTimecheck: function (val, start) {
      return val > start;
    },

};
