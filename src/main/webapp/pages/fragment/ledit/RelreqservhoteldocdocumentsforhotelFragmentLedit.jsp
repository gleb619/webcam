<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div>
	<div class="row padding-left-right-15">
		<div class="btn-group without-padding display-block toolbar-panel margin-bottom-5">
			<button type="button" class="btn btn-default btn-create"
				ng-click="createModalItemRelReqServHotelDocDocumentsForHotel()">
				<i class="fa fa-file-o pull-left"></i>
				<i class="fa fa-file pull-left"></i>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.create" /></span>
			</button>
			<button type="button" class="btn btn-default btn-edit"
				ng-click="uploadRelReqServHotelDocDocumentsForHotel()">
				<i class="fa fa-upload pull-left"></i>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.upload" /></span>
			</button>
			<button type="button" class="btn btn-default btn-reload"
				ng-click="pickItemRelReqServHotelDocDocumentsForHotel()">
				<i class="glyphicon glyphicon-list-alt pull-left"></i>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.pick" /></span>
			</button>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive margin-bottom-5 table-body ledit-scroll">
				<table class="table table-hover table-striped table-bordered margin-bottom-5 padding-all-2">
					<thead>
						<tr>
						<th ng-if="::checkVisibility('docdocuments')">
							<div ng-click="sort('docdocuments')" >
								<a class="sortable-column-name"><span><spring:message code="label.docDocuments" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.docDocuments, 'fa-caret-up': !details.docDocuments }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('reqservhotel')">
							<div ng-click="sort('reqservhotel')" >
								<a class="sortable-column-name"><span><spring:message code="label.reqServHotel" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.reqServHotel, 'fa-caret-up': !details.reqServHotel }"></i>
							</div>
						</th>

							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in item.relReqServHotelDocDocumentsForHotels track by $index"
							ng-class="{ 'success' : selectedItemrelReqServHotelDocDocumentsForHotels.id == item.id }"
							ng-dblclick="editModalItemRelReqServHotelDocDocumentsForHotel(item.id)"
							ng-click="setSelected('selectedItemrelReqServHotelDocDocumentsForHotels', item, $index)">
						<td ng-if="::checkVisibility('docdocuments')"><label>{{ ::item.docdocuments.label }}</label></td>
						<td ng-if="::checkVisibility('reqservhotel')"><label>{{ ::item.reqservhotel.label }}</label></td>
							<td>
								<a ng-click="editModalItemRelReqServHotelDocDocumentsForHotel(item.id)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon-pencil"></i> 
								</a>
							</td>
							<td>
								<a ng-click="deleteSubItem('relReqServHotelDocDocumentsForHotels', 'RelReqServHotelDocDocumentsForHotel', item.id, $index)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ item.relReqServHotelDocDocumentsForHotels.length }}
				</div>
			</div>
		</div>
	</div>
</div>