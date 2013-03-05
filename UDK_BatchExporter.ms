Macroscript AR_UDK_BatchExporter	
category:"Custom"
tooltip:"Export a batch of mesh for the Unreal Engine, ready to be import as a static mesh."
buttontext:"UDK Exporter" 

(
rollout MainWindow "UDK Exporter"
(
  button theButton "Please select what you want to export."
	    on theButton pressed do
		(
			--This save the state of the whole scene
			holdMaxFile() 
			--Declare the index of the array
			i=1
			All= $.count
			--Getting the selection of the user
			MeshSelected = getCurrentSelection()
			--Move every selected mesh to the origin
			selection.position = [0,0,0]
			--Get the export folder
			newFilePath = getSavePath()
			--Setting the FBXExporter for a staticmesh for UDK----------------------------
			--Geometry------------------------------------------------------------------------
			FBXExporterSetParam "SmoothingGroups" true
			FBXExporterSetParam "NormalsPerPoly" false
			FBXExporterSetParam "TangentSpaceExport" true
			FBXExporterSetParam "SmoothMeshExport" false
			FBXExporterSetParam "Preserveinstances" false
			FBXExporterSetParam "SelectionSetExport" false
			FBXExporterSetParam "GeomAsBone" false
			FBXExporterSetParam "Triangulate" true
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
			FBXExporterSetParam "ASCII" false
			FBXExporterSetParam "FileVersion" "FBX201200"
			--This will export every mesh selected as separe file. Each file will have the name of the mesh.
			for i=1 to All do
				(
					--Modifier XForm apply
					resetxform $;
					--The Modifier Stack is collapse
					collapseStack $
					--And finally convert into a Editable Poly
					ConvertTo $ Editable_Poly
					select MeshSelected[i]
					newFileName = MeshSelected[i].name
					completeFilePath = (newFilePath + "\\" + newFileName)  
					exportFile completeFilePath #noPrompt selectedOnly:true using:FBXEXP
				)
			DestroyDialog MainWindow
			--Put back the state of the scene before export
			fetchMaxFile quiet:true
			--Giving the user some feedback
			messagebox "It's done!"
		)
  button CancelButton "Cancel"
  on CancelButton pressed do
	  DestroyDialog MainWindow

  )
  --ceci détermine la taille de MainWindow
createDialog MainWindow 220 60
)

-- MeshSelected = getCurrentSelection()
-- n = MeshSelected[i].name
-- prefix = "MCDXCX"
-- check = findString n prefix
-- print n
-- print check
-- if check != undefined do continue
-- 	
-- n = $.name
-- obj = $
-- c = "MCDCX_"+n as string
-- c = getNodeByName c exact:true ignoreCase:true all:false 
-- select #(obj,c)