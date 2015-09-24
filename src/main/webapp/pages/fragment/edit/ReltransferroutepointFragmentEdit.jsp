<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('servtransferroute')">
						<label><spring:message code="label.servTransferRoute" /></label>
						<select class="form-control"
										id="selectdictServTransferRoute" ng-model="item.reltransferroutepoint.servtransferroute"
										ng-options="item.label for item in dataServTransferRoute track by item.id"
										tabindex="1">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('servtransferroutepoint')">
						<label><spring:message code="label.servTransferRoutePoint" /></label>
						<input type="number" ng-model="item.reltransferroutepoint.servtransferroutepoint"
							class="form-control"
							tabindex="2" />
					</div>
				</div>
			

</div>
