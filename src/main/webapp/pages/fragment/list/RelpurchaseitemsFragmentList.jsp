<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordRelPurchaseItems" name="searchKeywordRelPurchaseItems"
							ng-model="searchKeywordRelPurchaseItems" class="form-control"
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
						<th ng-show="checkVisibility('appticket')">
							<div ng-click="sort('appticket')" >
								<a class="sortable-column-name"><span><spring:message code="label.appTicket" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.appTicket"></i>
								<i class="fa fa-caret-up" ng-hide="details.appTicket"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('pricepurchase')">
							<div ng-click="sort('pricepurchase')" >
								<a class="sortable-column-name"><span><spring:message code="label.pricePurchase" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.pricePurchase"></i>
								<i class="fa fa-caret-up" ng-hide="details.pricePurchase"></i>
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
							ng-repeat="item in filteredRelPurchaseItems = ( selectedItem.relPurchaseItemses | filter:searchKeywordRelPurchaseItems )"
							ng-click="setSelected('selectedItemrelPurchaseItemses', item, $index)"
							ng-class="{ 'success' : selectedItemrelPurchaseItemses.id == item.id }">
						<td ng-show="checkVisibility('appticket')"><label>{{ item.appticket }}</label></td>
						<td ng-show="checkVisibility('pricepurchase')"><label>{{ item.pricepurchase }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredRelPurchaseItems.length }}/{{ selectedItem.relPurchaseItemses.length }}
				</div>
			  </div>
		</div>
	</div>
</div>