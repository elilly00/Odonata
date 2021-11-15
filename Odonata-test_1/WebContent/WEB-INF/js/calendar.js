var DatePicker = (function () {
  /**
   *
   * @param config
   * @constructor
   */
  function Calendar(config) {
    this.target = (function () {
      if (config.el) {
        return config.el;
      } else {
        throw "The el option is required";
      }
    })();
    this.trigger = (function () {
      if (config.trigger) {
        return config.trigger;
      } else {
        throw "The trigger option is required";
      }
    })();
    this.defaultDate = config.default || "today";
    this.isRadio = !!config.isRadio;
    this.lang = config.lang == "KO" ? config.lang : "EN";
    this.position = config.position || "bottom";
    this.selectInterval = config.interval || [1970, 2030];
    this.isShow = true;

    this.showFn = config.showFn || function () {};
    this.hideFn = config.hideFn || function () {};
    this.onchange = config.onchange || function () {};

    this.nonceYear = 0;
    this.nonceMonth = 0;
    this.nonceDay = 0;

    this.selectedDate = {
      begin: {
        year: 0,
        month: 0,
        day: 0,
      },
      end: {
        year: 0,
        month: 0,
        day: 0,
      },
    };
    // 날짜 배열
    this.renderDate = [];
    this.init();
  }

  // DatePicker = Calendar;
  var utils = {
    bind: function (el, event, listener) {
      if (el.addEventListener) {
        this.bind = function (el, event, listener) {
          el.addEventListener(event, listener);
        };
      } else if (el.attachEvent) {
        this.bind = function (el, event, listener) {
          el.attachEvent.call(el, event, listener);
        };
      } else {
        this.bind = function (el, event, listener) {
          el.on[event] = listener;
        };
      }
      return this.bind.apply(this, arguments);
    },
    delegates: function (tagName, fn) {
      return function (e) {
        var event = e || window.event,
          target = event.target || event.srcElement;
        if (target.tagName.toLowerCase() === tagName) {
          fn.call(null, target);
        }
      };
    },

    addClass: function (el, className) {
      var ol = el.className;
      if (ol.split(" ").indexOf(className) === -1) {
        el.className = ol + " " + className;
      }
    },

    removeClass: function (el, className) {
      [].forEach.call(el, function (ele) {
        var ol = ele.className,
          reg = new RegExp("(\\s)*" + className);
        ele.className = ol.replace(reg, "");
      });
    },
  };

  Calendar.prototype = {
    constructor: Calendar,

    show: function () {
      this.target.style.display = "inline-block";
      this.isShow = true;
      this.target.style.position = "absolute";

      var triggerW = this.trigger.offsetWidth,
        triggerH = this.trigger.offsetHeight,
        offTop = this.trigger.offsetTop,
        offLeft = this.trigger.offsetLeft;

      var targetW = this.target.offsetWidth,
        targetH = this.target.offsetHeight;
      var leftAttr, topAttr;
      if (this.position == "top") {
        leftAttr = offLeft;
        topAttr = offTop - targetH;
      } else if (this.position == "right") {
        leftAttr = offLeft + triggerW;
        topAttr = offTop;
      } else if (this.position == "left") {
        leftAttr = offLeft - targetW;
        topAttr = offTop;
      } else {
        leftAttr = offLeft;
        topAttr = offTop + triggerH;
      }
      this.target.style.left = leftAttr + "px";
      this.target.style.top = topAttr + "px";
      this.showFn();
    },

    hide: function () {
      this.target.style.display = "none";
      this.isShow = false;
      this.hideFn();
    },

    get: function () {
      var self = this;

      function format(attr) {
        // 종료 날짜가 비어 있는 경우 표시하지 않음
        if (attr == "end" && !self.selectedDate[attr].year) {
          return;
        }
        return (
          self.selectedDate[attr].year +
          "-" +
          (self.selectedDate[attr].month + 1) +
          "-" +
          self.selectedDate[attr].day
        );
      }

      var currBegin = format("begin"),
        currEnd = format("end");
      if (this.isRadio) {
        return currBegin;
      } else {
        return [currBegin, currEnd];
      }
    },
    /**
     *
     */
    init: function () {
      this.hide();
      // compute select year
      var yearOpts = this._productOptions(
        this.selectInterval,
        this.lang == "KO" ? "년" : ""
      );
      var dateOpts = this._productOptions(
        [1, 12],
        this.lang == "KO" ? "월" : ""
      );

      var navTop =
        "<div class='calendar-wrapper'>" +
        "<div class='calendar-header'>" +
        "<span class='leftArrow'></span>" +
        "<div class='calendar-mid'>" +
        "<select class='year'>" +
        yearOpts +
        "</select>" +
        "<select class='date'>" +
        dateOpts +
        "</select>" +
        "</div>" +
        "<span class='rightArrow'></span>" +
        "</div>" +
        "</div>";

      this.target.innerHTML = navTop;

      this._setDefault();

      this.eventListener();
    },
    /**
     *
     * @param between
     * @param concat
     * @returns {string}
     * @private
     */
    _productOptions: function (between, concat) {
      var opts = "";
      for (var i = between[0]; i <= between[1]; i++) {
        opts += "<option value='" + i + "'>" + i + concat + "</option>";
      }
      return opts;
    },
    /**
     
     * @private
     */
    _setDefault: function () {
      var defaultD = this.defaultDate,
        self = this;
      if (defaultD === "today") {
        var d = new Date();
        self.nonceYear = d.getFullYear();
        self.nonceMonth = d.getMonth();
        self.nonceDay = d.getDate();
      } else {
        var relate = defaultD.split("-");
        if (relate.length <= 1)
          throw "default option is invalid, please check the options and reset `YYYY-mm-dd` or `YYYY-mm`";
        else {
          self.nonceYear = relate[0];
          self.nonceMonth = +relate[1] - 1;
          self.nonceDay = relate[2] || 1;
        }
      }

      self.selectedDate.begin.year = self.nonceYear;
      self.selectedDate.begin.month = self.nonceMonth;
      self._setDateList();
    },

    /**
     *
     * @returns {Array}
     * @private
     */
    _setDateList: function () {
      var whatday = new Date(this.nonceYear, this.nonceMonth, 1).getDay();

      var monthMuchDay = [
        31,
        this.nonceYear % 4 === 0 &&
        (this.nonceYear % 100 !== 0 || this.nonceYear % 400 === 0)
          ? 29
          : 28,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31,
      ];

      var renderList = [],
        prevMonthDays =
          this.nonceMonth - 1 > 0 ? monthMuchDay[this.nonceMonth - 1] : 31,
        nonceMonthDays = monthMuchDay[this.nonceMonth];

      var monthLastDay = new Date(
        this.nonceYear,
        this.nonceMonth,
        nonceMonthDays
      ).getDay();

      var prevOnce = whatday,
        obj;
      while (prevOnce > 0) {
        obj = {
          isInner: false,
          num: prevMonthDays--,
        };
        prevOnce--;
        renderList.unshift(obj);
      }

      for (var i = 1; i <= nonceMonthDays; i++) {
        obj = {
          isInner: true,
          num: i,
        };
        renderList.push(obj);
      }

      for (var i = 1; monthLastDay < 6; monthLastDay++, i++) {
        obj = {
          isInner: false,
          num: i,
        };
        renderList.push(obj);
      }
      this.renderDate = renderList;

      this._doRender(renderList);
    },
    /**
     
     * @param arr
     * @private
     */
    _doRender: function (arr) {
      var self = this,
        lang = {
          EN: ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"],
          KO: ["일", "월", "화", "수", "목", "금", "토"],
        },
        label = lang[self.lang].map(function (ele, i) {
          if (i == 0 || lang.length - 1) {
            return "<li class='weekend'>" + ele + "</li>";
          } else {
            return "<li>" + ele + "</li>";
          }
        }),
        selectedBgTs = +new Date(
          self.selectedDate.begin.year,
          self.selectedDate.begin.month,
          self.selectedDate.begin.day
        ),
        selectedEndTs = +new Date(
          self.selectedDate.end.year,
          self.selectedDate.end.month,
          self.selectedDate.end.day
        );

      var date = "<ul class='weekTip'>" + label.join("") + "</ul>";

      date += "<ul class='date'>";

      arr.forEach(function (ele, ind) {
        var line = Math.floor(ind / 6),
          currTs = +new Date(self.nonceYear, self.nonceMonth, ele.num);

        if (!ele.isInner) date += "<li class='disabled'>" + ele.num + "</li>";
        else if (
          ele.num === self.selectedDate.begin.day &&
          self.nonceMonth === self.selectedDate.begin.month &&
          self.nonceYear === self.selectedDate.begin.year
        )
          date += "<li class='abled active'>" + ele.num + "</li>";
        else if (
          ele.num === self.selectedDate.end.day &&
          self.nonceMonth === self.selectedDate.end.month &&
          self.nonceYear === self.selectedDate.end.year
        )
          date += "<li class='abled active'>" + ele.num + "</li>";
        else if (currTs > selectedBgTs && currTs < selectedEndTs)
          date += "<li class='abled across'>" + ele.num + "</li>";
        else if (!(ind % 7) || ind === line * 6 + line - 1)
          date += "<li class='weekend'>" + ele.num + "</li>";
        else date += "<li class='abled'>" + ele.num + "</li>";
      });

      date += "</ul>";

      var dateContainer = document.createElement("div");
      dateContainer.className = "dateWrap";
      dateContainer.innerHTML = date;

      var header = this.target.querySelector(" .calendar-header");
      // add
      var fload;
      if ((fload = header.nextElementSibling)) {
        header.parentNode.replaceChild(dateContainer, fload);
      } else {
        header.parentNode.insertBefore(dateContainer, null);
      }

      this._selected(" .year option", this.nonceYear);
      this._selected(" .date option", this.nonceMonth + 1);
    },
    /**
     *  
     * 
     
     * @param selector
     * @param tag
     * @private
     */
    _selected: function (selector, tag) {
      var options = this.target.querySelectorAll(selector);
      [].forEach.call(options, function (opt) {
        opt.selected = opt.value === tag.toString();
      });
    },

    /**
     *
     * @private
     */
    _prevMonth: function () {
      if (this.nonceMonth === 0) {
        this.nonceYear--;
        this.nonceMonth = 11;
      } else {
        this.nonceMonth--;
      }
      this._setDateList();
    },

    /**
     *
     * @private
     */
    _nextMonth: function () {
      if (this.nonceMonth === 11) {
        this.nonceYear++;
        this.nonceMonth = 0;
      } else {
        this.nonceMonth++;
      }
      this._setDateList();
    },

    /**
     *
     */
    eventListener: function () {
      var self = this;
      /**
       *
       */
      utils.bind(self.target.querySelector(".leftArrow"), "click", function () {
        self._prevMonth();
      });

      /**
       *
       */
      utils.bind(
        self.target.querySelector(".rightArrow"),
        "click",
        function () {
          self._nextMonth();
        }
      );

      /**
       
       
       */
      utils.bind(
        document,
        "click",
        utils.delegates("li", function (t) {
          if (!t.parentNode.classList.contains("date")) return;

          if (self.isRadio) {
            selectRadio(self, "begin", t);
          } else {
            selectRange(self, t);
          }

          self._setDateList();

          self.onchange(self.get());

          if (!self.isRadio && self.selectedDate.end.year) {
            self.hide();
          } else if (self.isRadio) {
            self.hide();
          }
        })
      );

      function selectRadio(oDate, type, target) {
        oDate.selectedDate[type].day = +target.innerHTML;

        var clkId = [].indexOf.call(target.parentElement.children, target);
        if (!oDate.renderDate[clkId].isInner) {
          if (oDate.selectedDate[type].day > 15) {
            oDate.selectedDate[type].month =
              oDate.nonceMonth - 1 < 0 ? 11 : oDate.nonceMonth - 1;
            oDate._prevMonth();
          } else {
            oDate.selectedDate[type].month =
              oDate.nonceMonth + 1 >= 12 ? 0 : oDate.nonceMonth + 1;
            oDate._nextMonth();
          }
        } else {
          oDate.selectedDate[type].month = oDate.nonceMonth;
        }

        oDate.selectedDate[type].year = oDate.nonceYear;
      }

      function selectRange(oDate, target) {
        var oSelected = self.selectedDate,
          isSelEnd = !!oSelected.end.year,
          isSelBg = !!oSelected.begin.day,
          day = +target.innerHTML;

        function isSelFront() {
          if (/disabled/.test(target.className)) {
            return !(day < 15);
          } else {
            return (
              +new Date(self.nonceYear, self.nonceMonth, day) <
              +new Date(
                oSelected.begin.year,
                oSelected.begin.month,
                oSelected.begin.day
              )
            );
          }
        }

        if (!isSelBg || (!isSelEnd && isSelFront())) {
          selectRadio.call(null, oDate, "begin", target);
        } else if (isSelBg && !isSelEnd) {
          selectRadio.call(null, oDate, "end", target);
        } else {
          selectRadio.call(null, oDate, "begin", target);
          oSelected.end.year = 0;
        }
      }

      /**
       
       */
      utils.bind(
        self.target.querySelector("select.year"),
        "change",
        function (e) {
          self.nonceYear = e.target.value;
          self._setDateList();
        }
      );

      /**
       
       */
      utils.bind(
        self.target.querySelector("select.date"),
        "change",
        function (e) {
          self.nonceMonth = e.target.value - 1;
          self._setDateList();
        }
      );

      /**
       
       */
      utils.bind(document, "click", function (e) {
        var showDP = self.isShow,
          t = e.target,
          breakReg = /dateWrap|calendar\-wrapper/;
        while (t) {
          if (
            t == self.trigger ||
            (t.className && t.className.search(breakReg) != -1)
          ) {
            showDP = false;
            break;
          }
          t = t.parentNode;
        }
        if (showDP) {
          self.hide();
          return true;
        }
      });
    },
  };
  return Calendar;
})();

!window.DatePicker && (window.DatePicker = DatePicker);
