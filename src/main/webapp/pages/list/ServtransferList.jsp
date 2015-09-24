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
				<a href="../data/servtransfer?initLists=true&initDicts=true" 		target="_blank" class="btn btn-default"> JSON DATA </a>
				<a href="../data/servtransferview?initLists=true&initDicts=true" 	target="_blank" class="btn btn-default"> JSON DATA FOR VIEW </a>
			</div>
		</c:if>
		</div>
		<div class="without-padding col-md-12">
			<div class="has-feedback filterBar">
				<input type="text" ng-model="searchKeywordServTransfer" class="form-control"
					   ng-model-options="{ debounce: 300 }" ng-change="search('filteredServTransfer', 'dataServTransfer', 'searchKeywordServTransfer')"
					   placeholder="<spring:message code="default.filterKeyword" />">
                <i class="form-control-feedback glyphicon glyphicon-search"></i>
            </div>
		</div>
	</div>
	<div class="row sector-1">
		<div class="col-md-12 without-padding scrollable-content-65">
		  <div class="table-responsive margin-bottom-5 table-body" when-scrolled="loadDataServTransfer()">
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
						<th ng-if="::checkVisibility('datefrom')">
							<div ng-click="sort('datefrom')" >
								<a class="sortable-column-name"><span><spring:message code="label.dateFrom" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dateFrom, 'fa-caret-up': !details.dateFrom }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('dateto')">
							<div ng-click="sort('dateto')" >
								<a class="sortable-column-name"><span><spring:message code="label.dateTo" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dateTo, 'fa-caret-up': !details.dateTo }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('dictglobalbypaymenttypeid')">
							<div ng-click="sort('dictglobalbypaymenttypeid')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobalByPaymentTypeId" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dictGlobalByPaymentTypeId, 'fa-caret-up': !details.dictGlobalByPaymentTypeId }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('locationcities')">
							<div ng-click="sort('locationcities')" >
								<a class="sortable-column-name"><span><spring:message code="label.locationCities" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.locationCities, 'fa-caret-up': !details.locationCities }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('dictglobalbytransportid')">
							<div ng-click="sort('dictglobalbytransportid')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobalByTransportId" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dictGlobalByTransportId, 'fa-caret-up': !details.dictGlobalByTransportId }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('locationcountries')">
							<div ng-click="sort('locationcountries')" >
								<a class="sortable-column-name"><span><spring:message code="label.locationCountries" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.locationCountries, 'fa-caret-up': !details.locationCountries }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('currcurrency')">
							<div ng-click="sort('currcurrency')" >
								<a class="sortable-column-name"><span><spring:message code="label.currCurrency" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.currCurrency, 'fa-caret-up': !details.currCurrency }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('tmaccount')">
							<div ng-click="sort('tmaccount')" >
								<a class="sortable-column-name"><span><spring:message code="label.tmAccount" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.tmAccount, 'fa-caret-up': !details.tmAccount }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('dictglobalbytypetransferid')">
							<div ng-click="sort('dictglobalbytypetransferid')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobalByTypeTransferId" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dictGlobalByTypeTransferId, 'fa-caret-up': !details.dictGlobalByTypeTransferId }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('passengersphones')">
							<div ng-click="sort('passengersphones')" >
								<a class="sortable-column-name"><span><spring:message code="label.passengersPhones" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.passengersPhones, 'fa-caret-up': !details.passengersPhones }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('visittable')">
							<div ng-click="sort('visittable')" >
								<a class="sortable-column-name"><span><spring:message code="label.visitTable" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.visitTable, 'fa-caret-up': !details.visitTable }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('transfername')">
							<div ng-click="sort('transfername')" >
								<a class="sortable-column-name"><span><spring:message code="label.transferName" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.transferName, 'fa-caret-up': !details.transferName }"></i>
							</div>
						</th>

						<th style="width: 20px;">&nbsp;</th>
						<th style="width: 20px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<!-- <tr ng-repeat="item in filteredServTransfer = ( dataServTransfer | filter:searchKeywordServTransfer | orderBy: details.sortableColumn: details.sortableReverse )" -->
					<tr ng-repeat="item in filteredServTransfer track by $index"
						ng-click="setSelectedItem(item)"
						ng-dblclick="editModalItem(item.id)"
						ng-class="{ 'success' : selectedItem.id == item.id }">
					<c:if test="${debug}">
						<td>{{ ::item.id }}</td>
					</c:if>
						<td ng-if="::checkVisibility('label')"><label>{{ ::item.label }}</label></td>
						<td ng-if="::checkVisibility('price')"><label>{{ ::item.price }}</label></td>
						<td ng-if="::checkVisibility('datefrom')"><label>{{ ::item.datefrom }}</label></td>
						<td ng-if="::checkVisibility('dateto')"><label>{{ ::item.dateto }}</label></td>
						<td ng-if="::checkVisibility('dictglobalbypaymenttypeid')"><label>{{ ::item.dictglobalbypaymenttype }}</label></td>
						<td ng-if="::checkVisibility('locationcities')"><label>{{ ::item.locationcities }}</label></td>
						<td ng-if="::checkVisibility('dictglobalbytransportid')"><label>{{ ::item.dictglobalbytransport }}</label></td>
						<td ng-if="::checkVisibility('locationcountries')"><label>{{ ::item.locationcountries }}</label></td>
						<td ng-if="::checkVisibility('currcurrency')"><label>{{ ::item.currcurrency }}</label></td>
						<td ng-if="::checkVisibility('tmaccount')"><label>{{ ::item.tmaccount }}</label></td>
						<td ng-if="::checkVisibility('dictglobalbytypetransferid')"><label>{{ ::item.dictglobalbytypetransfer }}</label></td>
						<td ng-if="::checkVisibility('passengersphones')"><label>{{ ::item.passengersphones }}</label></td>
						<td ng-if="::checkVisibility('visittable')"><label>{{ ::item.visittable }}</label></td>
						<td ng-if="::checkVisibility('transfername')"><label>{{ ::item.transfername }}</label></td>
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
					<button type="button" class="btn btn-default" ng-click="searchKeywordServTransfer = ''">
						<i class="fa fa-list-alt fa-lg"></i>
						<span> <spring:message code="default.total" />: {{ filteredServTransfer.length }} / {{ dataServTransfer.length }} </span>
					</button>
					<button type="button" class="btn btn-default btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="searchKeywordServTransfer = ''"><spring:message code="default.ShowAll" /></a></li>
						<li><a ng-click="sort('createon', false)"><spring:message code="default.ShowLast" /></a></li>
					</ul>
				</div>
				<div class="btn-group" dropdown>
					<button type="button" class="btn btn-primary" ng-click="loadDataServTransfer()">
						<i class="fa fa-lg" ng-class="{'fa-refresh fa-spin': scrollable.dataLoading, 'fa-database': !scrollable.dataLoading}"></i>
						<span><spring:message code="default.loadMore" /></span>
					</button>
					<button type="button" class="btn btn-primary btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="loadDataServTransfer()"><spring:message code="default.loadMore" /></a></li>
						<li><a ng-click="loadAllDataServTransfer()"><spring:message code="default.loadAll" /></a></li>
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
					
					<tab select="initTab('tmincidents', 'fragmentlist')">
						<tab-heading><spring:message code="label.TmIncidents"/></tab-heading>
						
						<div ng-if="templates.tmincidents.fragmentlist.init" ng-include="templates.tmincidents.fragmentlist.url"></div>
					</tab>
					
					<tab select="initTab('servtransferroute', 'fragmentlist')">
						<tab-heading><spring:message code="label.ServTransferRoute"/></tab-heading>
						
						<div ng-if="templates.servtransferroute.fragmentlist.init" ng-include="templates.servtransferroute.fragmentlist.url"></div>
					</tab>
					
					<tab select="initTab('relservtransfertmcontact', 'fragmentlist')">
						<tab-heading><spring:message code="label.RelServTransferTmContact"/></tab-heading>
						
						<div ng-if="templates.relservtransfertmcontact.fragmentlist.init" ng-include="templates.relservtransfertmcontact.fragmentlist.url"></div>
					</tab>
					
					<tab>
						<tab-heading>
							<spring:message code="label.descr"/>
						</tab-heading>
						
						<div class="custom-textarea-holder">
							<pre ng-bind-html="selectedItem.descr"></pre>
						</div>
					</tab>
					
					
			</tabset>
		</div>
	</div>
	</div>
	<!--</div>-->
