<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!-- col-md-offset-2 col-md-8 -->
<div class="form-holder col-xs-offset-0 col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-2 col-md-8">
	<form class="form-horizontal">
		<fieldset>
			<legend>{{ reqitem.label }}</legend>
			<div class="form-group margin-top-5">
				<label><spring:message code="label.breakfast" /></label>
				<input type="checkbox" ng-model="requestinformation.breakfast" disabled/>
			</div>
			<div class="form-group margin-top-5">
				<label><spring:message code="label.dictGlobalByFoodId" /></label>
				<input type="text" ng-model="requestinformation.dictglobalbyfood" class="form-control" readonly/>
			</div>
			<div class="form-group margin-top-5">
				<label> <spring:message code="label.dictGlobalByPaymentTypeId" />
				</label> <select class="form-control" id="selectdictDictGlobalByPaymentTypeId" ng-model="reqitem.dictglobalbypaymenttype"
					ng-options="reqitem.label for reqitem in dataDictGlobalByPaymentTypeId track by reqitem.id" tabindex="4">
				</select>
			</div>
			<div class="form-group margin-top-5">
				<label> <spring:message code="label.dictGlobalByPlacementId" />
				</label> <select class="form-control" id="selectdictDictGlobalByPlacementId" ng-model="reqitem.dictglobalbyplacement"
					ng-options="reqitem.label for reqitem in dataDictGlobalByPlacementId track by reqitem.id" tabindex="7">
				</select>
			</div>
			<div class="form-group margin-top-5">
				<label> <spring:message code="label.roomCount" />
				</label> <input type="number" ng-model="reqitem.roomcount" class="form-control" tabindex="11" />
			</div>
			
			<div class="form-group margin-top-5 time-holder">
				<div class="time-datepicker-label">
					<label> <spring:message code="label.race" />
					</label>
				</div>

				<div class="picker-holder row">
					<div class="col-xs-7">
						<div class="input-group picker-item">
							<input type="text" class="form-control" ng-model="reqitem.race" datepicker-popup="yyyy-MM-dd"
								ng-change="convertDateAndTime(reqitem.race, 'race')" is-open="datePicker.race" close-text="X" tabindex="3" />
							<span class="input-group-btn">
								<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'race')">
									<i class="glyphicon glyphicon-calendar"></i>
								</button>
							</span>
						</div>
					</div>
					<div class="col-xs-4 auto-center">
						<timepicker ng-model="reqitem.race" show-meridian="false" ng-change="convertDateAndTime(reqitem.race, 'race')"></timepicker>
					</div>
				</div>

			</div>
			
			<div class="form-group margin-top-5 time-holder">
				<div class="time-datepicker-label">
					<label> <spring:message code="label.departure" />
					</label>
				</div>

				<div class="picker-holder row">
					<div class="col-xs-7">
						<div class="input-group picker-item">
							<input type="text" class="form-control" ng-model="reqitem.departure" datepicker-popup="yyyy-MM-dd"
								ng-change="convertDateAndTime(reqitem.departure, 'departure')" is-open="datePicker.departure" close-text="X"
								tabindex="4" />
							<span class="input-group-btn">
								<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'departure')">
									<i class="glyphicon glyphicon-calendar"></i>
								</button>
							</span>
						</div>
					</div>
					<div class="col-xs-4 auto-center">
						<timepicker ng-model="reqitem.departure" show-meridian="false"
							ng-change="convertDateAndTime(reqitem.departure, 'departure')"></timepicker>
					</div>
				</div>

			</div>
			
			<div class="form-group margin-top-5">
				<label> <spring:message code="default.additional-information" />
				</label>
				<div class="custom-textarea-holder">
					<!--ui-tinymce="tinymceOptions"-->
					<textarea type="text" ng-model="reqitem.descr" class="form-control custom-textarea" tabindex="9" />
				</div>
			</div>
			<hr>
			<table class="table table-hover table-striped table-bordered">
				<thead>
					<tr>
						<th><spring:message code="label.manFoman" /></th>
						<th><spring:message code="default.fullname" /></th>
						<th><spring:message code="default.email" /></th>
						<th style="min-width: 150px;"><spring:message code="label.locationCountries" /></th>
						<th>...</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="row in requestinformation.relReqServHotelTmContactEasies">
						<td>
							<input type="checkbox" ng-model="row.manFoman" placeholder="<spring:message code="label.manFoman" />" />
						</td>
						<td>
							<input type="text" ng-model="row.label" class="form-control" />
						</td>
						<td>
							<input type="email" ng-model="row.email" class="form-control" />
						</td>
						<td>
							<select class="form-control" id="selectdictLocationCountries" ng-model="row.locationcountries"
								ng-options="row.label for row in dataLocationCountries track by row.id" tabindex="3">
							</select>
						</td>
						<td>
							<button type="button" ng-click="deleteElement(row, reqitem.relReqServHotelTmContactEasies)" class="btn button-transparent">
								<i class="glyphicon glyphicon glyphicon-trash"></i>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-group">
				<button type="button" class="btn btn-default" ng-click="add()">
					<spring:message code="default.add" />
				</button>
			</div>
			<hr>
			<div class="form-group margin-top-5">
				<button type="button" class="btn btn-success col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-3" ng-click="submit()">
					<spring:message code="default.send" />
				</button>
			</div>
		</fieldset>
	</form>
</div>