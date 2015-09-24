<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="my-container-3 sectors-holder">
	<div class="row sector-header">
		<div collapse="details.isCollapsedInfoStayPeriod" class="col-md-12 without-padding margin-bottom-5">
			<button type="button" class="btn btn-default" ng-click="details.isCollapsedInfoStayPeriod = !details.isCollapsedInfoStayPeriod">
				<span>X</span>
			</button>
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
			<a href="../data/infostayperiod?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
				JSON DATA
			</a>
			<a href="../data/infostayperiodview?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
				JSON DATA FOR VIEW
			</a>
		</c:if>
		</div>
		<div class="col-md-12 without-padding">
			<div class="has-feedback filterBar">
				<input type="text"ng-model="searchKeywordInfoStayPeriod" class="form-control"
						placeholder="<spring:message code="default.searchKeyword" />"
						tabindex="1"/>
                   	<i class="form-control-feedback glyphicon glyphicon-search"></i>
            </div>
		</div>
	</div>
	<div class="sector-1">
		<div class="col-md-12 without-padding"
			ng-class="{ 'scrollable-content-84': details.isDetailInfoStayPeriod, 'scrollable-content-65': !details.isDetailInfoStayPeriod }">
		  <div class="table-responsive margin-bottom-5 table-body" when-scrolled="loadDataInfoStayPeriod()">
			<table class="table table-hover table-striped table-bordered margin-bottom-5 padding-all-2">
				<thead>
					<tr>
						<th ng-show="checkVisibility('label')">
							<div ng-click="sort('label')" >
								<a class="sortable-column-name"><span><spring:message code="label.label" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.label"></i>
								<i class="fa fa-caret-up" ng-hide="details.label"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('race')">
							<div ng-click="sort('race')" >
								<a class="sortable-column-name"><span><spring:message code="label.race" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.race"></i>
								<i class="fa fa-caret-up" ng-hide="details.race"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('departure')">
							<div ng-click="sort('departure')" >
								<a class="sortable-column-name"><span><spring:message code="label.departure" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.departure"></i>
								<i class="fa fa-caret-up" ng-hide="details.departure"></i>
							</div>
						</th>

						<th style="width: 20px;">&nbsp;</th>
						<th style="width: 20px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="item in filteredInfoStayPeriod = ( dataInfoStayPeriod | filter:searchKeywordInfoStayPeriod | orderBy: details.sortableColumn: details.sortableReverse )"
						ng-click="setSelectedItem(item)"
						ng-dblclick="editModalItem(item.id)"
						ng-class="{ 'success' : selectedItem.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('race')"><label>{{ item.race }}</label></td>
						<td ng-show="checkVisibility('departure')"><label>{{ item.departure }}</label></td>
						<td>
							<button type="button" ng-click="editModalItem(item.id)" class="btn">
								<i class="glyphicon glyphicon-pencil"></i> 
							</button>
						</td>
						<td>
							<button type="button" ng-click="deleteItem(item.id)" class="btn">
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
  				<div class="btn-group">
					<button type="button" class="btn btn-default"
						ng-click="searchKeywordInfoStayPeriod = ''">
						<i class="fa fa-list-alt fa-lg"></i>
						<span><spring:message code="default.total" />: {{ filteredInfoStayPeriod.length }} / {{ dataInfoStayPeriod.length }}</span>
					</button>
					<button type="button" ng-disabled="scrollable.dataLoading" class="btn btn-primary"
						ng-click="loadDataInfoStayPeriod()">
						<i class="fa fa-database fa-lg" ng-hide="scrollable.dataLoading"></i>
						<i class="fa fa-refresh fa-lg fa-spin" ng-show="scrollable.dataLoading"></i>
						<span><spring:message code="default.loadMore" /></span>
					</button>
  				</div>
  				
  				<button type="button" class="btn btn-default" data-toggle="button"
					ng-click="details.isDetailInfoStayPeriod = !details.isDetailInfoStayPeriod">
					Detail
				</button>
  			</div>
		</div>
		</div>
	<div class="sector-2" ng-hide="details.isDetailInfoStayPeriod">
		<div class="col-md-12 separator" />
		
		<div class="col-md-12">
		<tabset >
			
			<tab>
						<tab-heading>
							<spring:message code="label.ReqServHotel"/>
						</tab-heading>
						
						<jsp:include page="../fragment/list/ReqservhotelFragmentList.jsp"/>
					</tab>
					
					
		</tabset>
		</div>
	</div>
	</div>
