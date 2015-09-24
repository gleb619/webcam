<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="edit-form">
	<div ng-if="!loading" class="edit-form-body">
		<div class="modal-header header">
			<button type="button" class="close round-button" ng-click="cancel()">&times;</button>
			<h4 class="modal-title">
				<spring:message code="default.edit" /><spring:message code="label.ReqServHotel" />
			<c:if test="${debug}">
				<a href="../data/reqservhotel/{{ ::item.id }}" target="_blank" class="btn btn-default"> JSON DATA </a>
			</c:if>
			</h4>
		</div>
		<div class="modal-body padding-top-0">
			<div class="row">
				<div class="col-md-6 col-lg-4 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.label" class="form-control" tabindex="1" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('price')">
						<label><spring:message code="label.price" /></label>
						<input type="number" step="0.01" ng-model="item.price" class="form-control" tabindex="2" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('accept')">
						<input type="checkbox" ng-model="item.accept" tabindex="3"/>
						<label><spring:message code="label.accept" /></label>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('decline')">
						<input type="checkbox" ng-model="item.decline" tabindex="4"/>
						<label><spring:message code="label.decline" /></label>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('race')">
						<label><spring:message code="label.race" /></label>
						<div class="picker-holder">
							<div class="col-xs-8">
								<div class="input-group picker-item">
									<span class="input-group-btn">
										<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'race')">
											<i class="glyphicon glyphicon-calendar"></i>
										</button>
									</span>
									
									<input type="text" class="form-control picker-input" ng-model="item.race" datepicker-popup="yyyy-MM-dd"
										ng-change="convertDateAndTime(item.race, 'race')"
										is-open="details.race" close-text="X" tabindex="5">
									
								</div>
							</div>
							<div class="col-xs-4 auto-center">
								<timepicker ng-model="item.race" show-meridian="false" ng-change="convertDateAndTime(item.race, 'race')"></timepicker>
							</div>
						</div>
					</div>


					<div class="form-group margin-top-5" ng-if="::checkVisibility('departure')">
						<label><spring:message code="label.departure" /></label>
						<div class="picker-holder">
							<div class="col-xs-8">
								<div class="input-group picker-item">
									<span class="input-group-btn">
										<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'departure')">
											<i class="glyphicon glyphicon-calendar"></i>
										</button>
									</span>
									
									<input type="text" class="form-control picker-input" ng-model="item.departure" datepicker-popup="yyyy-MM-dd"
										ng-change="convertDateAndTime(item.departure, 'departure')"
										is-open="details.departure" close-text="X" tabindex="6">
									
								</div>
							</div>
							<div class="col-xs-4 auto-center">
								<timepicker ng-model="item.departure" show-meridian="false" ng-change="convertDateAndTime(item.departure, 'departure')"></timepicker>
							</div>
						</div>
					</div>

				</div>
			
				<div class="col-md-6 col-lg-4 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('dictglobalbypaymenttype')">
						<label><spring:message code="label.dictGlobalByPaymentTypeId" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('dictglobalbypaymenttype', 'DictGlobal', 'reqservhotel', dataDictGlobalByPaymentTypeId)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.dictglobalbypaymenttype"
									ng-options="item.label for item in dataDictGlobalByPaymentTypeId track by item.id"
									tabindex="7">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('dictglobalbypaymenttype', 'DictGlobal', 'reqservhotel', dataDictGlobalByPaymentTypeId)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('usersbyrequestuser')">
						<label><spring:message code="label.usersByRequestUserId" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('usersbyrequestuser', 'Users', 'reqservhotel', dataUsersByRequestUserId)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.usersbyrequestuser"
									ng-options="item.label for item in dataUsersByRequestUserId track by item.id"
									tabindex="8">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('usersbyrequestuser', 'Users', 'reqservhotel', dataUsersByRequestUserId)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('usersbyresponseuser')">
						<label><spring:message code="label.usersByResponseUserId" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('usersbyresponseuser', 'Users', 'reqservhotel', dataUsersByResponseUserId)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.usersbyresponseuser"
									ng-options="item.label for item in dataUsersByResponseUserId track by item.id"
									tabindex="9">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('usersbyresponseuser', 'Users', 'reqservhotel', dataUsersByResponseUserId)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('dictglobalbyplacement')">
						<label><spring:message code="label.dictGlobalByPlacementId" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('dictglobalbyplacement', 'DictGlobal', 'reqservhotel', dataDictGlobalByPlacementId)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.dictglobalbyplacement"
									ng-options="item.label for item in dataDictGlobalByPlacementId track by item.id"
									tabindex="10">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('dictglobalbyplacement', 'DictGlobal', 'reqservhotel', dataDictGlobalByPlacementId)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('servhotelroom')">
						<label><spring:message code="label.servHotelRoom" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('servhotelroom', 'ServHotelRoom', 'reqservhotel', dataServHotelRoom)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.servhotelroom"
									ng-options="item.label for item in dataServHotelRoom track by item.id"
									tabindex="11">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('servhotelroom', 'ServHotelRoom', 'reqservhotel', dataServHotelRoom)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('servhotel')">
						<label><spring:message code="label.servHotel" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('servhotel', 'ServHotel', 'reqservhotel', dataServHotel)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.servhotel"
									ng-options="item.label for item in dataServHotel track by item.id"
									tabindex="12">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('servhotel', 'ServHotel', 'reqservhotel', dataServHotel)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>
				</div>
			
				<div class="col-md-6 col-lg-4 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('roomcount')">
						<label><spring:message code="label.roomCount" /></label>
						<input type="number" ng-model="item.roomcount" class="form-control" tabindex="13" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('progress')">
						<label><spring:message code="label.progress" /></label>
						<input type="number" ng-model="item.progress" class="form-control" tabindex="14" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('hotelcaption')">
						<label><spring:message code="label.hotelCaption" /></label>
						<input type="text" ng-model="item.hotelcaption" class="form-control" tabindex="15" />
					</div>
				</div>
			
				<div class="col-md-12 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('descrinternal')">
						<label><spring:message code="label.descrInternal" /></label>
						<div class="custom-textarea-holder">
							<!-- ui-tinymce="tinymceOptions" -->
							<!-- <textarea type="text" ng-model="item.descrinternal" class="form-control custom-textarea" tabindex="16"> -->
							<div text-angular ng-model="item.descrinternal"></div>
							</textarea>
						</div>
					</div>
				</div>
			
				<div class="col-md-12 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('descr')">
						<label><spring:message code="label.descr" /></label>
						<div class="custom-textarea-holder">
							<!-- ui-tinymce="tinymceOptions" -->
							<!-- <textarea type="text" ng-model="item.descr" class="form-control custom-textarea" tabindex="17"> -->
							<div text-angular ng-model="item.descrinternal"></div>
							</textarea>
						</div>
					</div>
				</div>
			

			</div>
		</div>
		<div class="modal-footer">
			<div class="col-xs-6 col-md-6">
				<a ng-click="cancel()" class="btn btn-default btn-block btn-lg">
					<spring:message code="default.cancel" />
				</a>
			</div>
			<div class="col-xs-6 col-md-6">
				<a ng-click="updateItem()"
					class="btn btn-success btn-block btn-lg"> <spring:message
						code="default.submit" />
				</a>
			</div>
		</div>
  </div>
  <div ng-show="loading" class="loading-bar-holder border-none">
	<div class="loading-bar">
		<i class="glyphicon glyphicon-refresh fa-spin loading-spinner"></i>
	</div>
  </div>
</div>
