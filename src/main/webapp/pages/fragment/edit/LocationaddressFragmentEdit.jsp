<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-6 col-lg-4 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.locationaddress.label" class="form-control" tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-if="::checkVisibility('gmappointx')">
						<label><spring:message code="label.gmapPointX" /></label>
						<input type="text" ng-model="item.locationaddress.gmappointx" class="form-control" tabindex="2" />
					</div>
					<div class="form-group margin-top-5" ng-if="::checkVisibility('nameeng')">
						<label><spring:message code="label.nameeng" /></label>
						<input type="text" ng-model="item.locationaddress.nameeng" class="form-control" tabindex="3" />
					</div>
					<div class="form-group margin-top-5" ng-if="::checkVisibility('gmappointy')">
						<label><spring:message code="label.gmapPointY" /></label>
						<input type="text" ng-model="item.locationaddress.gmappointy" class="form-control" tabindex="4" />
					</div>
					<div class="form-group margin-top-5" ng-if="::checkVisibility('metro')">
						<label><spring:message code="label.metro" /></label>
						<input type="text" ng-model="item.locationaddress.metro" class="form-control" tabindex="5" />
					</div>
					<div class="form-group margin-top-5" ng-if="::checkVisibility('name')">
						<label><spring:message code="label.name" /></label>
						<input type="text" ng-model="item.locationaddress.name" class="form-control" tabindex="6" />
					</div>
					
				</div>
				<div class="col-md-6 col-lg-4 edit-block-2">
					
					<div class="form-group margin-top-5" ng-if="::checkVisibility('roadmap')">
						<label><spring:message code="label.roadMap" /></label>
						<input type="text" ng-model="item.locationaddress.roadmap" class="form-control" tabindex="7" />
					</div>
					<div class="form-group margin-top-5" ng-if="::checkVisibility('yandexmappointx')">
						<label><spring:message code="label.yandexMapPointX" /></label>
						<input type="text" ng-model="item.locationaddress.yandexmappointx" class="form-control" tabindex="8" />
					</div>
					<div class="form-group margin-top-5" ng-if="::checkVisibility('yandexmappointy')">
						<label><spring:message code="label.yandexMapPointY" /></label>
						<input type="text" ng-model="item.locationaddress.yandexmappointy" class="form-control" tabindex="9" />
					</div>
				</div>
			

</div>
