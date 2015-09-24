<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.locationrow.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('locationsector')">
						<label><spring:message code="label.locationSector" /></label>
						<select class="form-control"
										id="selectdictLocationSector" ng-model="item.locationrow.locationsector"
										ng-options="item.label for item in dataLocationSector track by item.id"
										tabindex="2">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('quantity')">
						<label><spring:message code="label.quantity" /></label>
						<input type="number" ng-model="item.locationrow.quantity"
							class="form-control"
							tabindex="3" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('row')">
						<label><spring:message code="label.row" /></label>
						<input type="number" ng-model="item.locationrow.row"
							class="form-control"
							tabindex="4" />
					</div>
				</div>
			

</div>
