<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="my-container-3 sectors-holder">
	<div class="row sector-header">
		<div class="without-padding margin-bottom-5"
			ng-class="{ 'col-md-1': details.isCollapsedAppEvent, 'col-md-12': !details.isCollapsedAppEvent }">
			<button type="button" class="btn btn-default btn-collapsed" ng-click="details.isCollapsedAppEvent = !details.isCollapsedAppEvent">
				<i class="fa fa-ellipsis-h" ng-show="details.isCollapsedAppEvent"></i>
				<i class="fa fa-times" ng-hide="details.isCollapsedAppEvent"></i>
			</button>
			<div ng-hide="details.isCollapsedAppEvent">
				<div class="btn-group">
					<button type="button" class="btn btn-default btn-create" ng-click="createModalNewItem()">
						<i class="fa fa-file-o pull-left"></i>
						<i class="fa fa-file pull-left"></i>
						<span>&nbsp;&nbsp;<spring:message code="default.create" /></span>
					</button>
					<button type="button" class="btn btn-default btn-edit"
						ng-disabled="isDisabledEdit()"
						ng-click="editModalItem(selectedItem.id)">
						<i class="glyphicon glyphicon-pencil pull-left"></i>
						<span>&nbsp;&nbsp;<spring:message code="default.edit" /></span>
					</button>
					<button type="button" class="btn btn-default btn-delete"
						ng-disabled="isDisabledEdit()"
						ng-click="deleteItem(selectedItem.id)">
						<i class="glyphicon glyphicon-trash pull-left"></i>
						<span>&nbsp;&nbsp;<spring:message code="default.delete" /></span>
					</button>
					<button type="button" class="btn btn-default btn-reload"
						ng-click="reloadData()">
						<i class="glyphicon glyphicon-repeat pull-left"></i>
						<span>&nbsp;&nbsp;<spring:message code="default.reload" /></span>
					</button>
				</div>
			<c:if test="${debug}">
				<div class="btn-group">
					<a href="../data/appevent?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
						JSON DATA
					</a>
					<a href="../data/appeventview?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
						JSON DATA FOR VIEW
					</a>
				</div>
			</c:if>
			</div>
		</div>
		<div class="without-padding" ng-class="{ 'col-md-11': details.isCollapsedAppEvent, 'col-md-12': !details.isCollapsedAppEvent }">
			<div class="has-feedback filterBar">
				<input type="text" ng-model="searchKeywordAppEvent" class="form-control"
						placeholder="<spring:message code="default.filterKeyword" />"
						tabindex="1"/>
                   	<i class="form-control-feedback glyphicon glyphicon-search"></i>
            </div>
		</div>
	</div>
	<div class="sector-1">
		<div class="col-md-12 without-padding"
			ng-class="{ 'scrollable-content-84': details.isDetailAppEvent, 'scrollable-content-65': !details.isDetailAppEvent }">
		  <div class="table-responsive margin-bottom-5 table-body" when-scrolled="loadDataAppEvent()">
			<table class="table table-hover table-striped table-bordered margin-bottom-5 padding-all-2">
				<thead>
					<tr>
					<c:if test="${debug}">
						<th>
							<div ng-click="sort('id')">
								<a class="sortable-column-name"><span>id</span></a>
								<i class="fa fa-caret-down" ng-show="details.id"></i>
								<i class="fa fa-caret-up" ng-hide="details.id"></i>
							</div>
						</th>
					</c:if>
						<th ng-show="checkVisibility('label')">
							<div ng-click="sort('label')" >
								<a class="sortable-column-name"><span><spring:message code="label.label" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.label"></i>
								<i class="fa fa-caret-up" ng-hide="details.label"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('isdeleted')">
							<div ng-click="sort('isdeleted')" >
								<a class="sortable-column-name"><span><spring:message code="label.isDeleted" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.isDeleted"></i>
								<i class="fa fa-caret-up" ng-hide="details.isDeleted"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('durationenddate')">
							<div ng-click="sort('durationenddate')" >
								<a class="sortable-column-name"><span><spring:message code="label.durationEndDate" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.durationEndDate"></i>
								<i class="fa fa-caret-up" ng-hide="details.durationEndDate"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('durationstartdate')">
							<div ng-click="sort('durationstartdate')" >
								<a class="sortable-column-name"><span><spring:message code="label.durationStartDate" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.durationStartDate"></i>
								<i class="fa fa-caret-up" ng-hide="details.durationStartDate"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('eventend')">
							<div ng-click="sort('eventend')" >
								<a class="sortable-column-name"><span><spring:message code="label.eventEnd" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.eventEnd"></i>
								<i class="fa fa-caret-up" ng-hide="details.eventEnd"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('canceltime')">
							<div ng-click="sort('canceltime')" >
								<a class="sortable-column-name"><span><spring:message code="label.cancelTime" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.cancelTime"></i>
								<i class="fa fa-caret-up" ng-hide="details.cancelTime"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('eventstart')">
							<div ng-click="sort('eventstart')" >
								<a class="sortable-column-name"><span><spring:message code="label.eventStart" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.eventStart"></i>
								<i class="fa fa-caret-up" ng-hide="details.eventStart"></i>
							</div>
						</th>

						<th style="width: 20px;">&nbsp;</th>
						<th style="width: 20px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="item in filteredAppEvent = ( dataAppEvent | filter:searchKeywordAppEvent | orderBy: details.sortableColumn: details.sortableReverse )"
						ng-click="setSelectedItem(item)"
						ng-dblclick="editModalItem(item.id)"
						ng-class="{ 'success' : selectedItem.id == item.id }">
					<c:if test="${debug}">
						<td>{{ item.id }}</td>
					</c:if>
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('isdeleted')" class="switch-td"><i ng-class="{'fa fa-lg fa-check': item.isDeleted, 'fa fa-lg fa-circle-o': !item.isDeleted}"></i></td>
						<td ng-show="checkVisibility('durationenddate')"><label>{{ item.durationenddate }}</label></td>
						<td ng-show="checkVisibility('durationstartdate')"><label>{{ item.durationstartdate }}</label></td>
						<td ng-show="checkVisibility('eventend')"><label>{{ item.eventEnd }}</label></td>
						<td ng-show="checkVisibility('canceltime')"><label>{{ item.cancelTime }}</label></td>
						<td ng-show="checkVisibility('eventstart')"><label>{{ item.eventStart }}</label></td>
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
					<button type="button" class="btn btn-default" ng-click="searchKeywordAppEvent = ''">
						<i class="fa fa-list-alt fa-lg"></i>
						<span> <spring:message code="default.total" />: {{ filteredAppEvent.length }} / {{ dataAppEvent.length }} </span>
					</button>
					<button type="button" class="btn btn-default btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="searchKeywordAppEvent = ''"><spring:message code="default.ShowAll" /></a></li>
						<li><a ng-click="sort('createon', false)"><spring:message code="default.ShowLast" /></a></li>
					</ul>
				</div>
				<div class="btn-group" dropdown>
					<button type="button" class="btn btn-primary" ng-click="loadDataAppEvent()" ng-disabled="scrollable.dataLoading">
						<i class="fa fa-lg" ng-class="{'fa-refresh fa-spin': scrollable.dataLoading, 'fa-database': !scrollable.dataLoading}"></i>
						<span>
							<spring:message code="default.loadMore" />
						</span>
					</button>
					<button type="button" class="btn btn-primary btn-splitter dropdown-toggle" dropdown-toggle ng-disabled="scrollable.dataLoading">
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-disabled="scrollable.dataLoading" ng-click="loadDataAppEvent()"><spring:message code="default.loadMore" /></a></li>
						<li><a ng-disabled="scrollable.dataLoading" ng-click="loadAllDataAppEvent()"><spring:message code="default.loadAll" /></a></li>
					</ul>
				</div>

  				<button type="button" class="btn btn-default" data-toggle="button"
					ng-click="details.isDetailAppEvent = !details.isDetailAppEvent">
					Detail
				</button>
  			</div>
		</div>
		</div>
	<div class="sector-2" ng-hide="details.isDetailAppEvent">
		<div class="col-md-12 separator" />
		
		<div class="col-md-12">
		<tabset >
			
			<tab>
						<tab-heading>
							<spring:message code="label.PriceSector"/>
						</tab-heading>
						
						<jsp:include page="../fragment/list/PricesectorFragmentList.jsp"/>
					</tab>
					
					<tab>
						<tab-heading>
							<spring:message code="label.PriceBooking"/>
						</tab-heading>
						
						<jsp:include page="../fragment/list/PricebookingFragmentList.jsp"/>
					</tab>
					
					<tab>
						<tab-heading>
							<spring:message code="label.AppTicket"/>
						</tab-heading>
						
						<jsp:include page="../fragment/list/AppticketFragmentList.jsp"/>
					</tab>
					
					<tab>
						<tab-heading>
							<spring:message code="label.PriceRow"/>
						</tab-heading>
						
						<jsp:include page="../fragment/list/PricerowFragmentList.jsp"/>
					</tab>
					
					<tab>
						<tab-heading>
							<spring:message code="label.PricePurchase"/>
						</tab-heading>
						
						<jsp:include page="../fragment/list/PricepurchaseFragmentList.jsp"/>
					</tab>
					
					
		</tabset>
		</div>
	</div>
	</div>
