<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="my-container-3 sectors-holder">
	<div class="row sector-header">
		<div class="without-padding margin-bottom-5">
			<div class="btn-group">
				<button type="button" class="btn btn-default btn-create" ng-click="createModalNewItem()">
					<i class="fa fa-file-o pull-left"></i>
					<i class="fa fa-file pull-left"></i>
					<span>&nbsp;&nbsp;<spring:message code="default.create" /></span>
				</button>
				<button type="button" class="btn btn-default btn-edit" ng-click="editModalItem()">
					<i class="glyphicon glyphicon-pencil pull-left"></i>
					<span>&nbsp;&nbsp;<spring:message code="default.edit" /></span>
				</button>
				<button type="button" class="btn btn-default btn-delete" ng-click="deleteItem()">
					<i class="glyphicon glyphicon-trash pull-left"></i>
					<span>&nbsp;&nbsp;<spring:message code="default.delete" /></span>
				</button>
				<button type="button" class="btn btn-default btn-reload" ng-click="reloadData()">
					<i class="glyphicon glyphicon-repeat pull-left"></i>
					<span>&nbsp;&nbsp;<spring:message code="default.reload" /></span>
				</button>
			</div>
		<c:if test="${debug}">
			<div class="btn-group">
				<a href="../data/servhotelservices?initLists=true&initDicts=true" 		target="_blank" class="btn btn-default"> JSON DATA </a>
				<a href="../data/servhotelservicesview?initLists=true&initDicts=true" 	target="_blank" class="btn btn-default"> JSON DATA FOR VIEW </a>
			</div>
		</c:if>
		</div>
		<div class="without-padding col-md-12">
			<div class="has-feedback filterBar">
				<input type="text" ng-model="searchKeywordServHotelServices" class="form-control"
					   ng-model-options="{ debounce: 300 }" ng-change="search('filteredServHotelServices', 'dataServHotelServices', 'searchKeywordServHotelServices')"
					   placeholder="<spring:message code="default.filterKeyword" />">
                <i class="form-control-feedback glyphicon glyphicon-search"></i>
            </div>
		</div>
	</div>
	<div class="row sector-1">
		<div class="col-md-12 without-padding scrollable-content-65">
		  <div class="table-responsive margin-bottom-5 table-body" when-scrolled="loadDataServHotelServices()">
			<table class="table table-hover table-striped table-bordered margin-bottom-5 padding-all-2">
				<thead>
					<tr>
					<c:if test="${debug}">
						<th>
							<div ng-click="sort('id')">
								<a class="sortable-column-name"><span>id</span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.id, 'fa-caret-up': !details.id }"></i>
							</div>
						</th>
					</c:if>
						<th ng-if="::checkVisibility('label')">
							<div ng-click="sort('label')" >
								<a class="sortable-column-name"><span><spring:message code="label.label" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.label, 'fa-caret-up': !details.label }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('dictglobalbyserviceid')">
							<div ng-click="sort('dictglobalbyserviceid')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobalByServiceId" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dictGlobalByServiceId, 'fa-caret-up': !details.dictGlobalByServiceId }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('dictglobalbyfeatureid')">
							<div ng-click="sort('dictglobalbyfeatureid')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobalByFeatureId" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dictGlobalByFeatureId, 'fa-caret-up': !details.dictGlobalByFeatureId }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('name')">
							<div ng-click="sort('name')" >
								<a class="sortable-column-name"><span><spring:message code="label.name" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.name, 'fa-caret-up': !details.name }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('synopsys')">
							<div ng-click="sort('synopsys')" >
								<a class="sortable-column-name"><span><spring:message code="label.synopsys" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.synopsys, 'fa-caret-up': !details.synopsys }"></i>
							</div>
						</th>

						<th style="width: 20px;">&nbsp;</th>
						<th style="width: 20px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<!-- <tr ng-repeat="item in filteredServHotelServices = ( dataServHotelServices | filter:searchKeywordServHotelServices | orderBy: details.sortableColumn: details.sortableReverse )" -->
					<tr ng-repeat="item in filteredServHotelServices track by $index"
						ng-click="setSelectedItem(item)"
						ng-dblclick="editModalItem(item.id)"
						ng-class="{ 'success' : selectedItem.id == item.id }">
					<c:if test="${debug}">
						<td>{{ ::item.id }}</td>
					</c:if>
						<td ng-if="::checkVisibility('label')"><label>{{ ::item.label }}</label></td>
						<td ng-if="::checkVisibility('dictglobalbyserviceid')"><label>{{ ::item.dictglobalbyservice }}</label></td>
						<td ng-if="::checkVisibility('dictglobalbyfeatureid')"><label>{{ ::item.dictglobalbyfeature }}</label></td>
						<td ng-if="::checkVisibility('name')"><label>{{ ::item.name }}</label></td>
						<td ng-if="::checkVisibility('synopsys')"><label>{{ ::item.synopsys }}</label></td>
						<td>
							<button type="button" ng-click="editModalItem(item.id)" class="btn button-transparent">
								<i class="glyphicon glyphicon-pencil"></i> 
							</button>
						</td>
						<td>
							<button type="button" ng-click="deleteItem(item.id)" class="btn button-transparent">
								<i class="glyphicon glyphicon glyphicon-trash"></i>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		  </div>
		</div>
		<div class="col-md-12 margin-bottom-10">
			<div class="btn-toolbar">
				<div class="btn-group" dropdown>
					<button type="button" class="btn btn-default" ng-click="searchKeywordServHotelServices = ''">
						<i class="fa fa-list-alt fa-lg"></i>
						<span> <spring:message code="default.total" />: {{ filteredServHotelServices.length }} / {{ dataServHotelServices.length }} </span>
					</button>
					<button type="button" class="btn btn-default btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="searchKeywordServHotelServices = ''"><spring:message code="default.ShowAll" /></a></li>
						<li><a ng-click="sort('createon', false)"><spring:message code="default.ShowLast" /></a></li>
					</ul>
				</div>
				<div class="btn-group" dropdown>
					<button type="button" class="btn btn-primary" ng-click="loadDataServHotelServices()">
						<i class="fa fa-lg" ng-class="{'fa-refresh fa-spin': scrollable.dataLoading, 'fa-database': !scrollable.dataLoading}"></i>
						<span><spring:message code="default.loadMore" /></span>
					</button>
					<button type="button" class="btn btn-primary btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="loadDataServHotelServices()"><spring:message code="default.loadMore" /></a></li>
						<li><a ng-click="loadAllDataServHotelServices()"><spring:message code="default.loadAll" /></a></li>
					</ul>
				</div>
  			</div>
		</div>
		</div>
	<div class="row sector-2">
		<div class="col-md-12 separator" />
		
		<div class="col-md-12 margin-top-15">
			<tabset >
			
					<tab select="initTab('relservhotelinfohotelservices', 'fragmentlist')">
						<tab-heading><spring:message code="label.RelServHotelInfoHotelServices"/></tab-heading>
						
						<div ng-if="templates.relservhotelinfohotelservices.fragmentlist.init" ng-include="templates.relservhotelinfohotelservices.fragmentlist.url"></div>
					</tab>
					
					
			</tabset>
		</div>
	</div>
	</div>
	<!--</div>-->
