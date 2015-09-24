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
			<li class="list-group-item" ng-show="checkVisibility('locationsector')">
				<span class="list-group-item-caption"><spring:message code="label.locationSector" /></span>
				<span class="pull-right">{{ selectedItem.locationsector.label }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('quantity')">
				<span class="list-group-item-caption"><spring:message code="label.quantity" /></span>
				<span class="pull-right">{{ selectedItem.quantity }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('row')">
				<span class="list-group-item-caption"><spring:message code="label.row" /></span>
				<span class="pull-right">{{ selectedItem.row }}</span>
			</li>

		</ol>
	</div>
</div>