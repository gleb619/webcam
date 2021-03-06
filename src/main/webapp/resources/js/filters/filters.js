'use strict';

angular.module('webcamApp.filters', [])

.filter('currency', [function () {
	return function (array, keyword) {
		var result = [];
		
		if(typeof array == "undefined") {
			return result;
		}
		
		angular.forEach(array, function (element, index) {
			
			if(typeof element == "object") {
				var label = element[keyword.label].label
				,	currencyname = element[keyword.label].currencyname;
				
				if(label){
					label = label.toLowerCase()
				}
				if(currencyname){
					currencyname = currencyname.toLowerCase()
				}
			
				if(label == keyword.value.toLowerCase() || currencyname == keyword.value.toLowerCase()){
					result.push(element);
				}
			}
			else {
				if(element.toLowerCase() == keyword.value.toLowerCase()){
					result.push(element);
				}
			}
			
        });
		
		return result;
	}
}]);