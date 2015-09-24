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
				<spring:message code="label.PriceBooking" />
				<c:if test="${debug}">
					<a href="../data/pricebooking/{{ item.id }}" target="_blank" class="btn btn-default">
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
					<div class="form-group margin-top-5" ng-show="checkVisibility('appevent')">
						<label><spring:message code="label.appEvent" /></label>
						<select class="form-control"
										id="selectdictAppEvent" ng-model="item.appevent"
										ng-options="item.label for item in dataAppEvent track by item.id"
										tabindex="2">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('dictglobal')">
						<label><spring:message code="label.dictGlobal" /></label>
						<select class="form-control"
										id="selectdictDictGlobal" ng-model="item.dictglobal"
										ng-options="item.label for item in dataDictGlobal track by item.id"
										tabindex="3">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('customername')">
						<label><spring:message code="label.customerName" /></label>
						<input type="text" ng-model="item.customername"
							class="form-control"
							tabindex="4" />
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
