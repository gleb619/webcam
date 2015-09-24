<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
	<div class="scrollable-content-300">
		<ol class="list-group">
			<li class="list-group-item" ng-show="checkVisibility('label')">
				<span class="list-group-item-caption"><spring:message code="label.label" /></span>
				<span class="pull-right">{{ selectedItem.label }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('isdeleted')">
				<span class="list-group-item-caption"><spring:message code="label.isDeleted" /></span>
				<span class="pull-right">{{ selectedItem.isdeleted }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('durationenddate')">
				<span class="list-group-item-caption"><spring:message code="label.durationEndDate" /></span>
				<span class="pull-right">{{ selectedItem.durationenddate }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('durationstartdate')">
				<span class="list-group-item-caption"><spring:message code="label.durationStartDate" /></span>
				<span class="pull-right">{{ selectedItem.durationstartdate }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('eventend')">
				<span class="list-group-item-caption"><spring:message code="label.eventEnd" /></span>
				<span class="pull-right">{{ selectedItem.eventend }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('canceltime')">
				<span class="list-group-item-caption"><spring:message code="label.cancelTime" /></span>
				<span class="pull-right">{{ selectedItem.canceltime }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('eventstart')">
				<span class="list-group-item-caption"><spring:message code="label.eventStart" /></span>
				<span class="pull-right">{{ selectedItem.eventstart }}</span>
			</li>

		</ol>
	</div>
</div>