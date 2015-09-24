<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.pricebooking.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('appevent')">
						<label><spring:message code="label.appEvent" /></label>
						<select class="form-control"
										id="selectdictAppEvent" ng-model="item.pricebooking.appevent"
										ng-options="item.label for item in dataAppEvent track by item.id"
										tabindex="2">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('dictglobal')">
						<label><spring:message code="label.dictGlobal" /></label>
						<select class="form-control"
										id="selectdictDictGlobal" ng-model="item.pricebooking.dictglobal"
										ng-options="item.label for item in dataDictGlobal track by item.id"
										tabindex="3">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('customername')">
						<label><spring:message code="label.customerName" /></label>
						<input type="text" ng-model="item.pricebooking.customername"
							class="form-control"
							tabindex="4" />
					</div>
				</div>
			

</div>
