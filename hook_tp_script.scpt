tell application "Keyboard Maestro Engine"
	
	do script "tp3_get_task_id_and_title"
	
	set taskID to getvariable "var_tp_task_id"
	set taskText to getvariable "var_tp_task_title"
	
end tell

if taskID = "" then
	
	tell application "TaskPaper"
		set currentFile to file of front document
		set pPath to POSIX path of currentFile
		set pName to name of front document
	end tell
	
	return "[" & pName & "](file://" & pPath & ")"
else
	return "[" & taskText & " ](kmtrigger://macro=tp3_open_taskpaper_task_url&value=" & taskID & ")"
end if


