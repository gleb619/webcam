<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
	<div class="scrollable-content-300">
		<ol class="list-group">
			<li class="list-group-item" ng-if="::checkVisibility('contact')">
				<span class="list-group-item-caption"><spring:message code="label.contact" /></span>
				<span class="pull-right">{{ ::selectedItem.contact }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('label')">
				<span class="list-group-item-caption"><spring:message code="label.label" /></span>
				<span class="pull-right">{{ ::selectedItem.label }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('email3')">
				<span class="list-group-item-caption"><spring:message code="label.email3" /></span>
				<span class="pull-right">{{ ::selectedItem.email3 }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('email2')">
				<span class="list-group-item-caption"><spring:message code="label.email2" /></span>
				<span class="pull-right">{{ ::selectedItem.email2 }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('website')">
				<span class="list-group-item-caption"><spring:message code="label.website" /></span>
				<span class="pull-right">{{ ::selectedItem.website }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('phone')">
				<span class="list-group-item-caption"><spring:message code="label.phone" /></span>
				<span class="pull-right">{{ ::selectedItem.phone }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('phone2')">
				<span class="list-group-item-caption"><spring:message code="label.phone2" /></span>
				<span class="pull-right">{{ ::selectedItem.phone2 }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('phone3')">
				<span class="list-group-item-caption"><spring:message code="label.phone3" /></span>
				<span class="pull-right">{{ ::selectedItem.phone3 }}</span>
			</li>
			<li class="list-group-item" ng-if="::checkVisibility('email')">
				<span class="list-group-item-caption"><spring:message code="label.email" /></span>
				<span class="pull-right">{{ ::selectedItem.email }}</span>
			</li>

		</ol>
	</div>
</div>