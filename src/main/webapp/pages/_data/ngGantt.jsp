<div class="gantt unselectable" ng-cloak gantt-scroll-manager
	gantt-element-width-listener>
	<gantt-labels> <gantt-labels-header>
	<gantt-row-header></gantt-row-header> </gantt-labels-header> <gantt-labels-body>
	<div
		ng-repeat="row in gantt.rowsManager.visibleRows track by row.model.id">
		<gantt-row-label></gantt-row-label>
	</div>
	</gantt-labels-body> </gantt-labels>
	<gantt-header> <gantt-header-columns>
	<div ng-repeat="header in gantt.columnsManager.visibleHeaders">
		<div class="gantt-header-row"
			ng-class="$last && 'gantt-header-row-last' || ''">
			<div ng-repeat="column in header">
				<gantt-column-header></gantt-column-header>
			</div>
		</div>
	</div>
	</gantt-header-columns> </gantt-header>
	<gantt-scrollable> <gantt-body> <gantt-body-background>
	<div
		ng-repeat="row in gantt.rowsManager.visibleRows track by row.model.id">
		<gantt-row-background></gantt-row-background>
	</div>
	</gantt-body-background> <gantt-body-foreground>
	<div class="gantt-current-date-line"
		ng-if="currentDate === 'line' && gantt.currentDateManager.position >= 0 && gantt.currentDateManager.position <= gantt.width"
		ng-style="{'left': gantt.currentDateManager.position + 'px' }"></div>
	</gantt-body-foreground> <gantt-body-columns>
	<div ng-repeat="column in gantt.columnsManager.visibleColumns">
		<gantt-column>
		<div ng-repeat="timeFrame in column.visibleTimeFrames">
			<gantt-time-frame></gantt-time-frame>
		</div>
		</gantt-column>
	</div>
	</gantt-body-columns> <gantt-body-rows
		gantt-element-height-listener="$parent.$parent.bodyRowsHeight"
		gantt-element-width-listener="$parent.$parent.bodyRowsWidth">
	<div ng-repeat="timespan in gantt.timespansManager.timespans">
		<gantt-timespan></gantt-timespan>
	</div>
	<div
		ng-repeat="row in gantt.rowsManager.visibleRows track by row.model.id">
		<gantt-row>
		<div ng-repeat="task in row.visibleTasks track by task.model.id">
			<gantt-task></gantt-task>
		</div>
		</gantt-row>
	</div>
	</gantt-body-rows> </gantt-body> </gantt-scrollable>
	
	<!-- PLUGINS -->
	
	<!-- Body template -->
	<script type="text/ng-template" id="ngGanttBody">
                <div ng-transclude class="gantt-body"
                     ng-style="{'width': gantt.width +'px'}"></div>
            </script>

	<!-- Header template -->
	<script type="text/ng-template" id="ngGanttHeader">
                <div ng-transclude class="gantt-header"
                     ng-show="gantt.columnsManager.columns.length > 0 && gantt.columnsManager.headers.length > 0"
                     ng-style="getHeaderCss()"></div>
            </script>

	<!-- Row label template -->
	<script type="text/ng-template" id="ngGanttRowLabel">
                <div class="gantt-labels-row gantt-row-height"
                     ng-class-odd="'gantt-background-row'"
                     ng-class-even="'gantt-background-row-alt'"
                     ng-class="row.model.classes" ng-style="{'background-color': row.model.color, 'height': row.model.height}">
                        <span class="gantt-labels-text">{{ row.model.name }}</span>
                </div>
            </script>

	<!-- Row header template -->
	<script type="text/ng-template" id="ngGanttRowHeader">
                <div class="gantt-labels-header-row gantt-labels-header-row-last"
                     ng-show="gantt.columnsManager.columns.length > 0 && gantt.columnsManager.headers.length > 0"
                     ng-style="{'margin-top': ((gantt.columnsManager.headers.length-1)*2)+'em'}">
                    <span>Name</span>
                </div>
            </script>

	<!-- Labels header template-->
	<script type="text/ng-template"
		id="ngGanttLabelsHeader">
                <div ng-transclude= class="gantt-labels-header">
                </div>
            </script>

	<script type="text/ng-template" id="ngGanttLabelsBody">
            <div class="gantt-labels-body"
                 ng-style="(maxHeight > 0 && {'max-height': (maxHeight - gantt.header.getHeight())+'px'} || {})">
                <div ng-transclude gantt-vertical-scroll-receiver>
                </div>
            </div>
            </script>

	<!-- Labels template -->
	<script type="text/ng-template" id="ngGanttLabels">
                <div ng-transclude ng-if="showLabelsColumn" class="gantt-labels"
                     ng-style="($parent.labelsWidth > 0 && {'width': $parent.labelsWidth+'px'} || {})"
                     gantt-labels-resize="$parent.allowLabelsResizing"
                     gantt-labels-resize-width="$parent.labelsWidth"
                     gantt-labels-resize-min-width="50"
                     gantt-element-width-listener="$parent.labelsWidth"></div>
            </script>

	<!-- Header columns template -->
	<script type="text/ng-template"
		id="ngGanttHeaderColumns">
                <div ng-transclude class="gantt-header-columns"
                      gantt-horizontal-scroll-receiver></div>
            </script>

	<script type="text/ng-template"
		id="ngGanttColumnHeader">
                <div class="gantt-column-header">
                    <!--{{ ::column.label }}-->
                </div>
            </script>

	<!-- Body background template -->
	<script type="text/ng-template"
		id="ngGanttBodyBackground">
                <div ng-transclude class="gantt-body-background"></div>
            </script>

	<!-- Row background template -->
	<script type="text/ng-template"
		id="ngGanttRowBackground">
                <div class="gantt-row-height"
                     ng-class-odd="'gantt-background-row'"
                     ng-class-even="'gantt-background-row-alt'"
                     ng-class="row.model.classes"
                     ng-style="{'background-color': row.model.color, 'height': row.model.height}">
                </div>
            </script>

	<!-- Body foreground template -->
	<script type="text/ng-template"
		id="ngGanttBodyForeground">
                <div ng-transclude class="gantt-body-foreground"></div>
            </script>

	<!-- Body columns template -->
	<script type="text/ng-template"
		id="ngGanttBodyColumns">
                <div ng-transclude class="gantt-body-columns"></div>
            </script>

	<script type="text/ng-template" id="ngGanttColumn">
                <div ng-transclude class="gantt-column gantt-foreground-col"></div>
            </script>

	<script type="text/ng-template" id="ngGanttTimeFrame">
                <div class="gantt-timeframe"></div>
            </script>

	<!-- Scrollable template -->
	<script type="text/ng-template" id="ngGanttScrollable">
                <div ng-transclude class="gantt-scrollable" gantt-scroll-sender ng-style="getScrollableCss()"></div>
            </script>

	<!-- Rows template -->
	<script type="text/ng-template" id="ngGanttBodyRows">
                <div ng-transclude class="gantt-body-rows"></div>
            </script>

	<!-- Timespan template -->
	<script type="text/ng-template" id="ngGanttTimespan">
                <div class="gantt-timespan"
                     ng-style="{'z-index': (timespan.priority || 0)}"
                     ng-class="timespan.classes">
                </div>
            </script>

	<!-- Task template -->
	<script type="text/ng-template" id="ngGanttTask">
                <div ng-class="(task.isMilestone() === true && ['gantt-task-milestone'] || ['gantt-task']).concat(task.model.classes)"
                     ng-style="{'z-index': (task.active === true && 1  || task.model.priority || ''), 'background-color': task.model.color}">
                    <div ng-if="task.truncatedLeft" class="gantt-task-truncated-left"><span>&lt;</span></div>
                    <gantt-task-content></gantt-task-content>
                    <div ng-if="task.truncatedRight" class="gantt-task-truncated-right"><span>&gt;</span></div>
                </div>
            </script>

	<!-- Task content template -->
	<script type="text/ng-template"
		id="ngGanttTaskContent">
                <div class="gantt-task-content-container">
                    <div class="gantt-task-content"><span>{{ (task.isMilestone() === true && '&nbsp;' || task.model.name) }}</span></div>
                </div>
            </script>

	<!-- Row template -->
	<script type="text/ng-template" id="ngGanttRow">
                <div ng-transclude class="gantt-row gantt-row-height" ng-style="{'height': row.model.height}"></div>
            </script>
	
	<!-- PLUGINS -->
	
	
</div>
