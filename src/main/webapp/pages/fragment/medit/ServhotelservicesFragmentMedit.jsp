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
				<spring:message code="default.edit" /><spring:message code="label.ServHotelServices" />
			<c:if test="${debug}">
				<a href="../data/servhotelservices/{{ ::item.id }}" target="_blank" class="btn btn-default"> JSON DATA </a>
			</c:if>
			</h4>
		</div>
		<div class="modal-body padding-top-0">
			<div class="row">
				<div class="col-sm-8 col-md-6 col-xs-offset-0 col-sm-offset-2 col-md-offset-3 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.label" class="form-control" tabindex="1" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('dictglobalbyservice')">
						<label><spring:message code="label.dictGlobalByServiceId" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('dictglobalbyservice', 'DictGlobal', 'servhotelservices', dataDictGlobalByServiceId)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.dictglobalbyservice"
									ng-options="item.label for item in dataDictGlobalByServiceId track by item.id"
									tabindex="2">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('dictglobalbyservice', 'DictGlobal', 'servhotelservices', dataDictGlobalByServiceId)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('dictglobalbyfeature')">
						<label><spring:message code="label.dictGlobalByFeatureId" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('dictglobalbyfeature', 'DictGlobal', 'servhotelservices', dataDictGlobalByFeatureId)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.dictglobalbyfeature"
									ng-options="item.label for item in dataDictGlobalByFeatureId track by item.id"
									tabindex="3">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('dictglobalbyfeature', 'DictGlobal', 'servhotelservices', dataDictGlobalByFeatureId)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('name')">
						<label><spring:message code="label.name" /></label>
						<input type="text" ng-model="item.name" class="form-control" tabindex="4" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('synopsys')">
						<label><spring:message code="label.synopsys" /></label>
						<input type="text" ng-model="item.synopsys" class="form-control" tabindex="5" />
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
  <div ng-show="loading" class="loading-bar-holder border-none">
	<div class="loading-bar">
		<i class="glyphicon glyphicon-refresh fa-spin loading-spinner"></i>
	</div>
  </div>
</div>
