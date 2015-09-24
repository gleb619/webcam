<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.transferroute.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('fixedallowance')">
						<label><spring:message code="label.fixedAllowance" /></label>
						<input type="number" step="0.01" ng-model="item.transferroute.fixedallowance"
							class="form-control"
							tabindex="2" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('percentageofallowances')">
						<label><spring:message code="label.percentageOfAllowances" /></label>
						<input type="number" step="0.01" ng-model="item.transferroute.percentageofallowances"
							class="form-control"
							tabindex="3" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('null')">
						<input type="checkbox" ng-model="item.transferroute.free" tabindex="4"/>
						<label><spring:message code="label.free" /></label>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('currcurrency')">
						<label><spring:message code="label.currCurrency" /></label>
						<select class="form-control"
										id="selectdictCurrCurrency" ng-model="item.transferroute.currcurrency"
										ng-options="item.label for item in dataCurrCurrency track by item.id"
										tabindex="5">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('sum')">
						<label><spring:message code="label.sum" /></label>
						<input type="number" ng-model="item.transferroute.sum"
							class="form-control"
							tabindex="6" />
					</div>
					
				</div>
				<div class="col-md-4 edit-block-2">
					
					<div class="form-group margin-top-5" ng-show="checkVisibility('driver')">
						<label><spring:message code="label.driver" /></label>
						<input type="text" ng-model="item.transferroute.driver"
							class="form-control"
							tabindex="7" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('driverphone')">
						<label><spring:message code="label.driverPhone" /></label>
						<input type="text" ng-model="item.transferroute.driverphone"
							class="form-control"
							tabindex="8" />
					</div>
				</div>
			

</div>
