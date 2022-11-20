-- RTS_Car_Def.lua

dofile(gameroot.."Data/Scripts/Games/RTS_Functions/RTS_Vehicles.lua")

cars={}


local i,ii,checkName,shortName
-- identify cars
for i=1,#gObjects,1 do
	checkName=string.sub(getObjectInfo(gObjects[i].cObj, IG3D_NAME),1,4)
	shortName = string.sub(checkName, 1,3)

if shortName =="car" or checkName == "cama" then
--print(getObjectInfo(gObjects[i].cObj, IG3D_NAME))
		table.insert(cars, gObjects[i])
		setObjectInfo(gObjects[i].cObj, IG3D_CAST_SHADOW, gDoShadows, "Vehicles_land/vehicleshadow.wtf")
		setObjectInfo(gObjects[i].cObj, IG3D_LOD_MODEL, computeLODModelName(gObjects[i]))
		setObjectInfo(gObjects[i].cObj, IG3D_VECTOR_CONSTRAINT, 0,0,0)
		local m,ix,iy,iz=getObjectInfo(gObjects[i].cObj, IG3D_MASS)
		setObjectInfo(gObjects[i].cObj, IG3D_MASS, 20*m,20*ix,20*iy,20*iz)
		gObjects[i].isVehicle=true
		--setObjectInfo(gObjects[i].cObj, IG3D_VEHICLE, true)
		gObjects[i].health=-10--gets assigned health when a driver comes
		gObjects[i].alive=false
		gObjects[i].team = 3
		gObjects[i].skidSndEmt= assign_free_sound_emitter()
		setSound_emitterInfo(gObjects[i].skidSndEmt, IG3D_SAMPLE, "Data/Sounds/skid.ogg")
		setSound_emitterInfo(gObjects[i].skidSndEmt, IG3D_LOOP, true)
		gObjects[i].engineSndEmt= assign_free_sound_emitter()
		setSound_emitterInfo(gObjects[i].engineSndEmt, IG3D_SAMPLE, "Data/Sounds/engine.ogg")
		setSound_emitterInfo(gObjects[i].engineSndEmt, IG3D_LOOP, true)
		init_car(gObjects[i])
		table.insert(cars, gObjects[i])--this is a car
	end
end
--print("# cars=",#cars)