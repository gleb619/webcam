"document" in self && !("classList" in document.createElement("_")) && ! function(a) {
    "use strict";
    if ("Element" in a) {
        var b = "classList",
            c = "prototype",
            d = a.Element[c],
            e = Object,
            f = String[c].trim || function() {
                return this.replace(/^\s+|\s+$/g, "")
            },
            g = Array[c].indexOf || function(a) {
                for (var b = 0, c = this.length; c > b; b++)
                    if (b in this && this[b] === a) return b;
                return -1
            },
            h = function(a, b) {
                this.name = a, this.code = DOMException[a], this.message = b
            },
            i = function(a, b) {
                if ("" === b) throw new h("SYNTAX_ERR", "An invalid or illegal string was specified");
                if (/\s/.test(b)) throw new h("INVALID_CHARACTER_ERR", "String contains an invalid character");
                return g.call(a, b)
            },
            j = function(a) {
                for (var b = f.call(a.getAttribute("class") || ""), c = b ? b.split(/\s+/) : [], d = 0, e = c.length; e > d; d++) this.push(c[d]);
                this._updateClassName = function() {
                    a.setAttribute("class", this.toString())
                }
            },
            k = j[c] = [],
            l = function() {
                return new j(this)
            };
        if (h[c] = Error[c], k.item = function(a) {
                return this[a] || null
            }, k.contains = function(a) {
                return a += "", -1 !== i(this, a)
            }, k.add = function() {
                var a, b = arguments,
                    c = 0,
                    d = b.length,
                    e = !1;
                do a = b[c] + "", -1 === i(this, a) && (this.push(a), e = !0); while (++c < d);
                e && this._updateClassName()
            }, k.remove = function() {
                var a, b = arguments,
                    c = 0,
                    d = b.length,
                    e = !1;
                do {
                    a = b[c] + "";
                    var f = i(this, a); - 1 !== f && (this.splice(f, 1), e = !0)
                } while (++c < d);
                e && this._updateClassName()
            }, k.toggle = function(a, b) {
                a += "";
                var c = this.contains(a),
                    d = c ? b !== !0 && "remove" : b !== !1 && "add";
                return d && this[d](a), "boolean" == typeof b ? b : !c
            }, k.toString = function() {
                return this.join(" ")
            }, e.defineProperty) {
            var m = {
                get: l,
                enumerable: !0,
                configurable: !0
            };
            try {
                e.defineProperty(d, b, m)
            } catch (n) {
                -2146823252 === n.number && (m.enumerable = !1, e.defineProperty(d, b, m))
            }
        } else e[c].__defineGetter__ && d.__defineGetter__(b, l)
    }
}(self), angular.module("rangeSlider", []).run(["$templateCache", function(a) {
// a.put("../../views/rg-slider.html", '<div class="rg-slider"><div
// class="rg-slider-wrapper"> <div class="rg-slider-trackbar"
// ng-class="trackBarClass"><div class="rg-tracker"
// ng-class="trackerClass"></div> </div></div> <div class="rg-navigator"
// ng-if="showNavigator" ng-class="navigatorClass"><ul> <li ng-repeat="item in
// navList track by $index" ng-style="{width: listItemWidth}"> <span
// ng-class="{rgActive: (item === curValue)}">{{item}}</span> <span
// ng-class="{rgActive: (item+1 === curValue)}" class="rg-list-lastitem"
// ng-if="$last">{{item + 1 }}</span></li></ul></div></div>')
// a.put("ngSlider", '<div class="rg-slider"><div class="rg-slider-wrapper">
// <div class="rg-slider-trackbar" ng-class="trackBarClass"><div
// class="rg-tracker" ng-class="trackerClass"></div> </div></div> <div
// class="rg-navigator" ng-if="showNavigator" ng-class="navigatorClass"><ul> <li
// ng-repeat="item in navList track by $index" ng-style="{width:
// listItemWidth}"> <span ng-class="{rgActive: (item ===
// curValue)}">{{item}}</span> <span ng-class="{rgActive: (item+1 ===
// curValue)}" class="rg-list-lastitem" ng-if="$last">{{item + 1
// }}</span></li></ul></div></div>')
}]), angular.module("rangeSlider")

.directive('rgSlider', [function () {
    return {
      templateUrl: 'ngSlider',
      restrict: 'E',
      scope: {
        trackerClass:   '@',
        trackBarClass:  '@',
        navigatorClass: '@',
        showNavigator:  '@',
        step:           '=',
        navigatorFrom:  '=',
        navigatorTo:    '=',
        boundVar:       '=ngModel',
        trackVar: 		'='
      },
      replace: false,
      link: function postLink(scope, element) {
        var tracker,
          rgSliderWrapper,
          wrapper = element[0],
          curX,
          totalSteps,
          selectedStep,
          positionWatcher,
          trackerWidth,
          STEP_DIFFERENCE = 1,
          wrapperOfssetLeft = wrapper.firstChild.getBoundingClientRect().left;

        /**
         * @description finds element by given classname inside the dom list of given element
         * NOTE its will return only one element
         * @param element <HTMLElement>
         * @param className <String>
         * @returns {*} <HTMLElement>
         */
        function getElementByClassName(element, className) {
          var foundedElement;

          function findElement(element, className) {
            var i,
              length = element.childNodes.length;
            if (foundedElement) {
              return;
            }
            for (i = 0; i < length; i++) {
              if (element.childNodes[i].nodeType && element.childNodes[i].nodeType === 1) {
                if (element.childNodes[i].classList.contains(className)) {
                  foundedElement = element.childNodes[i];
                  break;
                }
                else {
                  findElement(element.childNodes[i], className);
                }
              }
            }
          }

          findElement(element, className);

          return foundedElement;

        }

        tracker = getElementByClassName(element[0], 'rg-tracker');
        rgSliderWrapper = getElementByClassName(element[0], 'rg-slider-wrapper');
        trackerWidth = tracker.clientWidth;
        function startUpdatingTracker() {
          positionWatcher = true;
        }

        function mouseDownHandler() {
          startUpdatingTracker();
        }

        function mouseUpHandler() {
          if (positionWatcher) {
            positionWatcher = false;
          }
        }

        scope.$watch('trackVar', function() {
//        	console.info('trackVar: ', scope.trackVar, ', curValue: ', scope.curValue);
        	scope.curValue = scope.trackVar;
        	slideTracker(scope.trackVar);
        	scope.curValue = scope.trackVar;
//        	slideTracker();
		});
        /*
        scope.$watch('curValue', function() {
        	console.info('cnahge#curValue: ', scope.curValue);
//        	a.curValue = a.trackVar;
        });
        */
        
        /**
         * @description Handle mousemove event, set the current X, and if slide tracker if it needed
         * @param event
         */
        function mouseMoveHandler(event) {
          curX = event.pageX - wrapperOfssetLeft;
          //console.log(curX);
          if (positionWatcher) {
            slideTracker();
          }
        }

        /**
         * @description Calculate the position of tracker, where he must go and return
         * @returns {number}
         * @param {number} currentStep is the boundVar value, if it defined we calculating with exact step
         */
        function getExpectedPosition(currentStep) {
          var goTo = ((100 * (curX - trackerWidth)) / rgSliderWrapper.clientWidth),
            availableWidth = 100 - ((100 * trackerWidth) / rgSliderWrapper.clientWidth);
          // to not get negative value
          if (goTo < 0) {
            goTo = 0;
          }

          scope.curValue = Math.round(goTo);
          // if setted step go calculate exact step
          if (totalSteps) {
            goTo = calculateByStep(goTo,currentStep);
          }

          return (goTo <= availableWidth) ? goTo : availableWidth;
        }

        /**
         * @description Calculate position of tracker depended on step / if step enabled
         * @param {number} value
         * @param {number} currentStep
         * @returns {number}
         */
        function calculateByStep(value, currentStep) {
          var eachStep = 100 / totalSteps,
            rounded = (value >= 0) ? Math.round(value / eachStep) : currentStep,
            goTo = Math.floor(rounded * eachStep);
          // set current step in curValue
          scope.curValue = scope.navList[rounded];
          // if the value is last value then set it
          if (goTo === 100) {
            scope.curValue = scope.navList[rounded - 1] + 1;
          }

          return goTo;
        }

        /**
         * @description Fire watchers and update boundVar value
         */
        function updateBoundVar() {
          scope.$evalAsync(function (scope) {
            scope.boundVar = scope.curValue;
          });
        }

        /**
         * @description Render tracker and update boundVar
         */
        function slideTracker(currentStep) {
          tracker.style.left = getExpectedPosition(currentStep) + '%';
          updateBoundVar();
        }

        /**
         * @description initialize event listeners
         */
        function initEventListeners() {
          tracker.addEventListener('mousedown', mouseDownHandler);
          wrapper.addEventListener('click', slideTracker);
          document.addEventListener('mouseup', mouseUpHandler);
          document.addEventListener('mousemove', mouseMoveHandler);
        }

        function removeEventListeners() {
          document.removeEventListener('mouseup', mouseUpHandler);
          document.removeEventListener('mousemove', mouseMoveHandler);
        }

        /**
         * @description Generate navigation list if scope.showNavigator is true and step is provided
         */
        function generateNavigatorListByStep() {
          var navList = [], i;
          for (i = 1; i <= totalSteps; i++) {
            navList.push(i);
          }
          scope.navList = navList;
        }

        /**
         * @description Generate navigation list if scope.showNavigator is true and (navigatorFrom && navigatorTo)  is provided
         */
        function generateNavigatorList() {
          scope.navigatorFrom = parseInt(scope.navigatorFrom, 10);
          scope.navigatorTo = parseInt(scope.navigatorTo, 10);
          var navList = [], i, length = totalSteps + scope.navigatorFrom - STEP_DIFFERENCE;
          // Generate error when navigatorFrom > navigatorTo
          if (scope.navigatorFrom > scope.navigatorTo) {
            throw new Error('navigatorFrom: ' + scope.navigatorFrom + ' must be lower than navigatorTo: ' + scope.navigatorTo);
          }

          for (i = scope.navigatorFrom; i <= length; i++) {
            navList.push(i);
          }
          scope.navList = navList;

        }

        /**
         * @description Set tracker position / if we have default value in boundVar slide to it, if not set first element from nav list
         */
        function setTracker() {
          // Update value in curValue and skip rest because we don't have navigation list
          if (!angular.isArray(scope.navList)) {
            setCurrentValue();
            return;
          }

          var index = scope.navList.indexOf(scope.boundVar);

          if (index !== -1) {
            slideTracker(index);
          }
          else {
            setCurrentValue();
          }
        }

        /**
         * @description Set current value to bound var and call $digest
         */
        function setCurrentValue() {
          scope.curValue = (totalSteps) ? scope.navList[0] : 0;
          updateBoundVar();
        }



        /**
         * @description Main initialization function which will be called when directive is initialized
         * - Register watchers and event Listeneres
         * - Check provided scope variables
         * - Generate needed variables
         */
        function init() {
          scope.$on('$destroy', removeEventListeners);
          initEventListeners();
          selectedStep = 0;
          // navigatorFrom and step property cant be used together because when setted navigatorFrom step will be calculated automatically
          if (scope.navigatorFrom && scope.step) {
            throw new Error('navigatorFrom and step can not be used together');
          }
          // Check if we have seted steps range in scope
          if (scope.navigatorFrom !== undefined && scope.navigatorTo && scope.showNavigator) {
            totalSteps = scope.navigatorTo - scope.navigatorFrom;
            generateNavigatorList();

          }
          // check if we have only setted step
          if (scope.step) {
            totalSteps = parseInt(scope.step, 10) - STEP_DIFFERENCE;
            generateNavigatorListByStep();

          }
          // if we total steps then set ul>li's exact width
          if (totalSteps) {
            scope.listItemWidth = Math.round((rgSliderWrapper.clientWidth * (100 / totalSteps)) / 100) + 'px';
            // Set first value as current value

          }

          setTracker();

        }

        init();
      }
    };
  }]);
/*
.directive("rgSlider", [function() {
    return {
        templateUrl: "ngSlider",
        restrict: "E",
        scope: {
            trackerClass: "@",
            trackBarClass: "@",
            navigatorClass: "@",
            showNavigator: "@",
            step: "=",
            navigatorFrom: "=",
            navigatorTo: "=",
            boundVar: "=",
            trackVar: "="
        },
        replace: !1,
        link: function(a, b) {
            function c(a, b) {
                function c(a, b) {
                    var e, f = a.childNodes.length;
                    if (!d)
                        for (e = 0; f > e; e++)
                            if (a.childNodes[e].nodeType && 1 === a.childNodes[e].nodeType) {
                                if (a.childNodes[e].classList.contains(b)) {
                                    d = a.childNodes[e];
                                    break
                                }
                                c(a.childNodes[e], b)
                            }
                }
                var d;
                return c(a, b), d
            }
			
            a.$watch('trackVar', function() {
            	console.info('trackVar: ', a.trackVar, ', curValue: ', a.curValue);
            	a.curValue = a.trackVar;
    		});
            
            a.$watch('curValue', function() {
            	console.info('cnahge#curValue: ', a.curValue);
//            	a.curValue = a.trackVar;
            });
            
            function d() {
                x = !0
            }

            function e() {
                d()
            }

            function f() {
                x && (x = !1)
            }

            function g(a) {
                u = a.pageX - B, x && k()
            }

            function h(b) {
                var c = 100 * (u - y) / t.clientWidth,
                    d = 100 - 100 * y / t.clientWidth;
                return 0 > c && (c = 0), a.curValue = Math.round(c), v && (c = i(c, b)), d >= c ? c : d
            }

            function i(b, c) {
                var d = 100 / v,
                    e = b >= 0 ? Math.round(b / d) : c,
                    f = Math.floor(e * d);
                return a.curValue = a.navList[e], 100 === f && (a.curValue = a.navList[e - 1] + 1), f
            }

            function j() {
                a.$evalAsync(function(a) {
                    a.boundVar = a.curValue
                })
            }

            function k(a) {
                s.style.left = h(a) + "%", j()
            }

            function l() {
                s.addEventListener("mousedown", e), z.addEventListener("click", k), document.addEventListener("mouseup", f), document.addEventListener("mousemove", g)
            }

            function m() {
                document.removeEventListener("mouseup", f), document.removeEventListener("mousemove", g)
            }

            function n() {
                var b, c = [];
                for (b = 1; v >= b; b++) c.push(b);
                a.navList = c
            }

            function o() {
                a.navigatorFrom = parseInt(a.navigatorFrom, 10), a.navigatorTo = parseInt(a.navigatorTo, 10);
                var b, c = [],
                    d = v + a.navigatorFrom - A;
                if (a.navigatorFrom > a.navigatorTo) throw new Error("navigatorFrom: " + a.navigatorFrom + " must be lower than navigatorTo: " + a.navigatorTo);
                for (b = a.navigatorFrom; d >= b; b++) c.push(b);
                a.navList = c
            }

            function p() {
                if (!angular.isArray(a.navList)) return void q();
                var b = a.navList.indexOf(a.boundVar); - 1 !== b ? k(b) : q()
            }

            function q() {
                a.curValue = v ? a.navList[0] : 0, j()
            }

            function r() {
                if (a.$on("$destroy", m), l(), w = 0, a.navigatorFrom && a.step) throw new Error("navigatorFrom and step can not be used together");
                void 0 !== a.navigatorFrom && a.navigatorTo && a.showNavigator && (v = a.navigatorTo - a.navigatorFrom, o()), a.step && (v = parseInt(a.step, 10) - A, n()), v && (a.listItemWidth = Math.round(t.clientWidth * (100 / v) / 100) + "px"), p()
            }
            var s, t, u, v, w, x, y, z = b[0],
                A = 1,
                B = z.firstChild.getBoundingClientRect().left;
            s = c(b[0], "rg-tracker"), t = c(b[0], "rg-slider-wrapper"), y = s.clientWidth, r()
        }
    }
}]);
*/