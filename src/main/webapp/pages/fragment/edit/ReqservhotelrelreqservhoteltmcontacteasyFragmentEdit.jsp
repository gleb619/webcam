<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="row">
				<div class="col-md-4 edit-block">
						
					<div class="form-group margin-top-5" ng-show="checkVisibility('relreqservhoteltmcontacteasies')">
						<label><spring:message code="label.relreqservhoteltmcontacteasiesId" /></label>
						<input type="number" ng-model="item.reqservhotelrelreqservhoteltmcontacteasy.relreqservhoteltmcontacteasies"
							class="form-control"
							tabindex="1" />
					</div>
					<div class="form-group margin-top-5" ng-show="checkVisibility('reqservhotel')">
						<label><spring:message code="label.reqServHotelId" /></label>
						<input type="number" ng-model="item.reqservhotelrelreqservhoteltmcontacteasy.reqservhotel"
							class="form-control"
							tabindex="2" />
					</div>
				</div>
			

</div>
