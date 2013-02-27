	--Geometry------------------------------------------------------------------------
	FBXExporterSetParam "SmoothingGroups" true
	FBXExporterSetParam "NormalsPerPoly" false
	FBXExporterSetParam "TangentSpaceExport" true
	FBXExporterSetParam "SmoothMeshExport" false
	FBXExporterSetParam "Preserveinstances" false
	FBXExporterSetParam "SelectionSetExport" false
	FBXExporterSetParam "GeomAsBone" false
	FBXExporterSetParam "ColladaTriangulate" true
	FBXExporterSetParam "PreserveEdgeOrientation" true
	--Animation------------------------------------------------------------------------
	FBXExporterSetParam "Animation" false
	--Cameras------------------------------------------------------------------------
	FBXExporterSetParam "Cameras" false
	--Lights------------------------------------------------------------------------
	FBXExporterSetParam "Lights" false
	--Embed Media--------------------------------------------------------------------
	FBXExporterSetParam "EmbedTextures" false
	--Units----------------------------------------------------------------------------
	--Axis Conversion-----------------------------------------------------------------
	FBXExporterSetParam "AxisConversionMethod" "None"
	FBXExporterSetParam "UpAxis" "Y" 
	--UI----------------------------------------------------------------
	FBXExporterSetParam "ShowWarnings" true
	FBXExporterSetParam "GenerateLog" false
	--FBX File Format----------------------------------------------------------------
	FBXExporterSetParam "ASCII" true
	FBXExporterSetParam "FileVersion" "FBX201200"

rollout MainWindow "UDK Batch Exporter"
(
  button theButton "Please select what you want to export."
	    on theButton pressed do
		(
			SelectionList = getCurrentSelection()
			i=1
			newFileName = SelectionList[i].name
			print SelectionList[i].name
			SelectionList.pos = [0,0,0]
			newFilePath = getSavePath()
			completeFilePath = (newFilePath + "\\" + newFileName)  
			exportFile completeFilePath #noPrompt selectedOnly:true using:FBXEXP
			DestroyDialog MainWindow
			messagebox "It's done!"
		)
  button CancelButton "Cancel"
  on CancelButton pressed do
	  DestroyDialog MainWindow

  )
  --ceci détermine la taille de MainWindow
createDialog MainWindow 220 60
  
  --for current in geometry do
(
    SelectionList = getCurrentSelection()
    newFileName = SelectionList[i].name
	print SelectionList[i].name
	newFilePath = getSavePath()
	completeFilePath = (newFilePath + "\\" + newFileName)  
	
    exportFile completeFilePath #noPrompt selectedOnly:true using:FBXEXP
)
	--(
	--i=1
    --SelectionList = getCurrentSelection()
	--for i=1 to SelectionList.count do
	--getCurrentSelection()
    --newFileName = SelectionList[i].name
	--print SelectionList[i].name
	--newFileName = current.name
	--newFilePath = getSavePath()
	--completeFilePath = getSavepath
    -- newFilePath = pathConfig.GetDir #export
	--completeFilePath = (newFilePath + "\\" + newFileName)  
	
    --exportFile completeFilePath #noPrompt selectedOnly:true using:FBXEXP
	--)

--clearSelection()

