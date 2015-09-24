<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
				<div class="form-group margin-top-5" ng-show="checkVisibility('tmorder')">
					<label><spring:message code="label.tmOrder" /></label>
					<div class="input-group combobox-holder">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-add" type="button"
								ng-click="addDict('tmorder', 'null', 'null', dataTmOrder)">
								<i class="fa fa-plus"></i>
							</button>
						</span>
						<input type="text" ng-model="item.relorderservices.tmorder" combobox="dataTmOrder">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-search" type="button"
								ng-click="searchDict('tmorder', 'null', 'null', dataTmOrder)">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</div>
				<div class="form-group margin-top-5" ng-show="checkVisibility('infoservices')">
					<label><spring:message code="label.infoServices" /></label>
					<div class="input-group combobox-holder">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-add" type="button"
								ng-click="addDict('infoservices', 'null', 'null', dataInfoServices)">
								<i class="fa fa-plus"></i>
							</button>
						</span>
						<input type="text" ng-model="item.relorderservices.infoservices" combobox="dataInfoServices">
						<span class="input-group-btn">
							<button class="btn btn-default combobox-holder-search" type="button"
								ng-click="searchDict('infoservices', 'null', 'null', dataInfoServices)">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</div>
				</div>
			

</div>
