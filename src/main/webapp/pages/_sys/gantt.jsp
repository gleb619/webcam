<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body ng-app="angularGanttDemoApp">
    <!--[if lt IE 7]>
      <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- Add your site or application content here -->
    <!-- 
    <a href="https://github.com/angular-gantt/angular-gantt" target="_blank"><img style="position: absolute; z-index:10000; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png" alt="Fork me on GitHub"></a>

    <div>
        <div class="navbar navbar-default" role="navigation" bs-navbar>
            <div class="navbar-header">
                <a class="navbar-brand" href="http://www.angular-gantt.com">angular-gantt - Gantt chart component for AngularJS</a>
            </div>
            <div class="navbar-right navbar-right-spacing">
                <a class="navbar-text navbar-link" href="http://www.angular-gantt.com"><i class="fa fa-book"></i> Documentation</a>
                <a class="navbar-text navbar-link" href="https://github.com/angular-gantt/angular-gantt"><i class="fa fa-github"></i> GitHub</a>
            </div>
        </div>

        <div class="container-content" ng-show="false">
            <div class="container-fluid">
                <div class="row top-buffer">
                    <div class="col-md-12">
                        <i class="fa fa-cog fa-spin"></i> Loading angular-gantt demo ...
                    </div>
                </div>
            </div>
        </div>

        <div class="container-content" ng-cloak="true">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel-group" bs-collapse>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="" bs-collapse-toggle>Options</a>
                                    </h4>
                                </div>
                                <div class="panel-collapse" bs-collapse-target>
                                    <div class="panel-body">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="form-inline">
                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-search"></i> Scale</label><br>
                                                        <button type="button" style="width: 5em; text-align: left" class="btn btn-default" ng-model="options.scale" ng-options="s for s in ['minute', 'hour', 'day', 'week', 'month', 'quarter', 'year']" bs-select></button>
                                                    </div>
                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-sort"></i> Sort</label><br>
                                                        <button type="button" style="width: 6em; text-align: left" class="btn btn-default" ng-model="options.sortMode" ng-options="m.value as m.label for m in [{label: 'disabled', value: undefined}, {label: 'name', value: 'model.name'}, {label: 'from', value: 'from'}, {label: 'to', value: 'to'}]" bs-select></button>
                                                    </div>
                                                    <div class="form-group input-append text-center">
                                                        <label class="control-label"><i class="fa fa-filter"></i> Filter Tasks</label><br>
                                                        <input type="text" class="form-control" style="width: 8em; text-align: left" ng-model="options.filterTask">
                                                    </div>
                                                    <div class="form-group input-append text-center">
                                                        <label class="control-label"><i class="fa fa-filter"></i> Filter Rows</label><br>
                                                        <input type="text" class="form-control" style="width: 8em; text-align: left" ng-model="options.filterRow">
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-clock-o"></i> Today</label><br>
                                                        <button type="button" style="width: 6em; text-align: left" class="btn btn-default" ng-model="options.currentDate" ng-options="d for d in ['none', 'line', 'column']" bs-select></button>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-expand"></i> Expand</label><br>
                                                        <button type="button" style="width: 6em; text-align: left" class="btn btn-default" ng-model="options.autoExpand" ng-options="e for e in ['none', 'both', 'left', 'right']" bs-select></button>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-scissors"></i> Out of range</label><br>
                                                        <button type="button" style="width: 8em; text-align: left" class="btn btn-default" ng-model="options.taskOutOfRange" ng-options="e for e in ['expand', 'truncate']" bs-select></button>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-pencil-square-o"></i> Edit</label><br>
                                                        <button type="button" class="btn btn-default" ng-model="options.draw" bs-checkbox>Draw</button>
                                                        <button type="button" class="btn btn-default" ng-model="options.readOnly" bs-checkbox>Read Only</button>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-magnet"></i> Magnet</label><br>
                                                        <button type="button" style="width: 8em; text-align: left" class="btn btn-default" ng-model="options.columnMagnet" ng-options="m for m in ['1 second', '1 minute', '5 minutes', '15 minutes', '1 hour', '1 day']" bs-select></button>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-crop"></i> Layout</label><br>
                                                        <div class="btn-group" bs-checkbox-group>
                                                            <button type="button" class="btn btn-default" ng-model="options.maxHeight" bs-checkbox>Height</button>
                                                            <button ng-disabled="options.scale === 'hour' || options.scale === 'minute'" type="button" class="btn btn-default" ng-model="options.width" bs-checkbox>Width</button>
                                                            <button type="button" class="btn btn-default" ng-model="options.showLabelsColumn" bs-checkbox>Labels</button>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-calendar"></i> <i class="fa fa-arrows-h"></i> <i class="fa fa-calendar"></i> Date range</label><br>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" ng-model="options.fromDate" max-date="{{options.toDate}}" start-date="{{options.currentDateValue.toString()}}" start-week="1" placeholder="From" bs-datepicker>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" ng-model="options.toDate" min-date="{{options.fromDate}}" start-date="{{options.currentDateValue.toString()}}" start-week="1" placeholder="To" bs-datepicker>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-sign-out"></i> Non-working</label><br>
                                                        <button type="button" style="width: 8em; text-align: left" class="btn btn-default" ng-model="options.timeFramesNonWorkingMode" ng-options="e for e in ['visible', 'hidden', 'cropped']" bs-select></button>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <label class="control-label"><i class="fa fa-database"></i> Data actions</label><br>
                                                        <div class="btn-group">
                                                            <button class="btn btn-default" ng-click="reload()">Reload</button>
                                                            <button class="btn btn-default" ng-click="remove()">Remove</button>
                                                            <button class="btn btn-default" ng-click="clear()">Clear</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row top-buffer">
                    <div class="col-md-12">
                        <div class="panel-group" bs-collapse>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="" bs-collapse-toggle>Gantt</a>
                                    </h4>
                                </div>
                                <div class="panel-collapse" bs-collapse-target>
                                    <div class="panel-body">
                                        <div gantt
                                               data="data"
                                               timespans="timespans"
                                               filter-task="{'name': options.filterTask}"
                                               filter-row="{'name': options.filterRow}"
                                               sort-mode="options.sortMode"
                                               view-scale="options.scale"
                                               column-width="(options.width || options.scale === 'hour' || options.scale === 'minute') && {minute: 40, hour: 40, day: 40, week: 150, month: 300, quarter: 500, year: 800}[options.scale] || undefined"
                                               auto-expand="options.autoExpand"
                                               task-out-of-range="options.taskOutOfRange"
                                               from-date = "options.fromDate"
                                               to-date = "options.toDate"
                                               show-labels-column="options.showLabelsColumn"
                                               current-date="options.currentDate"
                                               current-date-value="options.currentDateValue"
                                               headers="options.width && options.shortHeaders || options.longHeaders"
                                               max-height="options.maxHeight && 300 || 0"
                                               time-frames="options.timeFrames"
                                               date-frames="options.dateFrames"
                                               time-frames-non-working-mode="options.timeFramesNonWorkingMode"
                                               api="options.api"
                                               column-magnet="options.columnMagnet">
                                            <gantt-tooltips></gantt-tooltips>
                                            <gantt-bounds></gantt-bounds>
                                            <gantt-progress></gantt-progress>
                                            <gantt-sortable></gantt-sortable>
                                            <gantt-movable enabled="!options.readOnly"></gantt-movable>
                                            <gantt-draw-task
                                                enabled="options.draw && !options.readOnly"
                                                task-factory="options.drawTaskFactory">
                                            </gantt-draw-task>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="live-table">
                                            <div class="live-cell" ng-show="live.row.tasks.length > 0">
                                                <h4><button type="button" style="text-align: left" class="btn btn-default" ng-model="live.task" ng-options="t as t.name for t in live.row.tasks" bs-select></button> (Task object)</h4>
                                                <textarea class="live-task" ng-model="live.taskJson"></textarea>
                                            </div>
                                            <div class="live-cell" ng-show="data.length > 0">
                                                <h4><button type="button" style="text-align: left" class="btn btn-default" ng-model="live.row" ng-options="r as r.name for r in data" bs-select></button> (Row object)</h4>
                                                <textarea class="live-row" ng-model="live.rowJson"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> 
    -->
    
    <gantt data="data"></gantt>
    
</body>
</html>