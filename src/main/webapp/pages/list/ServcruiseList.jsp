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
				<a href="../data/servcruise?initLists=true&initDicts=true" 		target="_blank" class="btn btn-default"> JSON DATA </a>
				<a href="../data/servcruiseview?initLists=true&initDicts=true" 	target="_blank" class="btn btn-default"> JSON DATA FOR VIEW </a>
			</div>
		</c:if>
		</div>
		<div class="without-padding col-md-12">
			<div class="has-feedback filterBar">
				<input type="text" ng-model="searchKeywordServCruise" class="form-control"
					   ng-model-options="{ debounce: 300 }" ng-change="search('filteredServCruise', 'dataServCruise', 'searchKeywordServCruise')"
					   placeholder="<spring:message code="default.filterKeyword" />">
                <i class="form-control-feedback glyphicon glyphicon-search"></i>
            </div>
		</div>
	</div>
	<div class="row sector-1">
		<div class="col-md-12 without-padding scrollable-content-65">
		  <div class="table-responsive margin-bottom-5 table-body" when-scrolled="loadDataServCruise()">
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
						<th ng-if="::checkVisibility('price')">
							<div ng-click="sort('price')" >
								<a class="sortable-column-name"><span><spring:message code="label.price" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.price, 'fa-caret-up': !details.price }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('dictglobal')">
							<div ng-click="sort('dictglobal')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobal" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dictGlobal, 'fa-caret-up': !details.dictGlobal }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('tmaccount')">
							<div ng-click="sort('tmaccount')" >
								<a class="sortable-column-name"><span><spring:message code="label.tmAccount" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.tmAccount, 'fa-caret-up': !details.tmAccount }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('cabinsnumber')">
							<div ng-click="sort('cabinsnumber')" >
								<a class="sortable-column-name"><span><spring:message code="label.cabinsNumber" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.cabinsNumber, 'fa-caret-up': !details.cabinsNumber }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('childrencount')">
							<div ng-click="sort('childrencount')" >
								<a class="sortable-column-name"><span><spring:message code="label.childrenCount" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.childrenCount, 'fa-caret-up': !details.childrenCount }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('cruisename')">
							<div ng-click="sort('cruisename')" >
								<a class="sortable-column-name"><span><spring:message code="label.cruiseName" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.cruiseName, 'fa-caret-up': !details.cruiseName }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('cruisedescr')">
							<div ng-click="sort('cruisedescr')" >
								<a class="sortable-column-name"><span><spring:message code="label.cruiseDescr" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.cruiseDescr, 'fa-caret-up': !details.cruiseDescr }"></i>
							</div>
						</th>

						<th style="width: 20px;">&nbsp;</th>
						<th style="width: 20px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<!-- <tr ng-repeat="item in filteredServCruise = ( dataServCruise | filter:searchKeywordServCruise | orderBy: details.sortableColumn: details.sortableReverse )" -->
					<tr ng-repeat="item in filteredServCruise track by $index"
						ng-click="setSelectedItem(item)"
						ng-dblclick="editModalItem(item.id)"
						ng-class="{ 'success' : selectedItem.id == item.id }">
					<c:if test="${debug}">
						<td>{{ ::item.id }}</td>
					</c:if>
						<td ng-if="::checkVisibility('label')"><label>{{ ::item.label }}</label></td>
						<td ng-if="::checkVisibility('price')"><label>{{ ::item.price }}</label></td>
						<td ng-if="::checkVisibility('dictglobal')"><label>{{ ::item.dictglobal }}</label></td>
						<td ng-if="::checkVisibility('tmaccount')"><label>{{ ::item.tmaccount }}</label></td>
						<td ng-if="::checkVisibility('cabinsnumber')"><label>{{ ::item.cabinsnumber }}</label></td>
						<td ng-if="::checkVisibility('childrencount')"><label>{{ ::item.childrencount }}</label></td>
						<td ng-if="::checkVisibility('cruisename')"><label>{{ ::item.cruisename }}</label></td>
						<td ng-if="::checkVisibility('cruisedescr')"><label>{{ ::item.cruisedescr }}</label></td>
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
					<button type="button" class="btn btn-default" ng-click="searchKeywordServCruise = ''">
						<i class="fa fa-list-alt fa-lg"></i>
						<span> <spring:message code="default.total" />: {{ filteredServCruise.length }} / {{ dataServCruise.length }} </span>
					</button>
					<button type="button" class="btn btn-default btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="searchKeywordServCruise = ''"><spring:message code="default.ShowAll" /></a></li>
						<li><a ng-click="sort('createon', false)"><spring:message code="default.ShowLast" /></a></li>
					</ul>
				</div>
				<div class="btn-group" dropdown>
					<button type="button" class="btn btn-primary" ng-click="loadDataServCruise()">
						<i class="fa fa-lg" ng-class="{'fa-refresh fa-spin': scrollable.dataLoading, 'fa-database': !scrollable.dataLoading}"></i>
						<span><spring:message code="default.loadMore" /></span>
					</button>
					<button type="button" class="btn btn-primary btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="loadDataServCruise()"><spring:message code="default.loadMore" /></a></li>
						<li><a ng-click="loadAllDataServCruise()"><spring:message code="default.loadAll" /></a></li>
					</ul>
				</div>
  			</div>
		</div>
		</div>
	<div class="row sector-2">
		<div class="col-md-12 separator" />
		
		<div class="col-md-12 margin-top-15">
			<tabset >
			
					<tab select="initTab('infoservices', 'fragmentlist')">
						<tab-heading><spring:message code="label.InfoServices"/></tab-heading>
						
						<div ng-if="templates.infoservices.fragmentlist.init" ng-include="templates.infoservices.fragmentlist.url"></div>
					</tab>
					
					<tab select="initTab('reqcruisehotels', 'fragmentlist')">
						<tab-heading><spring:message code="label.ReqCruiseHotels"/></tab-heading>
						
						<div ng-if="templates.reqcruisehotels.fragmentlist.init" ng-include="templates.reqcruisehotels.fragmentlist.url"></div>
					</tab>
					
					<tab select="initTab('relcruisecontacts', 'fragmentlist')">
						<tab-heading><spring:message code="label.RelCruiseContacts"/></tab-heading>
						
						<div ng-if="templates.relcruisecontacts.fragmentlist.init" ng-include="templates.relcruisecontacts.fragmentlist.url"></div>
					</tab>
					
					<tab select="initTab('reqcruiseservices', 'fragmentlist')">
						<tab-heading><spring:message code="label.ReqCruiseServices"/></tab-heading>
						
						<div ng-if="templates.reqcruiseservices.fragmentlist.init" ng-include="templates.reqcruiseservices.fragmentlist.url"></div>
					</tab>
					
					<tab select="initTab('relcruisedocs', 'fragmentlist')">
						<tab-heading><spring:message code="label.RelCruiseDocs"/></tab-heading>
						
						<div ng-if="templates.relcruisedocs.fragmentlist.init" ng-include="templates.relcruisedocs.fragmentlist.url"></div>
					</tab>
					
					
			</tabset>
		</div>
	</div>
	</div>
	<!--</div>-->
