<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordReqServHotelRelReqServHotelTmContactEasy" name="searchKeywordReqServHotelRelReqServHotelTmContactEasy"
							ng-model="searchKeywordReqServHotelRelReqServHotelTmContactEasy" class="form-control"
							placeholder="<spring:message code="default.searchKeyword" />"
							tabindex="1"  /> 
                	<i class="form-control-feedback glyphicon glyphicon-search"></i>
                </div>
			</div>
			<div class="col-md-12">
			  <div class="table-responsive">
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
						<th ng-show="checkVisibility('relreqservhoteltmcontacteasiesid')"><spring:message code="label.relreqservhoteltmcontacteasiesId" /></th>
						<th ng-show="checkVisibility('reqservhotelid')"><spring:message code="label.reqServHotelId" /></th>

							<!--
							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
							-->
						</tr>
					</thead>
					<tbody>
						<tr
							ng-repeat="item in filteredReqServHotelRelReqServHotelTmContactEasy = ( selectedItem.reqServHotelRelReqServHotelTmContactEasies | filter:searchKeywordReqServHotelRelReqServHotelTmContactEasy )"
							ng-click="setSelected('selectedItemreqServHotelRelReqServHotelTmContactEasies', item, $index)"
							ng-class="{ 'success' : selectedItemreqServHotelRelReqServHotelTmContactEasies.id == item.id }">
						<td ng-show="checkVisibility('relreqservhoteltmcontacteasiesid')"><label>{{ item.relreqservhoteltmcontacteasies }}</label></td>
						<td ng-show="checkVisibility('reqservhotelid')"><label>{{ item.reqservhotel }}</label></td>
							<!--
							<td>
								<a ng-click="editItem(item.id)" class="btn btn-lg">
									<i class="glyphicon glyphicons-lg glyphicon-pencil"></i> 
								</a>
							</td>
							<td>
								<a ng-click="deleteItem(item.id)" class="btn btn-lg">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
							-->
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ filteredReqServHotelRelReqServHotelTmContactEasy.length }}/{{ selectedItem.reqServHotelRelReqServHotelTmContactEasies.length }}
				</div>
			  </div>
		</div>
	</div>
</div>