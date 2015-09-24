<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="edit-form">
	<div ng-hide="loading">
		<div class="modal-header header">
			<button type="button" class="close round-button" ng-click="cancel()">&times;</button>
			<h4 class="modal-title">
				<span ng-show="access.edit || access.simple"><spring:message code="default.edit" /></span>
				<span ng-show="access.create"><spring:message code="default.createnew" /></span>
				<spring:message code="label.RelOrderDocs" />
				<c:if test="${debug}">
					<span>{{ item.id }}</span>
					<a href="../data/relorderdocs/{{ item.id }}?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
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
				<div class="col-md-4 edit-block">
						
				<div class="form-group margin-top-5" ng-show="checkVisibility('docdocuments')">
					<label><spring:message code="label.docDocuments" /></label>
					<div class="input-group combobox-holder">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-add" type="button"
								ng-click="addDict('docdocuments', 'DocDocuments', 'relorderdocs', dataDocDocuments)">
								<i class="fa fa-plus"></i>
							</button>
						</span>
						<input type="text" ng-model="item.docdocuments" combobox="dataDocDocuments">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-search" type="button"
								ng-click="searchDict('docdocuments', 'DocDocuments', 'relorderdocs', dataDocDocuments)">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</div>
				<div class="form-group margin-top-5" ng-show="checkVisibility('tmorder')">
					<label><spring:message code="label.tmOrder" /></label>
					<div class="input-group combobox-holder">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-add" type="button"
								ng-click="addDict('tmorder', 'TmOrder', 'relorderdocs', dataTmOrder)">
								<i class="fa fa-plus"></i>
							</button>
						</span>
						<input type="text" ng-model="item.tmorder" combobox="dataTmOrder">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-search" type="button"
								ng-click="searchDict('tmorder', 'TmOrder', 'relorderdocs', dataTmOrder)">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</div>
				</div>
			

				</div>
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
