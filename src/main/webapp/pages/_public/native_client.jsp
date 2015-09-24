<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<div>
	<h2>Webcam client</h2>
	<h5>
		<p>Run client with this command:</p>
		<span class="label label-primary">java -jar webcam_client.jar
			C:\\config.properties</span>
	</h5>
	
	<blockquote>
		<p>config.properties</p>
		<small>Version <cite title="1.2">1.2</cite></small>
	</blockquote>

	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Description</th>
					<th>Name</th>
					<th>Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<p> 
							<span class="label label-info">@Depricated for 1.2</span> 
						</p>
					
						<p class="text-primary"><del>Token</del></p>
					</td>
					<td>
						<p>key</p>
					</td>
					<td>
						<p>{API KEY}</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Ip or hostname for check service is
							alive</p>
					</td>
					<td>
						<p>heartbeat</p>
					</td>
					<td>
						<p>178.88.186.230 or 178.88.186.226</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Port for ping</p>
					</td>
					<td>
						<p>heartbeatPort</p>
					</td>
					<td>
						<p>8080</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Template for work, with special
							argument {apikey} = %s</p>
					</td>
					<td>
						<p>urlTemplate</p>
					</td>
					<td>
						<p>http://178.88.186.230:8080/webcam-server/api/%s/photo/upload</p>
					</td>
				</tr>
				<tr>
					<td>
						<p> 
							<span class="label label-info">@Depricated for 1.2</span> 
						</p>
						<p class="text-primary">
							<del>Local store for photos, if folder doesn't exists, it will be created</del>
						</p>
					</td>
					<td>
						<p>path</p>
					</td>
					<td>
						<p>D:/PHOTOS or D:\\PHOTOS</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Debug messages. NOTE: this parametr doesn't hide standart messages. Only messages with [DEBUG] header.</p>
					</td>
					<td>
						<p>allowDebug</p>
					</td>
					<td>
						<p>false</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Resolution width</p>
					</td>
					<td>
						<p>captureWidth</p>
					</td>
					<td>
						<p>600</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Resolution height</p>
					</td>
					<td>
						<p>captureHeight</p>
					</td>
					<td>
						<p>800</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Frequency(ms)</p>
					</td>
					<td>
						<p>frequency</p>
					</td>
					<td>
						<p>5000</p>
					</td>
				</tr>
				<tr>
					<td>
						<p> 
							<span class="label label-info">@Depricated for 1.1</span> 
						</p>
						<p class="text-primary">
							<del>Compression (0-100 persentage)</del>
						</p>
					</td>
					<td>
						<p>compressLevel</p>
					</td>
					<td>
						<p>50</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Show pane with changes(Video pane)</p>
					</td>
					<td>
						<p>showPane</p>
					</td>
					<td>
						<p>false</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="text-primary">Show log pane with changes</p>
					</td>
					<td>
						<p>showLogPane</p>
					</td>
					<td>
						<p>false</p>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<hr>
	<br>
	<h2> Download </h2>
	<br>
	<br>
	<br>
	<h4>
		<a class="btn btn-warning" href="../resources/help/webcam_client_2.zip">
			<span>webcam_client.zip</span>
		</a>
		<a class="btn btn-warning" href="../resources/help/config.properties">
			<span>config.properties</span>
		</a>
	</h4>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 
	<h5>
		<span class="label label-warning">config.properties</span>
	</h5>
	<p>
		<a href="../resources/help/config.properties">Download</a>
	</p>
	 -->
</div>