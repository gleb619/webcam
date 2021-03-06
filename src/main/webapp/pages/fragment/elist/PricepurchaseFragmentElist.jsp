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
			<li class="list-group-item" ng-show="checkVisibility('purchasedate')">
				<span class="list-group-item-caption"><spring:message code="label.purchaseDate" /></span>
				<span class="pull-right">{{ selectedItem.purchasedate }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('appevent')">
				<span class="list-group-item-caption"><spring:message code="label.appEvent" /></span>
				<span class="pull-right">{{ selectedItem.appevent.label }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('dictglobal')">
				<span class="list-group-item-caption"><spring:message code="label.dictGlobal" /></span>
				<span class="pull-right">{{ selectedItem.dictglobal.label }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('cost')">
				<span class="list-group-item-caption"><spring:message code="label.cost" /></span>
				<span class="pull-right">{{ selectedItem.cost }}</span>
			</li>
			<li class="list-group-item" ng-show="checkVisibility('progress')">
				<span class="list-group-item-caption"><spring:message code="label.progress" /></span>
				<span class="pull-right">{{ selectedItem.progress }}</span>
			</li>

		</ol>
	</div>
</div>