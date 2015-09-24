<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.pricerow.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('appevent')">
						<label><spring:message code="label.appEvent" /></label>
						<select class="form-control"
										id="selectdictAppEvent" ng-model="item.pricerow.appevent"
										ng-options="item.label for item in dataAppEvent track by item.id"
										tabindex="2">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('locationrow')">
						<label><spring:message code="label.locationRow" /></label>
						<select class="form-control"
										id="selectdictLocationRow" ng-model="item.pricerow.locationrow"
										ng-options="item.label for item in dataLocationRow track by item.id"
										tabindex="3">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('price')">
						<label><spring:message code="label.price" /></label>
						<input type="number" ng-model="item.pricerow.price"
							class="form-control"
							tabindex="4" />
					</div>
				</div>
			

</div>
