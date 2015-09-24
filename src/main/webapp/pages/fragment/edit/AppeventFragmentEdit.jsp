<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.appevent.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('null')">
						<input type="checkbox" ng-model="item.appevent.isDeleted" tabindex="2"/>
						<label><spring:message code="label.isDeleted" /></label>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('durationenddate')">
						<label><spring:message code="label.durationEndDate" /></label>
					<div class="picker-holder">
					<div class="col-xs-8">
						<div class="input-group picker-item">
							<input type="text" class="form-control" ng-model="item.appevent.durationenddate" datepicker-popup="yyyy-MM-dd"
								ng-change="convertDateAndTime(item.durationenddate, 'durationenddate')"
								is-open="details.durationenddate" close-text="X" tabindex="3"/>
							<span class="input-group-btn">
								<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'durationenddate')">
									<i class="glyphicon glyphicon-calendar"></i>
								</button>
							</span>
						</div>
					</div>
					<div class="col-xs-4">
						<timepicker ng-model="item.appevent.durationenddate" show-meridian="false" ng-change="convertDateAndTime(item.durationenddate, 'durationenddate')"></timepicker>
					</div>
					</div>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('durationstartdate')">
						<label><spring:message code="label.durationStartDate" /></label>
					<div class="picker-holder">
					<div class="col-xs-8">
						<div class="input-group picker-item">
							<input type="text" class="form-control" ng-model="item.appevent.durationstartdate" datepicker-popup="yyyy-MM-dd"
								ng-change="convertDateAndTime(item.durationstartdate, 'durationstartdate')"
								is-open="details.durationstartdate" close-text="X" tabindex="4"/>
							<span class="input-group-btn">
								<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'durationstartdate')">
									<i class="glyphicon glyphicon-calendar"></i>
								</button>
							</span>
						</div>
					</div>
					<div class="col-xs-4">
						<timepicker ng-model="item.appevent.durationstartdate" show-meridian="false" ng-change="convertDateAndTime(item.durationstartdate, 'durationstartdate')"></timepicker>
					</div>
					</div>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('eventend')">
						<label><spring:message code="label.eventEnd" /></label>
						<input type="text" ng-model="item.appevent.eventend"
							class="form-control"
							tabindex="5" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('canceltime')">
						<label><spring:message code="label.cancelTime" /></label>
						<input type="text" ng-model="item.appevent.canceltime"
							class="form-control"
							tabindex="6" />
					</div>
					
				</div>
				<div class="col-md-4 edit-block-2">
					
					<div class="form-group margin-top-5" ng-show="checkVisibility('eventstart')">
						<label><spring:message code="label.eventStart" /></label>
						<input type="text" ng-model="item.appevent.eventstart"
							class="form-control"
							tabindex="7" />
					</div>
				</div>
			

</div>
