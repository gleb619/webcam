<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="edit-form">
	<div ng-hide="loading">
		<div class="modal-header header" cdraggable movable-id="modal-body">
			<button type="button" class="close round-button" ng-click="cancel()">&times;</button>
			<h4 class="modal-title">
				<span ng-show="access.edit || access.simple"><spring:message code="default.edit" /></span>
				<span ng-show="access.create"><spring:message code="default.createnew" /></span>
				<spring:message code="label.LocationSeat" />
				<c:if test="${debug}">
					<span>{{ item.id }}</span>
					<a href="../data/locationseat/{{ item.id }}?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
						JSON DATA
					</a>
				</c:if>
				
				<div class="btn-group navigator">
				    <a class="btn btn-default navigator-item">
				    	<i class="fa fa-2x fa-backward"></i>
				    </a>
				    <a class="btn btn-default navigator-item">
				    	<i class="fa fa-2x fa-forward"></i>
				    </a>
				</div>
			</h4>
		</div>

		<div class="modal-body padding-top-0">
			<tabset type="pills"> 
			  <tab> 
				<tab-heading>
					<spring:message code="default.main" /> 
				</tab-heading> 
				<br/>
				<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.label"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('locationrow')">
						<label><spring:message code="label.locationRow" /></label>
						<select class="form-control"
										id="selectdictLocationRow" ng-model="item.locationrow"
										ng-options="item.label for item in dataLocationRow track by item.id"
										tabindex="2">
						</select>
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('seat')">
						<label><spring:message code="label.seat" /></label>
						<input type="number" ng-model="item.seat"
							class="form-control"
							tabindex="3" />
					</div>
				</div>
			

				</div>
			  </tab>
			  
			  <tab>
						<tab-heading>
							<spring:message code="label.AppTicket"/>
						</tab-heading>
						
						<jsp:include page="../fragment/ledit/AppticketFragmentLedit.jsp" />
					</tab>
					
					<tab>
						<tab-heading>
							<spring:message code="label.RelBookingItems"/>
						</tab-heading>
						
						<jsp:include page="../fragment/ledit/RelbookingitemsFragmentLedit.jsp" />
					</tab>
					
					
			</tabset>
		</div>
		<div class="modal-footer">
			<div class="col-xs-6 col-md-6 text-overflow">
				<a ng-click="cancel()" class="btn btn-default btn-block btn-lg">
					<span><spring:message code="default.cancel" /></span>
				</a>
			</div>
			<div class="col-xs-6 col-md-6 text-overflow">
				<a ng-click="updateItem()" class="btn btn-success btn-block btn-lg"> 
					<span><spring:message code="default.submit" /></span>
				</a>
			</div>
		</div>
  </div>
  <div ng-show="loading" ng-class="{ 'border-none': loading }" class="loading-bar-holder">
	<div id="loadingBar" class="loading-bar">
		<i class="glyphicon glyphicon-refresh fa-spin loading-spinner"></i>
	</div>
  </div>
</div>
