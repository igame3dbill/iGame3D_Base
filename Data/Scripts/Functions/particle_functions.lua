emt={}
emt.fireball={}
emt.flaming={}


function SETemitterStyle(whichEmitter,style)
doit="emitter=".."emt."..style
loadstring(doit)()
for i,v in pairs(emitter) do
emissionCommand= GETEmitterStyle(whichEmitter,style,i)
--print(emissionCommand)
loadstring(emissionCommand)()
end
end

function GETEmitterStyle(whichEmitter,style,what)
if whichEmitter == nil then style = "fireball" end
if what ~= nil then
emitter="m=".."emt."..style.."."..what
loadstring(emitter)()
result="setParticle_emitterInfo(".. whichEmitter..",IG3D_"..what..",".. m..")"
return result
end

function setEmitters()
emt.flaming.AMOUNT=-1

emt.fireball.TEXTURE="\"".."Images/fire-animated.mov".."\""
end
setEmitters()
SETemitterStyle("anyemitter","flaming")



firename,firepath = "fire001","Data/Emitters/firebig.emt"
function newEmitter(name,path)
local i = #gParticleNamesAndEMTs+1
if name == nil then 
name ="fire00"..i
path = "Data/Emitters/firebig.emt"
end
local cx,cy,cz = getCameraInfo(IG3D_POSITION)
table.insert(gParticleNamesAndEMTs,{name,path})
table.insert(gParticlePositions,{cx,cy,cz})
table.insert(gParticleRotations,{0,0,0})

gParticleEmitters[i]={}
gParticleEmitters[i]=make(ig3d_particle_emitter, gParticleNamesAndEMTs[i][1], gParticleNamesAndEMTs[i][2])

	setParticle_emitterInfo(gParticleEmitters[i], IG3D_POSITION, gParticlePositions[i][1],gParticlePositions[i][2],gParticlePositions[i][3])
	
	setParticle_emitterInfo(gParticleEmitters[i], IG3D_ROTATION, gParticleRotations[i][1],gParticleRotations[i][2],gParticleRotations[i][3])
	runningParticle = get(ig3d_particle_emitter, name)
setParticle_emitterInfo(runningParticle, IG3D_START)
end
