IKSys.ikChain $box01 $box02 "IKHISolver"
HDIKSys.ikChain $Box01 $Box04 TRUE 

fn drawLineBetweenTwoPoints pointA pointB =
(
  ss = SplineShape pos:pointA
  addNewSpline ss
  addKnot ss 1 #corner #line PointA
  addKnot ss 1 #corner #line PointB
  updateShape ss
  ss
)
newSpline = drawLineBetweenTwoPoints [-8,0,0] [8,0,0]
newSpline2 = drawLineBetweenTwoPoints [0,-8,0] [0,8,0]
newSpline3 = drawLineBetweenTwoPoints [0,0,-8] [0,0,8]
addAndWeld $Shape001 $Shape002 -1
addAndWeld $Shape001 $Shape003 -1
$Shape001. name = "Pivot4Bone"
$Pivot4Bone.pivot = [0,0,0]
copy $Pivot4Bone
$Pivot4Bone001.pos = [0,16,0]


Shape001.render_displayRenderMesh:true

Shape001.render_renderable BooleanClass default: true -- boolean; renderable

-- Basic CTRL creation -------------------------------------
BasicCTRL1=Circle()
BasicCTRL2=Circle()
BasicCTRL3=Circle()
$Circle002.rotation = (eulerAngles 0 90 0)
$Circle003.rotation = (eulerAngles 90 0 0)
convertToSplineShape($Circle001)
convertToSplineShape($Circle002)
convertToSplineShape($Circle003)
addAndWeld $Circle001 $Circle002 -1
addAndWeld $Circle001 $Circle003 -1
$Circle001. name = "MultiRotCTRL"
copy $MultiRotCTRL

--Original work extended----------------------------------------------------------
rollout pick_box_test "Pick Arm Bones"
(
--filter all objects of class Box:
fn box_filt obj = classof obj == Box
--Pickbutton to select a Box from the scene
pickbutton chooseit "Select Box" width:140 filter:box_filt
--If the user picked an object, then
on chooseit picked obj do
	(
	--see if the user did not cancel the picking...
	if obj != undefined do
		(
		--if he did not, make the box's wireframe red:
		obj.wirecolor = red
		--and display the name of the object on the button:
		chooseit.text = obj.name
		)
	)--end on
	
	--filter all objects of class Box:
fn sphere_filt obj = classof obj == Sphere
--Pickbutton to select a Sphere from the scene
pickbutton chooseit2 "Select Sphere" width:140 filter:sphere_filt
--If the user picked an object, then
on chooseit2 picked obj do
	(
	--see if the user did not cancel the picking...
	if obj != undefined do
		(
		--if he did not, make the box's wireframe red:
		obj.wirecolor = orange
		--and display the name of the object on the button:
		chooseit2.text = obj.name
		)
	)--end on	
)--end rollout
createDialog pick_box_test


--Original Work-------------------------------------------
rollout pick_sphere_test "Pick Sphere Test"
(
--filter all objects of class Box:
fn sphere_filt obj = classof obj == Sphere
--Pickbutton to select a Sphere from the scene
pickbutton chooseit2 "Select Sphere" width:140 filter:sphere_filt
--If the user picked an object, then
on chooseit2 picked obj do
	(
	--see if the user did not cancel the picking...
	if obj != undefined do
		(
		--if he did not, make the box's wireframe red:
		obj.wirecolor = yellow
		--and display the name of the object on the button:
		chooseit2.text = obj.name
		)
	)--end on
)--end rollout
createDialog pick_sphere_test