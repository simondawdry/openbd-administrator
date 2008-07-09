<cfsavecontent variable="request.content">
<cfoutput>
<cfparam name="form.dsn" type="string" default="" />
<cfparam name="url.action" type="string" default="create" />
<script type="text/javascript">
	function showHideAdvSettings() {
		var advSettings = document.getElementById('advancedSettings');
		var advSettingsButton = document.getElementById('advSettingsButton');
		
		if (advSettings.style.visibility == 'visible') {
			advSettingsButton.value = 'Show Advanced Settings';
			advSettings.style.display= 'none';
			advSettings.style.visibility = 'hidden';
		} else {
			advSettingsButton.value = 'Hide Advanced Settings';
			advSettings.style.display = 'inline';
			advSettings.style.visibility = 'visible';
		}
	}
	
	function validate(f) {
		var ok = true;
		
		if (f.name.value.length == 0) {
			alert("Please enter the datasource name");
			ok = false;
		} else if (f.databasename.value.length == 0) {
			alert("Please enter the database name");
			ok = false;
		} else if (f.server.value.length == 0) {
			alert("Please enter the database server");
			ok = false;
		} else if (f.port.value.length == 0) {
			alert("Please enter the database server port");
			ok = false;
		}
		
		return ok;
	}
</script>
<h3>Configure Datasource - MySQL 4/5</h3>
<br />
<cfif structKeyExists(session, "message")>
<p style="color:red;font-weight:bold;">#session.message#</p>
</cfif>
<!--- TODO: need explanatory tooltips/mouseovers on all these settings, esp. 'per request connections' which 
		from my understanding is the opposite of Adobe CF's description 'maintain connections across client requests'--->
<!--- TODO: pull default driver and port values from the datasource.cfc --->
<form name="datasourceForm" action="processDatasourceForm.cfm" method="post" onsubmit="return validate(this);">
<table border="0">
	<tr>
		<td>OpenBD Datasource Name</td>
		<td><input name="name" type="text" size="30" maxlength="50" value="#form.dsn#" /></td>
	</tr>
	<tr>
		<td>Database Name</td>
		<td><input name="databasename" type="text" size="30" maxlength="250" /></td>
	</tr>
	<tr>
		<td>Database Server</td>
		<td><input name="server" type="text" size="30" maxlength="250" /></td>
	</tr>
	<tr>
		<td>Server Port</td>
		<td><input name="port" type="text" size="6" maxlength="5" value="3306" /></td>
	</tr>
	<tr>
		<td>User Name</td>
		<td><input name="username" type="text" size="30" maxlength="50" /></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input name="password" type="text" size="30" maxlength="16" /></td>
	</tr>
	<tr>
		<td valign="top">Description</td>
		<td valign="top"><textarea name="description" rows="4" cols="40"></textarea></td>
	</tr>
	<tr>
		<td>
			<input type="button" id="advSettingsButton" name="showAdvSettings" value="Show Advanced Settings" onclick="javascript:showHideAdvSettings();" />
		</td>
		<td align="right">
			<input type="submit" name="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" />
		</td>
	</tr>
</table>
<div id="advancedSettings" style="display:none;visibility:hidden;">
<br />
<table border="0">
	<tr>
		<td valign="top">Initialization String</td>
		<td valign="top"><textarea name="initstring" rows="4" cols="40"></textarea></td>
	</tr>
	<tr>
		<td valign="top">SQL Operations</td>
		<td valign="top">
			<table border="0">
				<tr>
					<td><input type="checkbox" name="sqlselect" value="true" checked="true" />SELECT</td>
					<td><input type="checkbox" name="sqlinsert" value="true" checked="true" />INSERT</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="sqlupdate" value="true" checked="true" />UPDATE</td>
					<td><input type="checkbox" name="sqldelete" value="true" checked="true" />DELETE</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="sqlstoredprocedures" value="true" checked="true" />Stored Procedures</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>Per-Request Connections</td>
		<td><input type="checkbox" name="perrequestconnections" value="true" /></td>
	</tr>
	<tr>
		<td>Maximum Connections</td>
		<td><input type="text" name="maxconnections" size="4" maxlength="4" value="24" /></td>
	</tr>
	<tr>
		<td>Connection Timeout</td>
		<td><input type="text" name="connectiontimeout" size="4" maxlength="4" value="120" /></td>
	</tr>
	<tr>
		<td>Login Timeout</td>
		<td><input type="text" name="logintimeout" size="4" maxlength="4" value="120" /></td>
	</tr>
	<tr>
		<td>Connection Retries</td>
		<td><input type="text" name="connectionretries" size="4" maxlength="4" value="0" /></td>
	</tr>
	<!--- TODO: add "encrypt password" checkbox or just always encrypt? --->
	<!--- TODO: add "use unicode" checkbox or make user add that into the init string? --->
</table>
</div>
	<input type="hidden" name="dbType" value="mysql5" />
	<input type="hidden" name="drivername" value="com.mysql.jdbc.Driver" />
	<input type="hidden" name="action" value="#url.action#" />
</form>
</cfoutput>
</cfsavecontent>
