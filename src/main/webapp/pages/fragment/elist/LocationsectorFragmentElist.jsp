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
			<li class="list-group-item" ng-show="checkVisibility('locationstadium')">
				<span class="list-group-item-caption"><spring:message code="label.locationStadium" /></span>
				<span class="pull-right">{{ selectedItem.locationstadium.label }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('quantity')">
				<span class="list-group-item-caption"><spring:message code="label.quantity" /></span>
				<span class="pull-right">{{ selectedItem.quantity }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('color')">
				<span class="list-group-item-caption"><spring:message code="label.color" /></span>
				<span class="pull-right">{{ selectedItem.color }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('name')">
				<span class="list-group-item-caption"><spring:message code="label.name" /></span>
				<span class="pull-right">{{ selectedItem.name }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('maplocation')">
				<span class="list-group-item-caption"><spring:message code="label.mapLocation" /></span>
				<span class="pull-right">{{ selectedItem.maplocation }}</span>
			</li>

		</ol>
	</div>
</div>