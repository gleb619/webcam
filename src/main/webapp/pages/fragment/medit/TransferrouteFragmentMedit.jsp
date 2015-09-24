<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="edit-form">
	<div class="modal-content" ng-hide="loading">
		<div class="modal-header header" cdraggable movable-id="modal-body">
			<button type="button" class="close round-button" ng-click="cancel()">&times;</button>
			<h4 class="modal-title">
				<spring:message code="default.edit" />
				<spring:message code="label.TransferRoute" />
				<c:if test="${debug}">
					<a href="../data/transferroute/{{ item.id }}" target="_blank" class="btn btn-default">
						JSON DATA
					</a>
				</c:if>
			</h4>
		</div>
		<div class="modal-body padding-top-0">
			<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('fixedallowance')">
						<label><spring:message code="label.fixedAllowance" /></label>
						<input type="number" step="0.01" ng-model="item.fixedallowance"
							class="form-control"
							tabindex="2" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('percentageofallowances')">
						<label><spring:message code="label.percentageOfAllowances" /></label>
						<input type="number" step="0.01" ng-model="item.percentageofallowances"
							class="form-control"
							tabindex="3" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('null')">
						<input type="checkbox" ng-model="item.free" tabindex="4"/>
						<label><spring:message code="label.free" /></label>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('currcurrency')">
						<label><spring:message code="label.currCurrency" /></label>
						<select class="form-control"
										id="selectdictCurrCurrency" ng-model="item.currcurrency"
										ng-options="item.label for item in dataCurrCurrency track by item.id"
										tabindex="5">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('sum')">
						<label><spring:message code="label.sum" /></label>
						<input type="number" ng-model="item.sum"
							class="form-control"
							tabindex="6" />
					</div>
					
				</div>
				<div class="col-md-4 edit-block-2">
					
					<div class="form-group margin-top-5" ng-show="checkVisibility('driver')">
						<label><spring:message code="label.driver" /></label>
						<input type="text" ng-model="item.driver"
							class="form-control"
							tabindex="7" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('driverphone')">
						<label><spring:message code="label.driverPhone" /></label>
						<input type="text" ng-model="item.driverphone"
							class="form-control"
							tabindex="8" />
					</div>
				</div>
			

			</div>
		</div>
		<div class="modal-footer">
			<div class="col-xs-6 col-md-6">
				<a ng-click="cancel()" class="btn btn-default btn-block btn-lg">
					<spring:message code="default.cancel" />
				</a>
			</div>
			<div class="col-xs-6 col-md-6">
				<a ng-click="updateItem()"
					class="btn btn-success btn-block btn-lg"> <spring:message
						code="default.submit" />
				</a>
			</div>
		</div>
  </div>
  <div class="modal-content" ng-show="loading" ng-class="{ 'border-none': loading }">
	<div id="loadingBar" class="app-content-loading">
		<i class="glyphicon glyphicon-refresh fa-spin loading-spinner"></i>
	</div>
  </div>
</div>
