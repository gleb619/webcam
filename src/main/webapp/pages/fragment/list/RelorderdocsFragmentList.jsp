<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordRelOrderDocs" name="searchKeywordRelOrderDocs"
							ng-model="searchKeywordRelOrderDocs" class="form-control"
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
						<th ng-show="checkVisibility('docdocuments')">
							<div ng-click="sort('docdocuments')" >
								<a class="sortable-column-name"><span><spring:message code="label.docDocuments" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.docDocuments"></i>
								<i class="fa fa-caret-up" ng-hide="details.docDocuments"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('tmorder')">
							<div ng-click="sort('tmorder')" >
								<a class="sortable-column-name"><span><spring:message code="label.tmOrder" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.tmOrder"></i>
								<i class="fa fa-caret-up" ng-hide="details.tmOrder"></i>
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
							ng-repeat="item in filteredRelOrderDocs = ( selectedItem.relOrderDocses | filter:searchKeywordRelOrderDocs )"
							ng-click="setSelected('selectedItemrelOrderDocses', item, $index)"
							ng-class="{ 'success' : selectedItemrelOrderDocses.id == item.id }">
						<td ng-show="checkVisibility('docdocuments')"><label>{{ item.docdocuments }}</label></td>
						<td ng-show="checkVisibility('tmorder')"><label>{{ item.tmorder }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredRelOrderDocs.length }}/{{ selectedItem.relOrderDocses.length }}
				</div>
			  </div>
		</div>
	</div>
</div>