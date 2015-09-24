<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('transferroute')">
						<label><spring:message code="label.transferRoute" /></label>
						<select class="form-control"
										id="selectdictTransferRoute" ng-model="item.relservtransfertransferroute.transferroute"
										ng-options="item.label for item in dataTransferRoute track by item.id"
										tabindex="1">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('servtransfer')">
						<label><spring:message code="label.servTransfer" /></label>
						<select class="form-control"
										id="selectdictServTransfer" ng-model="item.relservtransfertransferroute.servtransfer"
										ng-options="item.label for item in dataServTransfer track by item.id"
										tabindex="2">
						</select>
					</div>
				</div>
			

</div>
