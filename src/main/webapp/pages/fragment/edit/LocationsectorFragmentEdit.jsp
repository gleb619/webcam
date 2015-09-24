<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.locationsector.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('locationstadium')">
						<label><spring:message code="label.locationStadium" /></label>
						<select class="form-control"
										id="selectdictLocationStadium" ng-model="item.locationsector.locationstadium"
										ng-options="item.label for item in dataLocationStadium track by item.id"
										tabindex="2">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('quantity')">
						<label><spring:message code="label.quantity" /></label>
						<input type="number" ng-model="item.locationsector.quantity"
							class="form-control"
							tabindex="3" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('color')">
						<label><spring:message code="label.color" /></label>
						<input type="text" ng-model="item.locationsector.color"
							class="form-control"
							tabindex="4" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('name')">
						<label><spring:message code="label.name" /></label>
						<input type="text" ng-model="item.locationsector.name"
							class="form-control"
							tabindex="5" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('maplocation')">
						<label><spring:message code="label.mapLocation" /></label>
						<input type="text" ng-model="item.locationsector.maplocation"
							class="form-control"
							tabindex="6" />
					</div>
				</div>
			

</div>
