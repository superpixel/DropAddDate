(*
	DropAddDate
	Nico Rohrbach for Nose
	2022-04-06
*)

on run
	-- Run via double click, ask for files
	set choosen_items to choose file with prompt "Dateien zur Umbennenung auswŠhlen:" with multiple selections allowed
	processFiles(choosen_items)
end run

on open choosen_items
	-- Run via dropped files
	processFiles(choosen_items)
end open

on processFiles(choosen_files)
	-- Count files choosen
	set choosen_amount to number of items of choosen_files
	-- Ask for Prefix
	set confirm_dialog to display dialog Â
		"Vor den Dateinamen der ausgewŠhlten" & space & choosen_amount & space & "Dateien stellen:" default answer Â
		CurrentTimeString() & "_" default button "OK" with title "DropAddDate" giving up after 20
	-- Rename Files if not canceled
	if button returned of confirm_dialog is "OK" then
		set name_addition to text returned of confirm_dialog
		repeat with i from 1 to number of items in choosen_files
			set this_item to item i of choosen_files
			tell application id "com.apple.Finder" to set current_item_name to name of this_item
			try
				tell application id "com.apple.Finder" to set name of this_item to name_addition & current_item_name
			on error err_msg
				beep
				display alert "Die Datei " & "\"" & current_item_name & "\"" & " konnte nicht umbenannt werden." message err_msg giving up after 10
			end try
		end repeat
	end if
end processFiles

on CurrentTimeString()
	-- Routine to get current date in the form of 'yymmdd'
	set current_day to complementZero(day of (current date))
	set current_month to complementZero(month of (current date) as number)
	set current_year to (year of (current date) as text)
	set current_short_year to text -2 thru -1 of current_year
	return current_short_year & current_month & current_day
end CurrentTimeString

on complementZero(input_num)
	-- Routine to complement with leading zero if neccessary
	set counter to count characters of (input_num as text)
	if counter is less than 2 then
		return "0" & (input_num as text)
	else
		return (input_num as text)
	end if
end complementZero

