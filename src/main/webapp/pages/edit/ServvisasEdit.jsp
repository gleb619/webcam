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
				<spring:message code="label.ServVisas" />
				<c:if test="${debug}">
					<span>{{ item.id }}</span>
					<a href="../data/servvisas/{{ ::item.id }}?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
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
				<div class="col-md-6 col-lg-4 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('label')">
						<label><spring:message code="label.label" /></label>
						<input type="text" ng-model="item.label" class="form-control" tabindex="1" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('price')">
						<label><spring:message code="label.price" /></label>
						<input type="number" step="0.01" ng-model="item.price" class="form-control" tabindex="2" />
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('datestart')">
						<label><spring:message code="label.datestart" /></label>
						<div class="picker-holder">
							<div class="col-xs-8">
								<div class="input-group picker-item">
									<span class="input-group-btn">
										<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'datestart')">
											<i class="glyphicon glyphicon-calendar"></i>
										</button>
									</span>
									
									<input type="text" class="form-control picker-input" ng-model="item.datestart" datepicker-popup="yyyy-MM-dd"
										ng-change="convertDateAndTime(item.datestart, 'datestart')"
										is-open="details.datestart" close-text="X" tabindex="3">
									
								</div>
							</div>
							<div class="col-xs-4 auto-center">
								<timepicker ng-model="item.datestart" show-meridian="false" ng-change="convertDateAndTime(item.datestart, 'datestart')"></timepicker>
							</div>
						</div>
					</div>


					<div class="form-group margin-top-5" ng-if="::checkVisibility('dateend')">
						<label><spring:message code="label.dateend" /></label>
						<div class="picker-holder">
							<div class="col-xs-8">
								<div class="input-group picker-item">
									<span class="input-group-btn">
										<button type="button" class="btn btn-default picker-open-button" ng-click="open($event, 'dateend')">
											<i class="glyphicon glyphicon-calendar"></i>
										</button>
									</span>
									
									<input type="text" class="form-control picker-input" ng-model="item.dateend" datepicker-popup="yyyy-MM-dd"
										ng-change="convertDateAndTime(item.dateend, 'dateend')"
										is-open="details.dateend" close-text="X" tabindex="4">
									
								</div>
							</div>
							<div class="col-xs-4 auto-center">
								<timepicker ng-model="item.dateend" show-meridian="false" ng-change="convertDateAndTime(item.dateend, 'dateend')"></timepicker>
							</div>
						</div>
					</div>


					<div class="form-group margin-top-5" ng-if="::checkVisibility('tmaccount')">
						<label><spring:message code="label.tmAccount" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('tmaccount', 'TmAccount', 'servvisas', dataTmAccount)">
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
									ng-click="searchDict('tmaccount', 'TmAccount', 'servvisas', dataTmAccount)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('locationcountries')">
						<label><spring:message code="label.locationCountries" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('locationcountries', 'LocationCountries', 'servvisas', dataLocationCountries)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.locationcountries"
									ng-options="item.label for item in dataLocationCountries track by item.id"
									tabindex="6">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('locationcountries', 'LocationCountries', 'servvisas', dataLocationCountries)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>
				</div>
			
				<div class="col-md-6 col-lg-4 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('currcurrency')">
						<label><spring:message code="label.currCurrency" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('currcurrency', 'CurrCurrency', 'servvisas', dataCurrCurrency)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.currcurrency"
									ng-options="item.label for item in dataCurrCurrency track by item.id"
									tabindex="7">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('currcurrency', 'CurrCurrency', 'servvisas', dataCurrCurrency)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('dictglobal')">
						<label><spring:message code="label.dictGlobal" /></label>
						<div class="input-group combobox-holder">
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-add" type="button"
									ng-click="addDict('dictglobal', 'DictGlobal', 'servvisas', dataDictGlobal)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
							
							<select class="form-control"
									ng-model="item.dictglobal"
									ng-options="item.label for item in dataDictGlobal track by item.id"
									tabindex="8">
							</select>
							
							<span class="input-group-btn">
								<button class="btn btn-default combobox-holder-search" type="button"
									ng-click="searchDict('dictglobal', 'DictGlobal', 'servvisas', dataDictGlobal)">
									<i class="fa fa-search"></i>
								</button>
							</span>
							
						</div>
					</div>

					<div class="form-group margin-top-5" ng-if="::checkVisibility('name')">
						<label><spring:message code="label.name" /></label>
						<input type="text" ng-model="item.name" class="form-control" tabindex="9" />
					</div>
				</div>
			
				<div class="col-md-12 edit-block">
						
					<div class="form-group margin-top-5" ng-if="::checkVisibility('descr')">
						<label><spring:message code="label.descr" /></label>
						<div class="custom-textarea-holder">
							<!-- ui-tinymce="tinymceOptions" -->
							<!-- <textarea type="text" ng-model="item.descr" class="form-control custom-textarea" tabindex="10"> -->
							<div text-angular ng-model="item.descrinternal"></div>
							</textarea>
						</div>
					</div>
				</div>
			

				</div>
			  </tab>
			  
			  <tab select="initTab('infoservices', 'fragmentledit')">
						<tab-heading><spring:message code="label.InfoServices"/></tab-heading>
						
						<div ng-if="templates.infoservices.fragmentledit.init" ng-include="templates.infoservices.fragmentledit.url"></div>
					</tab>
					
					<tab select="initTab('tmincidents', 'fragmentledit')">
						<tab-heading><spring:message code="label.TmIncidents"/></tab-heading>
						
						<div ng-if="templates.tmincidents.fragmentledit.init" ng-include="templates.tmincidents.fragmentledit.url"></div>
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
