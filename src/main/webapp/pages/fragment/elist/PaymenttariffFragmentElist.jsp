<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
	<div class="scrollable-content-300">
		<ol class="list-group">
			<li class="list-group-item" ng-if="::checkVisibility('label')">
				<span class="list-group-item-caption"><spring:message code="label.label" /></span>
				<span class="pull-right">{{ ::selectedItem.label }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('servhotelroom')">
				<span class="list-group-item-caption"><spring:message code="label.servHotelRoom" /></span>
				<span class="pull-right">{{ ::selectedItem.servhotelroom.label }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('synopsys')">
				<span class="list-group-item-caption"><spring:message code="label.synopsys" /></span>
				<span class="pull-right">{{ ::selectedItem.synopsys }}</span>
			</li>

		</ol>
	</div>
</div>