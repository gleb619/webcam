<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('pricebooking')">
						<label><spring:message code="label.priceBooking" /></label>
						<select class="form-control"
										id="selectdictPriceBooking" ng-model="item.relbookingitems.pricebooking"
										ng-options="item.label for item in dataPriceBooking track by item.id"
										tabindex="1">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('locationseat')">
						<label><spring:message code="label.locationSeat" /></label>
						<select class="form-control"
										id="selectdictLocationSeat" ng-model="item.relbookingitems.locationseat"
										ng-options="item.label for item in dataLocationSeat track by item.id"
										tabindex="2">
						</select>
					</div>
				</div>
			

</div>
