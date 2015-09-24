<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('appticket')">
						<label><spring:message code="label.appTicket" /></label>
						<select class="form-control"
										id="selectdictAppTicket" ng-model="item.relpurchaseitems.appticket"
										ng-options="item.label for item in dataAppTicket track by item.id"
										tabindex="1">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('pricepurchase')">
						<label><spring:message code="label.pricePurchase" /></label>
						<select class="form-control"
										id="selectdictPricePurchase" ng-model="item.relpurchaseitems.pricepurchase"
										ng-options="item.label for item in dataPricePurchase track by item.id"
										tabindex="2">
						</select>
					</div>
				</div>
			

</div>
