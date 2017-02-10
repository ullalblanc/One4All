-- Name: Cat MuscleStrand Mirrored handle Direction temp Fix
-- Author: Sk-Films 
--Date: 13.07.13

--Description:

-- Use in case, if mirrored MuscleStrand have weird longitudinal rotation in animation.
-- Run script. Select necessary muscle(s) without selecting its handles (avoid to select any other objects). Press Rotate in script window.

--Note: The script is temporal. So might give errors if any foreign objercts selected (other than main muscle object).

--www.sk-films.com


Try destroydialog PivotRota
catch ()


fn RotPiv= 
(
	
sel =  getCurrentSelection()
	
	for i in sel do
		
	(
	select i
	
	start = $.Handles [1] 
	starth = $.Handles [2] 
	end = $.Handles [3]
	endh = $.Handles [4] 	

	startOldposition = starth.position
	endOldposition = endh.position
	angl = 180

	in coordsys local  rotate start (EulerAngles 0 0 -angl)
	in coordsys local  rotate end (EulerAngles 0 0 -angl)
	
	starth.position = 	startOldposition
	endh.position = 	endOldposition
	)
	
)





rollout PivotRota "Pivot Rotation" width:186 height:146
(
	button btn1 "Rotate Pivot 180 Y" pos:[32,46] width:126 height:70
	
	on btn1 pressed do RotPiv()
	
)
createdialog PivotRota



