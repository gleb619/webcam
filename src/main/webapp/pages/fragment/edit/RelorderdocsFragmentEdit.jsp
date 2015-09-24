<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
				<div class="form-group margin-top-5" ng-show="checkVisibility('docdocuments')">
					<label><spring:message code="label.docDocuments" /></label>
					<div class="input-group combobox-holder">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-add" type="button"
								ng-click="addDict('docdocuments', 'null', 'null', dataDocDocuments)">
								<i class="fa fa-plus"></i>
							</button>
						</span>
						<input type="text" ng-model="item.relorderdocs.docdocuments" combobox="dataDocDocuments">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-search" type="button"
								ng-click="searchDict('docdocuments', 'null', 'null', dataDocDocuments)">
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
								ng-click="addDict('tmorder', 'null', 'null', dataTmOrder)">
								<i class="fa fa-plus"></i>
							</button>
						</span>
						<input type="text" ng-model="item.relorderdocs.tmorder" combobox="dataTmOrder">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-search" type="button"
								ng-click="searchDict('tmorder', 'null', 'null', dataTmOrder)">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</div>
				</div>
			

</div>
