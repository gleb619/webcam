<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.transferroutepoint.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('fixedallowance')">
						<label><spring:message code="label.fixedAllowance" /></label>
						<input type="number" step="0.01" ng-model="item.transferroutepoint.fixedallowance"
							class="form-control"
							tabindex="2" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('percentageofallowances')">
						<label><spring:message code="label.percentageOfAllowances" /></label>
						<input type="number" step="0.01" ng-model="item.transferroutepoint.percentageofallowances"
							class="form-control"
							tabindex="3" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('null')">
						<input type="checkbox" ng-model="item.transferroutepoint.free" tabindex="4"/>
						<label><spring:message code="label.free" /></label>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('starton')">
						<label><spring:message code="label.startOn" /></label>
					<div class="picker-holder">
						<div class="col-xs-8">
							<div class="input-group picker-item">
								<input type="text" class="form-control" ng-model="item.transferroutepoint.starton" datepicker-popup="yyyy-MM-dd"
									ng-change="convertDateAndTime(item.starton, 'starton')"
									is-open="details.starton" close-text="X" tabindex="5"/>
								<span class="input-group-btn">
									<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'starton')">
										<i class="glyphicon glyphicon-calendar"></i>
									</button>
								</span>
							</div>
						</div>
					<div class="col-xs-4 auto-center">
						<timepicker ng-model="item.transferroutepoint.starton" show-meridian="false" ng-change="convertDateAndTime(item.starton, 'starton')"></timepicker>
					</div>
					</div>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('transferroute')">
						<label><spring:message code="label.transferRoute" /></label>
						<select class="form-control"
										id="selectdictTransferRoute" ng-model="item.transferroutepoint.transferroute"
										ng-options="item.label for item in dataTransferRoute track by item.id"
										tabindex="6">
						</select>
					</div>
					
				</div>
				<div class="col-md-4 edit-block-2">
					
					<div class="form-group margin-top-5" ng-show="checkVisibility('sum')">
						<label><spring:message code="label.sum" /></label>
						<input type="number" ng-model="item.transferroutepoint.sum"
							class="form-control"
							tabindex="7" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('pointfrom')">
						<label><spring:message code="label.pointFrom" /></label>
						<input type="text" ng-model="item.transferroutepoint.pointfrom"
							class="form-control"
							tabindex="8" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('pointto')">
						<label><spring:message code="label.pointTo" /></label>
						<input type="text" ng-model="item.transferroutepoint.pointto"
							class="form-control"
							tabindex="9" />
					</div>
				</div>
			

</div>
