<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="edit-form">
	<div ng-if="!loading" class="edit-form-body">
		<div class="modal-header header">
			<button type="button" class="close round-button" ng-click="cancel()">&times;</button>
			<h4 class="modal-title">
				<span ng-if="::(access.edit || access.simple)"><spring:message code="default.edit" /></span>
				<span ng-if="::access.create"><spring:message code="default.createnew" /></span>
				<spring:message code="label.LocationAddress" />
				<c:if test="${debug}">
					<span>{{ item.id }}</span>
					<a href="../data/locationaddress/{{ ::item.id }}?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
						JSON DATA
					</a>
				</c:if>
				<!--
				<div class="btn-group navigator">
				    <a class="btn btn-default navigator-item">
				    	<i class="fa fa-2x fa-backward"></i>
				    </a>
				    <a class="btn btn-default navigator-item">
				    	<i class="fa fa-2x fa-forward"></i>
				    </a>
				</div>
				-->
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
				<div class="col-md-6 col-lg-4 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.label" class="form-control" tabindex="1" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('gmappointx')">
						<label><spring:message code="label.gmapPointX" /></label>
						<input type="text" ng-model="item.gmappointx" class="form-control" tabindex="2" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('nameeng')">
						<label><spring:message code="label.nameeng" /></label>
						<input type="text" ng-model="item.nameeng" class="form-control" tabindex="3" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('gmappointy')">
						<label><spring:message code="label.gmapPointY" /></label>
						<input type="text" ng-model="item.gmappointy" class="form-control" tabindex="4" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('metro')">
						<label><spring:message code="label.metro" /></label>
						<input type="text" ng-model="item.metro" class="form-control" tabindex="5" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('name')">
						<label><spring:message code="label.name" /></label>
						<input type="text" ng-model="item.name" class="form-control" tabindex="6" />
					</div>
				</div>
			
				<div class="col-md-6 col-lg-4 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('roadmap')">
						<label><spring:message code="label.roadMap" /></label>
						<input type="text" ng-model="item.roadmap" class="form-control" tabindex="7" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('yandexmappointx')">
						<label><spring:message code="label.yandexMapPointX" /></label>
						<input type="text" ng-model="item.yandexmappointx" class="form-control" tabindex="8" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('yandexmappointy')">
						<label><spring:message code="label.yandexMapPointY" /></label>
						<input type="text" ng-model="item.yandexmappointy" class="form-control" tabindex="9" />
					</div>
				</div>
			

				</div>
			  </tab>
			  
			  
			</tabset>
		</div>
		<div class="modal-footer">
			<div class="row margin-top-15">
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
  </div>
  <div ng-show="loading" class="loading-bar-holder border-none">
	<div class="loading-bar">
		<i class="glyphicon glyphicon-refresh fa-spin loading-spinner"></i>
	</div>
  </div>
</div>
