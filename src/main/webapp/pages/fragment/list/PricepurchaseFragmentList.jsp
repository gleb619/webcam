<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordPricePurchase" name="searchKeywordPricePurchase"
							ng-model="searchKeywordPricePurchase" class="form-control"
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
						<th ng-show="checkVisibility('label')">
							<div ng-click="sort('label')" >
								<a class="sortable-column-name"><span><spring:message code="label.label" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.label"></i>
								<i class="fa fa-caret-up" ng-hide="details.label"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('purchasedate')">
							<div ng-click="sort('purchasedate')" >
								<a class="sortable-column-name"><span><spring:message code="label.purchaseDate" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.purchaseDate"></i>
								<i class="fa fa-caret-up" ng-hide="details.purchaseDate"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('appevent')">
							<div ng-click="sort('appevent')" >
								<a class="sortable-column-name"><span><spring:message code="label.appEvent" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.appEvent"></i>
								<i class="fa fa-caret-up" ng-hide="details.appEvent"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('dictglobal')">
							<div ng-click="sort('dictglobal')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobal" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.dictGlobal"></i>
								<i class="fa fa-caret-up" ng-hide="details.dictGlobal"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('cost')">
							<div ng-click="sort('cost')" >
								<a class="sortable-column-name"><span><spring:message code="label.cost" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.cost"></i>
								<i class="fa fa-caret-up" ng-hide="details.cost"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('progress')">
							<div ng-click="sort('progress')" >
								<a class="sortable-column-name"><span><spring:message code="label.progress" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.progress"></i>
								<i class="fa fa-caret-up" ng-hide="details.progress"></i>
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
							ng-repeat="item in filteredPricePurchase = ( selectedItem.pricePurchases | filter:searchKeywordPricePurchase )"
							ng-click="setSelected('selectedItempricePurchases', item, $index)"
							ng-class="{ 'success' : selectedItempricePurchases.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('purchasedate')"><label>{{ item.purchasedate }}</label></td>
						<td ng-show="checkVisibility('appevent')"><label>{{ item.appevent }}</label></td>
						<td ng-show="checkVisibility('dictglobal')"><label>{{ item.dictglobal }}</label></td>
						<td ng-show="checkVisibility('cost')"><label>{{ item.cost }}</label></td>
						<td ng-show="checkVisibility('progress')"><label>{{ item.progress }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredPricePurchase.length }}/{{ selectedItem.pricePurchases.length }}
				</div>
			  </div>
		</div>
	</div>
</div>