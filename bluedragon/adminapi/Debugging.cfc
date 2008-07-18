<cfcomponent displayname="Debugging" 
		output="false" 
		extends="Base" 
		hint="Manages debugging and logging settings - OpenBD Admin API">
	
	<!--- DEBUGGING --->
	<cffunction name="getDebugSettings" access="public" output="false" returntype="struct" 
			hint="Returns a struct containing the current debug settings">
		<cfset var localConfig = getConfig() />
		<cfset var doSetConfig = false />
		<cfset var debugSettings = structNew() />
		
		<!--- Debug settings will include the debugoutput node as well as 'debug' and 'runtimelogging' 
				from the system node. None of these nodes necessarily exists by default. --->
		<cfif not structKeyExists(localConfig.system, "assert")>
			<cfset localConfig.system.assert = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.system, "debug")>
			<cfset localConfig.system.debug = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.system, "runtimelogging")>
			<cfset localConfig.system.runtimelogging = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig, "debugoutput")>
			<cfset localConfig.debugoutput = structNew() />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "enabled")>
			<cfset localConfig.debugoutput.enabled = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "executiontimes")>
			<cfset localConfig.debugoutput.executiontimes = structNew() />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.executiontimes, "show")>
			<cfset localConfig.debugoutput.executiontimes.show = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.executiontimes, "highlight")>
			<cfset localConfig.debugoutput.executiontimes.highlight = "250" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "exceptions")>
			<cfset localConfig.debugoutput.exceptions = structNew() />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.exceptions, "show")>
			<cfset localConfig.debugoutput.exceptions.show = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "tracepoints")>
			<cfset localConfig.debugoutput.tracepoints = structNew() />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.tracepoints, "show")>
			<cfset localConfig.debugoutput.tracepoints.show = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "database")>
			<cfset localConfig.debugoutput.database = structNew() />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.database, "show")>
			<cfset localConfig.debugoutput.database.show = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "timer")>
			<cfset localConfig.debugoutput.timer = structNew() />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.timer, "show")>
			<cfset localConfig.debugoutput.timer.show = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "variables")>
			<cfset localConfig.debugoutput.variables = structNew() />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "url")>
			<cfset localConfig.debugoutput.variables.url = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "form")>
			<cfset localConfig.debugoutput.variables.form = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "cookie")>
			<cfset localConfig.debugoutput.variables.cookie = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "cgi")>
			<cfset localConfig.debugoutput.variables.cgi = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "client")>
			<cfset localConfig.debugoutput.variables.client = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "server")>
			<cfset localConfig.debugoutput.variables.server = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "request")>
			<cfset localConfig.debugoutput.variables.request = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "session")>
			<cfset localConfig.debugoutput.variables.session = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "application")>
			<cfset localConfig.debugoutput.variables.application = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "local")>
			<cfset localConfig.debugoutput.variables.local = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "cffile")>
			<cfset localConfig.debugoutput.variables.cffile = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "show")>
			<cfset localConfig.debugoutput.variables.show = "true" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput.variables, "variables")>
			<cfset localConfig.debugoutput.variables.variables = "false" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif doSetConfig>
			<cfset setConfig(localConfig) />
		</cfif>
		
		<cfset debugSettings.system.assert = localConfig.system.assert />
		<cfset debugSettings.system.debug = localConfig.system.debug />
		<cfset debugSettings.system.runtimelogging = localConfig.system.runtimelogging />
		<cfset debugSettings.debugoutput = localConfig.debugoutput />
		
		<cfreturn debugSettings />
	</cffunction>
	
	<cffunction name="saveDebugSettings" access="public" output="false" returntype="void" 
			hint="Saves the basic debug settings">
		<cfargument name="debug" type="boolean" required="true" hint="Enables/disables 'extended error reporting' is enabled" />
		<cfargument name="runtimelogging" type="boolean" required="true" hint="Enables/disables logging of runtime errors to a file" />
		<cfargument name="enabled" type="boolean" required="true" hint="Enables/disables debug output" />
		<cfargument name="assert" type="boolean" required="true" hint="Enables/disables cfassert and the assert function" />
		
		<cfset var localConfig = getConfig() />
		
		<!--- the debugoutput node may not exist --->
		<cfif not structKeyExists(localConfig, "debugoutput")>
			<cfset localConfig.debugoutput = structNew() />
		</cfif>
		
		<cfscript>
			localConfig.system.debug = ToString(arguments.debug);
			localConfig.system.runtimelogging = ToString(arguments.runtimelogging);
			localConfig.debugoutput.enabled = ToString(arguments.enabled);
			localConfig.system.assert = ToString(arguments.assert);
			
			setConfig(localConfig);
		</cfscript>
	</cffunction>
	
	<cffunction name="setDebugOutputSettings" access="public" output="false" returntype="void" 
			hint="Saves the debug output settings">
		<cfargument name="executiontimes" type="boolean" required="true" hint="Enables/disables output of execution times" />
		<cfargument name="highlight" type="numeric" required="true" hint="Number of milliseconds above which to highlight the execution time in the debug output" />
		<cfargument name="database" type="boolean" required="true" hint="Enables/disables output of database activity" />
		<cfargument name="exceptions" type="boolean" required="true" hint="Enables/disables output of exceptions" />
		<cfargument name="tracepoints" type="boolean" required="true" hint="Enables/disables output of tracepoints" />
		<cfargument name="timer" type="boolean" required="true" hint="Enables/disables output of timer information" />
		<cfargument name="variables" type="boolean" required="true" hint="Enables/disables output of variables. Specific scopes are controlled in the variables debug form." />
		
		<cfset var localConfig = getConfig() />
		
		<!--- the debugoutput nodes may not exist --->
		<cfif not structKeyExists(localConfig, "debugoutput")>
			<cfset localConfig.debugoutput = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "executiontimes")>
			<cfset localConfig.debugoutput.executiontimes = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "database")>
			<cfset localConfig.debugoutput.database = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "exceptions")>
			<cfset localConfig.debugoutput.exceptions = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "tracepoints")>
			<cfset localConfig.debugoutput.tracepoints = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "timer")>
			<cfset localConfig.debugoutput.timer = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "variables")>
			<cfset localConfig.debugoutput.variables = structNew() />
		</cfif>
		
		<cfscript>
			localConfig.debugoutput.executiontimes.show = ToString(arguments.executiontimes);
			localConfig.debugoutput.executiontimes.highlight = ToString(arguments.highlight);
			localConfig.debugoutput.database.show = ToString(arguments.database);
			localConfig.debugoutput.exceptions.show = ToString(arguments.exceptions);
			localConfig.debugoutput.tracepoints.show = ToString(arguments.tracepoints);
			localConfig.debugoutput.timer.show = ToString(arguments.timer);
			localConfig.debugoutput.variables.show = ToString(arguments.variables);
			
			setConfig(localConfig);
		</cfscript>
	</cffunction>
	
	<cffunction name="setDebugVariablesSettings" access="public" output="false" returntype="void" 
			hint="Saves the debug variables settings">
		<cfargument name="local" type="boolean" required="true" hint="" />
		<cfargument name="url" type="boolean" required="true" hint="" />
		<cfargument name="session" type="boolean" required="true" hint="" />
		<cfargument name="variables" type="boolean" required="true" hint="" />
		<cfargument name="form" type="boolean" required="true" hint="" />
		<cfargument name="client" type="boolean" required="true" hint="" />
		<cfargument name="request" type="boolean" required="true" hint="" />
		<cfargument name="cookie" type="boolean" required="true" hint="" />
		<cfargument name="application" type="boolean" required="true" hint="" />
		<cfargument name="cgi" type="boolean" required="true" hint="" />
		<cfargument name="cffile" type="boolean" required="true" hint="" />
		<cfargument name="server" type="boolean" required="true" hint="" />
		
		<cfset var localConfig = getConfig() />
		
		<!--- the debugoutput nodes may not exist --->
		<cfif not structKeyExists(localConfig, "debugoutput")>
			<cfset localConfig.debugoutput = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "variables")>
			<cfset localConfig.debugoutput.variables = structNew() />
		</cfif>
		
		<cfscript>
			localConfig.debugoutput.variables.local = ToString(arguments.local);
			localConfig.debugoutput.variables.url = ToString(arguments.url);
			localConfig.debugoutput.variables.session = ToString(arguments.session);
			localConfig.debugoutput.variables.variables = ToString(arguments.variables);
			localConfig.debugoutput.variables.form = ToString(arguments.form);
			localConfig.debugoutput.variables.client = ToString(arguments.client);
			localConfig.debugoutput.variables.request = ToString(arguments.request);
			localConfig.debugoutput.variables.cookie = ToString(arguments.cookie);
			localConfig.debugoutput.variables.application = ToString(arguments.application);
			localConfig.debugoutput.variables.cgi = ToString(arguments.cgi);
			localConfig.debugoutput.variables.cffile = ToString(arguments.cffile);
			localConfig.debugoutput.variables.server = ToString(arguments.server);
			
			setConfig(localConfig);
		</cfscript>
	</cffunction>
	
	<cffunction name="getDebugIPAddresses" access="public" output="false" returntype="array" 
			hint="Returns an array containing the current debug IP addresses">
		<cfset var localConfig = getConfig() />
		<cfset var doSetConfig = false />
		<cfset var ipAddresses = arrayNew(1) />
		
		<!--- debugoutput and ip address nodes may not exist --->
		<cfif not structKeyExists(localConfig, "debugoutput")>
			<cfset localConfig.debugoutput = structNew() />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "ipaddresses")>
			<cfset localConfig.debugoutput.ipaddresses = "" />
			<cfset doSetConfig = true />
		</cfif>
		
		<cfif doSetConfig>
			<cfset setConfig(localConfig) />
		</cfif>
		
		<cfif localConfig.debugoutput.ipaddresses is not "">
			<cfset ipAddresses = listToArray(localConfig.debugoutput.ipaddresses, ",") />
		</cfif>
		
		<cfreturn ipAddresses />
	</cffunction>
	
	<cffunction name="addDebugIPAddresses" access="public" output="false" returntype="void" 
			hint="Adds IP address(es) to the debug IP address list. Can be a single IP address or a comma-delimited list.">
		<cfargument name="ipAddresses" type="string" required="true" hint="Single or comma-delimited list of IP addresses to add" />
		
		<cfset var localConfig = getConfig() />
		<cfset var theIP = "" />
		
		<!--- debugoutput and ip address nodes may not exist --->
		<cfif not structKeyExists(localConfig, "debugoutput")>
			<cfset localConfig.debugoutput = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "ipaddresses")>
			<cfset localConfig.debugoutput.ipaddresses = "" />
		</cfif>
		
		<!--- add the IP if it isn't already in the list --->
		<cfloop list="#arguments.ipAddresses#" index="theIP" delimiters=",">
			<cfif localConfig.debugoutput.ipaddresses is "" or not listFind(localConfig.debugoutput.ipaddresses, theIP, ",")>
				<cfif localConfig.debugoutput.ipaddresses is not "">
					<cfset localConfig.debugoutput.ipaddresses = localConfig.debugoutput.ipaddresses & "," & arguments.ipAddresses />
				<cfelse>
					<cfset localConfig.debugoutput.ipaddresses = arguments.ipAddresses />
				</cfif>
			</cfif>
		</cfloop>
		
		<cfset setConfig(localConfig) />
	</cffunction>
	
	<cffunction name="addLocalIPAddress" access="public" output="false" returntype="void" 
			hint="Adds the local IP address to the debug IP address list">
		<cfset addDebugIPAddresses(CGI.REMOTE_ADDR) />
	</cffunction>
	
	<cffunction name="removeDebugIPAddresses" access="public" output="false" returntype="void" 
			hint="Removes IP address(es) from the debug IP address list. Can be a single IP address or a comma-delimited list.">
		<cfargument name="ipAddresses" type="string" required="true" hint="Single or comma-delimited list of IP addresses to remove" />
		
		<cfset var localConfig = getConfig() />
		<cfset var theIP = "" />
		<cfset var pos = 0 />
		
		<!--- debugoutput and ip address nodes may not exist --->
		<cfif not structKeyExists(localConfig, "debugoutput")>
			<cfset localConfig.debugoutput = structNew() />
		</cfif>
		
		<cfif not structKeyExists(localConfig.debugoutput, "ipaddresses")>
			<cfset localConfig.debugoutput.ipaddresses = "" />
		</cfif>
		
		<!--- remove the ips --->
		<cfloop list="#arguments.ipAddresses#" index="theIP" delimiters=",">
			<cfif localConfig.debugoutput.ipaddresses is not "">
				<cfset pos = listFind(localConfig.debugoutput.ipaddresses, theIP, ",") />
				
				<cfif pos neq 0>
					<cfset localConfig.debugoutput.ipaddresses = listDeleteAt(localConfig.debugoutput.ipaddresses, pos, ",") />
				</cfif>
			</cfif>
		</cfloop>
		
		<cfset setConfig(localConfig) />
	</cffunction>
	
	<!--- LOGGING --->
	<cffunction name="getLogFiles" access="public" output="false" returntype="array" 
			hint="Returns an array containing the paths to available log files">
		<cfset var logFiles = arrayNew(1) />
		<cfset var logFile = structNew() />
		<cfset var temp = "" />
		
		<!--- add the standard log files if they exist --->
		<cfif fileExists(expandPath("/WEB-INF/bluedragon/work/bluedragon.log"))>
			<cfdirectory action="list" directory="#ExpandPath('/WEB-INF/bluedragon/work')#" name="temp" />
			
			<cfquery name="temp" dbtype="query">
				SELECT size, datelastmodified 
				FROM temp 
				WHERE name = 'bluedragon.log'
			</cfquery>
			
			<cfset logFile.name = "bluedragon.log" />
			<cfset logFile.fullpath = expandPath("/WEB-INF/bluedragon/work/bluedragon.log") />
			<cfset logFile.size = temp.size />
			<cfset logFile.datelastmodified = LSDateFormat(temp.datelastmodified, "yyyy-mm-dd") & " " & LSTimeFormat(temp.datelastmodified, "HH:mm:ss") />
			
			<cfset arrayAppend(logFiles, logFile) />
		</cfif>
		
		<cfif fileExists(expandPath("/WEB-INF/bluedragon/work/cfmail/mail.log"))>
			<cfset logFile = structNew() />
			
			<cfdirectory action="list" directory="#ExpandPath('/WEB-INF/bluedragon/work/cfmail')#" name="temp" />
			
			<cfquery name="temp" dbtype="query">
				SELECT size, datelastmodified 
				FROM temp 
				WHERE name = 'mail.log'
			</cfquery>
			
			<cfset logFile.name = "mail.log" />
			<cfset logFile.fullpath = expandPath("/WEB-INF/bluedragon/work/cfmail/mail.log") />
			<cfset logFile.size = temp.size />
			<cfset logFile.datelastmodified = LSDateFormat(temp.datelastmodified, "yyyy-mm-dd") & " " & LSTimeFormat(temp.datelastmodified, "HH:mm:ss") />
			
			<cfset arrayAppend(logFiles, logFile) />
		</cfif>
		
		<cfif fileExists(expandPath("/WEB-INF/bluedragon/work/cfquerybatch/querybatch.log"))>
			<cfset logFile = structNew() />
			
			<cfdirectory action="list" directory="#ExpandPath('/WEB-INF/bluedragon/work/cfquerybatch')#" name="temp" />
			
			<cfquery name="temp" dbtype="query">
				SELECT size, datelastmodified 
				FROM temp 
				WHERE name = 'querybatch.log'
			</cfquery>
			
			<cfset logFile.name = "querybatch.log" />
			<cfset logFile.fullpath = expandPath("/WEB-INF/bluedragon/work/cfquerybatch/querybatch.log") />
			<cfset logFile.size = temp.size />
			<cfset logFile.datelastmodified = LSDateFormat(temp.datelastmodified, "yyyy-mm-dd") & " " & LSTimeFormat(temp.datelastmodified, "HH:mm:ss") />
			
			<cfset arrayAppend(logFiles, logFile) />
		</cfif>
		
		<cfif fileExists(expandPath("/WEB-INF/bluedragon/work/cfschedule/schedule.log"))>
			<cfset logFile = structNew() />
			
			<cfdirectory action="list" directory="#ExpandPath('/WEB-INF/bluedragon/work/cfschedule')#" name="temp" />
			
			<cfquery name="temp" dbtype="query">
				SELECT size, datelastmodified 
				FROM temp 
				WHERE name = 'schedule.log'
			</cfquery>
			
			<cfset logFile.name = "schedule.log" />
			<cfset logFile.fullpath = expandPath("/WEB-INF/bluedragon/work/cfschedule/schedule.log") />
			<cfset logFile.size = temp.size />
			<cfset logFile.datelastmodified = LSDateFormat(temp.datelastmodified, "yyyy-mm-dd") & " " & LSTimeFormat(temp.datelastmodified, "HH:mm:ss") />
			
			<cfset arrayAppend(logFiles, logFile) />
		</cfif>
		
		<!--- add custom log files --->
		<cfif directoryExists(expandPath("/WEB-INF/bluedragon/work/cflog"))>
			<cfdirectory action="list" directory="#expandPath('/WEB-INF/bluedragon/work/cflog')#" name="temp" />
			
			<cfquery name="temp" dbtype="query">
				SELECT name, size, datelastmodified 
				FROM temp 
				WHERE name LIKE '%.log'
			</cfquery>
			
			<cfloop query="temp">
				<cfset logFile = structNew() />
				<cfset logFile.name = temp.name />
				<cfset logFile.fullpath = expandPath("/WEB-INF/bluedragon/work/cflog/#temp.name#") />
				<cfset logFile.size = temp.size />
				<cfset logFile.datelastmodified = LSDateFormat(temp.datelastmodified, "yyyy-mm-dd") & " " & LSTimeFormat(temp.datelastmodified, "HH:mm:ss") />
				<cfset arrayAppend(logFiles, logFile) />
			</cfloop>
		</cfif>
		
		<cfreturn logFiles />
	</cffunction>
	
	<cffunction name="archiveLogFile" access="public" output="false" returntype="void" 
			hint="Renames the active log file to ${LOG_FILE}.log.1, deletes ${LOG_FILE}.log.10, and shifts all other log files back a number">
		<cfargument name="logFile" type="string" required="true" hint="The log file to archive" />
		
		<cfset var logFilePath = getLogFilePath(arguments.logFile) />
		<cfset var logFiles = 0 />
		<cfset var i = 0 />
		
		<!--- get a listing of the current log files of this type --->
		<cfdirectory action="list" directory="#logFilePath#" name="logFiles" />

		<cfquery name="logFiles" dbtype="query">
			SELECT 	name 
			FROM 	logFiles 
			WHERE 	name LIKE '#arguments.logFile#%'
		</cfquery>
		
		<cfloop index="i" from="1" to="#logFiles.RecordCount#">
			<cfif fileExists("#logFilePath#/#arguments.logFile#.#i#")>
				<cfif i lt 10>
					<cffile action="rename" source="#logFilePath#/#arguments.logFile#.#i#" 
							destination="#logFilePath#/#arguments.logFile#.#i+1#" />
				<cfelse>
					<cffile action="delete" file="#logFilePath#/#arguments.logFile#.#i#" />
				</cfif>
			</cfif>
		</cfloop>
		
		<cfif fileExists("#logFilePath#/#arguments.logFile#")>
			<cffile action="rename" source="#logFilePath#/#arguments.logFile#" 
					destination="#logFilePath#/#arguments.logFile#.1" />
		</cfif>
	</cffunction>
	
	<cffunction name="deleteLogFile" access="public" output="false" returntype="void" 
			hint="Deletes a log file">
		<cfargument name="logFile" type="string" required="true" hint="The log file to delete" />
		
		<cfset var logFilePath = getLogFilePath(arguments.logFile) />
		
		<cfif fileExists("#logFilePath#/#arguments.logFile#")>
			<cffile action="delete" file="#logFilePath#/#arguments.logFile#">
		</cfif>
	</cffunction>
	
	<cffunction name="getLogFilePath" access="public" output="false" returntype="string" 
			hint="Returns the directory path for a given log file">
		<cfargument name="logFile" type="string" required="true" hint="The log file name" />
		
		<cfset var logFilePath = "" />
		
		<cfswitch expression="#arguments.logFile#">
			<cfcase value="bluedragon.log">
				<cfset logFilePath = expandPath("/WEB-INF/bluedragon/work") />
			</cfcase>
			
			<cfcase value="mail.log">
				<cfset logFilePath = expandPath("/WEB-INF/bluedragon/work/cfmail") />
			</cfcase>
			
			<cfcase value="querybatch.log">
				<cfset logFilePath = expandPath("/WEB-INF/bluedragon/work/cfquerybatch") />
			</cfcase>
			
			<cfcase value="schedule.log">
				<cfset logFilePath = expandPath("/WEB-INF/bluedragon/work/cfschedule") />
			</cfcase>
			
			<!--- for all other log files, assume they're in the default cflog directory --->
			<cfdefaultcase>
				<cfset logFilePath = expandPath("/WEB-INF/bluedragon/work/cflog") />
			</cfdefaultcase>
		</cfswitch>
		
		<cfreturn logFilePath />
	</cffunction>
	
	<cffunction name="getLogFileLines" access="public" output="false" returntype="struct" 
			hint="Returns a struct containing the elements totalLineCount, which is the total number of lines in the log file, and logFileLines, which is an array of log file lines retrieved using the start line and number of lines to display">
		<cfargument name="logFile" type="string" required="true" hint="The name of the log file" />
		<cfargument name="startLine" type="numeric" required="false" default="1" hint="The starting line" />
		<cfargument name="numLinesToShow" type="numeric" required="false" default="25" hint="The number of lines to show" />
		
		<cfset var logFileData = structNew() />
		<cfset var logFileLines = arrayNew(1) />
		<cfset var fileReader = createObject("java", "java.io.FileReader").init("#getLogFilePath(arguments.logFile)#/#arguments.logFile#") />
		<cfset var bufferedReader = createObject("java", "java.io.BufferedReader").init(fileReader) />
		<cfset var lineNumberReader = createObject("java", "java.io.LineNumberReader").init(bufferedReader) />
		<cfset var line = "" />
		<cfset var hasMoreLines = true />
		<cfset var totalLineCount = 0 />
		
		<cfloop condition="hasMoreLines">
			<cfset line = lineNumberReader.readLine() />
			
			<cfif not IsNull(line)>
				<cfset totalLineCount = totalLineCount + 1 />
				
				<cfif lineNumberReader.getLineNumber() gte arguments.startLine 
						and lineNumberReader.getLineNumber() lte (arguments.startLine + arguments.numLinesToShow - 1)>
					<cfset arrayAppend(logFileLines, line) />
				</cfif>
			<cfelse>
				<cfset hasMoreLines = false />
			</cfif>
		</cfloop>
		
		<cfset logFileData.totalLineCount = totalLineCount />
		<cfset logFileData.logFileLines = logFileLines />
		
		<cfset lineNumberReader.close() />
		<cfset bufferedReader.close() />
		<cfset fileReader.close() />
		
		<cfreturn logFileData />
	</cffunction>
	
</cfcomponent>