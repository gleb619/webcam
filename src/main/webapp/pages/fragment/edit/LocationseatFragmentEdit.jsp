<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.locationseat.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('locationrow')">
						<label><spring:message code="label.locationRow" /></label>
						<select class="form-control"
										id="selectdictLocationRow" ng-model="item.locationseat.locationrow"
										ng-options="item.label for item in dataLocationRow track by item.id"
										tabindex="2">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('seat')">
						<label><spring:message code="label.seat" /></label>
						<input type="number" ng-model="item.locationseat.seat"
							class="form-control"
							tabindex="3" />
					</div>
				</div>
			

</div>
