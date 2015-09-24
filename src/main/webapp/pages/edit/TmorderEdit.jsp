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
				<span ng-if="::(access.edit || access.simple)"><spring:message code="default.edit" /></span>
				<span ng-if="::access.create"><spring:message code="default.createnew" /></span>
				<spring:message code="label.TmOrder" />
				<c:if test="${debug}">
					<span>{{ item.id }}</span>
					<a href="../data/tmorder/{{ ::item.id }}?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
						JSON DATA
					</a>
				</c:if>
				<!--
				<div class="btn-group navigator">
				    <a class="btn btn-default navigator-item">
				    	<i class="fa fa-2x fa-backward"></i>
				    </a>
				    <a class="btn btn-default navigator-item">
				    	<i class="fa fa-2x fa-forward"></i>
				    </a>
				</div>
				-->
			</h4>
		</div>

		<div class="modal-body padding-top-0">
			<tabset type="pills"> 
			  <tab> 
				<tab-heading>
					<spring:message code="default.main" /> 
				</tab-heading> 
				<br/>
				<div class="row">
				<div class="col-sm-8 col-md-6 col-xs-offset-0 col-sm-offset-2 col-md-offset-3 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.label" class="form-control" tabindex="1" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('dateofconclusion')">
						<label><spring:message code="label.dateOfConclusion" /></label>
						<div class="picker-holder">
							<div class="col-xs-8">
								<div class="input-group picker-item">
									<span class="input-group-btn">
										<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'dateofconclusion')">
											<i class="glyphicon glyphicon-calendar"></i>
										</button>
									</span>
									
									<input type="text" class="form-control picker-input" ng-model="item.dateofconclusion" datepicker-popup="yyyy-MM-dd"
										ng-change="convertDateAndTime(item.dateofconclusion, 'dateofconclusion')"
										is-open="details.dateofconclusion" close-text="X" tabindex="2">
									
								</div>
							</div>
							<div class="col-xs-4 auto-center">
								<timepicker ng-model="item.dateofconclusion" show-meridian="false" ng-change="convertDateAndTime(item.dateofconclusion, 'dateofconclusion')"></timepicker>
							</div>
						</div>
					</div>


					<div class="form-group margin-top-5" ng-if="::checkVisibility('dictglobal')">
						<label><spring:message code="label.tmorder.dictglobal" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('dictglobal', 'DictGlobal', 'tmorder', dataDictGlobal)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.dictglobal"
									ng-options="item.label for item in dataDictGlobal track by item.id"
									tabindex="3">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('dictglobal', 'DictGlobal', 'tmorder', dataDictGlobal)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('tmcontact')">
						<label><spring:message code="label.tmorder.tmcontact" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('tmcontact', 'TmContact', 'tmorder', dataTmContact)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.tmcontact"
									ng-options="item.label for item in dataTmContact track by item.id"
									tabindex="4">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('tmcontact', 'TmContact', 'tmorder', dataTmContact)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('tmaccount')">
						<label><spring:message code="label.tmorder.tmaccount" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('tmaccount', 'TmAccount', 'tmorder', dataTmAccount)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.tmaccount"
									ng-options="item.label for item in dataTmAccount track by item.id"
									tabindex="5">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('tmaccount', 'TmAccount', 'tmorder', dataTmAccount)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('amountoftransaction')">
						<label><spring:message code="label.amountOfTransaction" /></label>
						<input type="number" ng-model="item.amountoftransaction" class="form-control" tabindex="6" />
					</div>
				</div>
			
				<div class="col-md-12 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('descr')">
						<label><spring:message code="label.descr" /></label>
						<div class="custom-textarea-holder">
							<!-- ui-tinymce="tinymceOptions" -->
							<!-- <textarea type="text" ng-model="item.descr" class="form-control custom-textarea" tabindex="7"> -->
							<div text-angular ng-model="item.descrinternal"></div>
							</textarea>
						</div>
					</div>
				</div>
			

				</div>
			  </tab>
			  
			  <tab select="initTab('reltmorderservgifts', 'fragmentledit')">
						<tab-heading><spring:message code="label.RelTmOrderServGifts"/></tab-heading>
						
						<div ng-if="templates.reltmorderservgifts.fragmentledit.init" ng-include="templates.reltmorderservgifts.fragmentledit.url"></div>
					</tab>
					
					<tab select="initTab('reltmordertmcontact', 'fragmentledit')">
						<tab-heading><spring:message code="label.RelTmOrderTmContact"/></tab-heading>
						
						<div ng-if="templates.reltmordertmcontact.fragmentledit.init" ng-include="templates.reltmordertmcontact.fragmentledit.url"></div>
					</tab>
					
					<tab select="initTab('paymentaccount', 'fragmentledit')">
						<tab-heading><spring:message code="label.PaymentAccount"/></tab-heading>
						
						<div ng-if="templates.paymentaccount.fragmentledit.init" ng-include="templates.paymentaccount.fragmentledit.url"></div>
					</tab>
					
					<tab select="initTab('paymentcontact', 'fragmentledit')">
						<tab-heading><spring:message code="label.PaymentContact"/></tab-heading>
						
						<div ng-if="templates.paymentcontact.fragmentledit.init" ng-include="templates.paymentcontact.fragmentledit.url"></div>
					</tab>
					
					<tab select="initTab('reltmorderinfoservices', 'fragmentledit')">
						<tab-heading><spring:message code="label.RelTmOrderInfoServices"/></tab-heading>
						
						<div ng-if="templates.reltmorderinfoservices.fragmentledit.init" ng-include="templates.reltmorderinfoservices.fragmentledit.url"></div>
					</tab>
					
					<tab select="initTab('reltmorderdocdocuments', 'fragmentledit')">
						<tab-heading><spring:message code="label.RelTmOrderDocDocuments"/></tab-heading>
						
						<div ng-if="templates.reltmorderdocdocuments.fragmentledit.init" ng-include="templates.reltmorderdocdocuments.fragmentledit.url"></div>
					</tab>
					
					
			</tabset>
		</div>
		<div class="modal-footer">
			<div class="row margin-top-15">
				<div class="col-xs-6 col-md-6 text-overflow">
					<a ng-click="cancel()" class="btn btn-default btn-block btn-lg">
						<span><spring:message code="default.cancel" /></span>
					</a>
				</div>
				<div class="col-xs-6 col-md-6 text-overflow">
					<a ng-click="updateItem()" class="btn btn-success btn-block btn-lg"> 
						<span><spring:message code="default.submit" /></span>
					</a>
				</div>
			</div>
		</div>
  </div>
  <div ng-show="loading" class="loading-bar-holder border-none">
	<div class="loading-bar">
		<i class="glyphicon glyphicon-refresh fa-spin loading-spinner"></i>
	</div>
  </div>
</div>
