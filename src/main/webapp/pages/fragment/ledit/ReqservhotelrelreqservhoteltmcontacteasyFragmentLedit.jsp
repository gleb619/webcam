<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div>
	<div class="row">
		<div class="padding-left-right-15">
			<div class="col-md-6 col-lg-6 without-padding">
				<div class="has-feedback searchBar">
					<input type="text" id="searchKeywordReqServHotelRelReqServHotelTmContactEasy" name="searchKeywordReqServHotelRelReqServHotelTmContactEasy"
							ng-model="searchKeywordReqServHotelRelReqServHotelTmContactEasy" class="form-control"
							placeholder="<spring:message code="default.searchKeyword" />"
							tabindex="1"  /> 
                	<i class="form-control-feedback glyphicon glyphicon-search"></i>
                </div>
			</div>
			<div class="btn-group col-md-6 col-lg-6 without-padding display-block toolbar-panel">
				<button type="button" 
					class="btn btn-default btn-reload padding-top-2-bottom-4 
						   margin-left-0 col-xs-6 col-sm-6 col-md-6"
					ng-click="pickItemReqServHotelRelReqServHotelTmContactEasy()">
					<i class="glyphicon glyphicon-list-alt pull-left"></i>
					<spring:message code="default.pick" />
				</button>
				<button type="button" 
					class="btn btn-default btn-delete padding-top-2-bottom-4 
						   margin-left-0 col-xs-6 col-sm-6 col-md-6"
					ng-click="deleteSubItem('reqServHotelRelReqServHotelTmContactEasies', 'ReqServHotelRelReqServHotelTmContactEasy', selectedItemreqServHotelRelReqServHotelTmContactEasies.id, itemIndex)">
					<i class="glyphicon glyphicon-trash pull-left"></i>
					<spring:message code="default.delete" />
				</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			  <div class="table-responsive margin-bottom-5 table-body ledit-scroll">
				<table class="table table-hover table-striped table-bordered 
						  margin-bottom-5 padding-all-2">
					<thead>
						<tr>
						<th ng-show="checkVisibility('relreqservhoteltmcontacteasiesid')"><spring:message code="label.relreqservhoteltmcontacteasiesId" /></th>
						<th ng-show="checkVisibility('reqservhotelid')"><spring:message code="label.reqServHotelId" /></th>

							<th style="width: 20px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in filteredReqServHotelRelReqServHotelTmContactEasy = ( item.reqServHotelRelReqServHotelTmContactEasies | filter:searchKeywordReqServHotelRelReqServHotelTmContactEasy )"
							ng-class="{ 'success' : selectedItemreqServHotelRelReqServHotelTmContactEasies.id == item.id }"
							ng-click="setSelected('selectedItemreqServHotelRelReqServHotelTmContactEasies', item, $index)">
						<td ng-show="checkVisibility('relreqservhoteltmcontacteasies')"><label>{{ item.relreqservhoteltmcontacteasies }}</label></td>
						<td ng-show="checkVisibility('reqservhotel')"><label>{{ item.reqservhotel }}</label></td>
							<td>
								<a ng-click="deleteSubItem('reqServHotelRelReqServHotelTmContactEasies', 'ReqServHotelRelReqServHotelTmContactEasy', item.id, $index)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ filteredReqServHotelRelReqServHotelTmContactEasy.length }}/{{ item.reqServHotelRelReqServHotelTmContactEasies.length }}
				</div>
			  </div>
		</div>
	</div>
</div>