<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.infostayperiod.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('race')">
						<label><spring:message code="label.race" /></label>
						<input type="datetime-local" ng-model="item.infostayperiod.race"
							class="form-control"
							tabindex="2" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('departure')">
						<label><spring:message code="label.departure" /></label>
						<input type="datetime-local" ng-model="item.infostayperiod.departure"
							class="form-control"
							tabindex="3" />
					</div>
				</div>
			

</div>
