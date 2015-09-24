<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="my-container-3 sectors-holder">
	<div class="row sector-header">
		<div class="col-md-12 without-padding">
			<div class="col-md-6 col-lg-6 without-padding">
				<div class="has-feedback filterBar">
					<input type="text"ng-model="searchKeywordReqServHotelRelReqServHotelTmContactEasy" class="form-control"
							placeholder="<spring:message code="default.searchKeyword" />"
							tabindex="1"/>
	                   	<i class="form-control-feedback glyphicon glyphicon-search"></i>
                </div>
			</div>
			<div class="btn-group col-md-6 col-lg-6 without-padding display-block toolbar-panel">
				<button type="button" 
						class="btn btn-default btn-create padding-top-2-bottom-4 
							   margin-left-0 col-xs-3 col-sm-3 col-md-3"
					ng-click="createModalNewItem()">
					<i class="fa fa-file-o pull-left"></i>
					<i class="fa fa-file pull-left"></i>
					<spring:message code="default.create" />
				</button>
				<button type="button" 
					class="btn btn-default btn-edit padding-top-2-bottom-4 
						   margin-left-0 col-xs-3 col-sm-3 col-md-3"
					ng-disabled="isDisabledEdit()"
					ng-click="editModalItem(selectedItem.id)">
					<i class="glyphicon glyphicon-pencil pull-left"></i>
					<spring:message code="default.edit" />
				</button>
				<button type="button" 
					class="btn btn-default btn-delete padding-top-2-bottom-4 
						   margin-left-0 col-xs-3 col-sm-3 col-md-3"
					ng-disabled="isDisabledEdit()"
					ng-click="deleteItem(selectedItem.id)">
					<i class="glyphicon glyphicon-trash pull-left"></i>
					<spring:message code="default.delete" />
				</button>
				<button type="button" 
					class="btn btn-default btn-reload padding-top-2-bottom-4 
						   margin-left-0 col-xs-3 col-sm-3 col-md-3"
					ng-click="reloadData()">
					<i class="glyphicon glyphicon-repeat pull-left"></i>
					<spring:message code="default.reload" />
				</button>
			</div>
		</div>
		<c:if test="${debug}">
			<a href="../data/reqservhotelrelreqservhoteltmcontacteasy" target="_blank" class="btn btn-default">
				JSON DATA
			</a>
			<a href="../data/reqservhotelrelreqservhoteltmcontacteasyview" target="_blank" class="btn btn-default">
				JSON DATA FOR VIEW
			</a>
		</c:if>
	</div>
	<div class="sector-1">
		<div class="col-md-12 without-padding scrollable-content-50">
		  <div class="table-responsive margin-bottom-5 table-body"
			when-scrolled="loadDataReqServHotelRelReqServHotelTmContactEasy()">
			<table class="table table-hover table-striped table-bordered 
						  margin-bottom-5 padding-all-2">
				<thead>
					<tr>
						<th ng-show="checkVisibility('relreqservhoteltmcontacteasiesid')"><spring:message code="label.relreqservhoteltmcontacteasiesId" /></th>
						<th ng-show="checkVisibility('reqservhotelid')"><spring:message code="label.reqServHotelId" /></th>

						<th style="width: 20px;">&nbsp;</th>
						<th style="width: 20px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="item in filteredReqServHotelRelReqServHotelTmContactEasy = ( dataReqServHotelRelReqServHotelTmContactEasy | filter:searchKeywordReqServHotelRelReqServHotelTmContactEasy )"
						ng-click="setSelectedItem(item)"
						ng-dblclick="editModalItem(item.id)"
						ng-class="{ 'success' : selectedItem.id == item.id }">
						<td ng-show="checkVisibility('relreqservhoteltmcontacteasiesid')"><label>{{ item.relreqservhoteltmcontacteasies }}</label></td>
						<td ng-show="checkVisibility('reqservhotelid')"><label>{{ item.reqservhotel }}</label></td>
						<td>
							<a ng-click="editModalItem(item.id)" class="btn">
								<i class="glyphicon glyphicons-lg glyphicon-pencil"></i> 
							</a>
						</td>
						<td>
							<a ng-click="deleteItem(item.id)" class="btn">
								<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
							</a>
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
						ng-click="searchKeywordReqServHotelRelReqServHotelTmContactEasy = ''">
						<i class="fa fa-list-alt fa-lg"></i>
						<span><spring:message code="default.total" />: {{ filteredReqServHotelRelReqServHotelTmContactEasy.length }} / {{ dataReqServHotelRelReqServHotelTmContactEasy.length }}</span>
					</button>
					<button type="button" ng-disabled="scrollable.dataLoading"
						class="btn btn-primary"
						ng-click="loadDataReqServHotelRelReqServHotelTmContactEasy()">
						<i class="fa fa-database fa-lg" ng-hide="scrollable.dataLoading"></i>
						<i class="fa fa-refresh fa-lg fa-spin" ng-show="scrollable.dataLoading"></i>
						<span><spring:message code="default.loadMore" /></span>
					</button>
  				</div>
  			</div>
		</div>
		</div>
null
	</div>
