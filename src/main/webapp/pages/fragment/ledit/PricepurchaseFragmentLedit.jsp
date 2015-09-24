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
					<input type="text" ng-model="searchKeywordPricePurchase" class="form-control"
							placeholder="<spring:message code="default.searchKeyword" />"
							tabindex="1"  /> 
                	<i class="form-control-feedback glyphicon glyphicon-search"></i>
                </div>
			</div>
			<div class="btn-group col-md-6 col-lg-6 without-padding display-block toolbar-panel">
				<button type="button" 
						class="btn btn-default btn-create padding-top-2-bottom-4 
							   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="createModalItemPricePurchase()">
					<i class="fa fa-file-o pull-left"></i>
					<i class="fa fa-file pull-left"></i>
					<spring:message code="default.create" />
				</button>
				<button type="button" 
					class="btn btn-default btn-edit padding-top-2-bottom-4 
						   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="editModalItemPricePurchase(selectedItempricePurchases.id)">
					<i class="glyphicon glyphicon-pencil pull-left"></i>
					<spring:message code="default.edit" />
				</button>
				<button type="button" 
					class="btn btn-default btn-delete padding-top-2-bottom-4 
						   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="deleteSubItem('pricePurchases', 'PricePurchase', selectedItempricePurchases.id, itemIndex)">
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

							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in filteredPricePurchase = ( item.pricePurchases | filter:searchKeywordPricePurchase )"
							ng-class="{ 'success' : selectedItempricePurchases.id == item.id }"
							ng-dblclick="editModalItemPricePurchase(item.id)"
							ng-click="setSelected('selectedItempricePurchases', item, $index)">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('purchasedate')"><label>{{ item.purchasedate }}</label></td>
						<td ng-show="checkVisibility('appevent')"><label>{{ item.appevent.label }}</label></td>
						<td ng-show="checkVisibility('dictglobal')"><label>{{ item.dictglobal.label }}</label></td>
						<td ng-show="checkVisibility('cost')"><label>{{ item.cost }}</label></td>
						<td ng-show="checkVisibility('progress')"><label>{{ item.progress }}</label></td>
							<td>
								<a ng-click="editModalItemPricePurchase(item.id)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon-pencil"></i> 
								</a>
							</td>
							<td>
								<a ng-click="deleteSubItem('pricePurchases', 'PricePurchase', item.id, $index)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ filteredPricePurchase.length }}/{{ item.pricePurchases.length }}
				</div>
			</div>
		</div>
	</div>
</div>