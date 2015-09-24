<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordRelTransferRoutePoint" name="searchKeywordRelTransferRoutePoint"
							ng-model="searchKeywordRelTransferRoutePoint" class="form-control"
							placeholder="<spring:message code="default.filterKeyword" />"
							tabindex="1"  /> 
                	<i class="form-control-feedback glyphicon glyphicon-search"></i>
                </div>
			</div>
			<div class="col-md-12">
			  <div class="table-responsive">
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
						<th ng-show="checkVisibility('servtransferroute')">
							<div ng-click="sort('servtransferroute')" >
								<a class="sortable-column-name"><span><spring:message code="label.servTransferRoute" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.servTransferRoute"></i>
								<i class="fa fa-caret-up" ng-hide="details.servTransferRoute"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('servtransferroutepoint')">
							<div ng-click="sort('servtransferroutepoint')" >
								<a class="sortable-column-name"><span><spring:message code="label.servTransferRoutePoint" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.servTransferRoutePoint"></i>
								<i class="fa fa-caret-up" ng-hide="details.servTransferRoutePoint"></i>
							</div>
						</th>

							<!--
							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
							-->
						</tr>
					</thead>
					<tbody>
						<tr
							ng-repeat="item in filteredRelTransferRoutePoint = ( selectedItem.relTransferRoutePoints | filter:searchKeywordRelTransferRoutePoint )"
							ng-click="setSelected('selectedItemrelTransferRoutePoints', item, $index)"
							ng-class="{ 'success' : selectedItemrelTransferRoutePoints.id == item.id }">
						<td ng-show="checkVisibility('servtransferroute')"><label>{{ item.servtransferroute }}</label></td>
						<td ng-show="checkVisibility('servtransferroutepoint')"><label>{{ item.servtransferroutepoint }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredRelTransferRoutePoint.length }}/{{ selectedItem.relTransferRoutePoints.length }}
				</div>
			  </div>
		</div>
	</div>
</div>