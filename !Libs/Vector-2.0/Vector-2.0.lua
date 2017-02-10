--[[
Name: Vector-2.0
Revision: $Rev: 13373 $
Author(s): Dreyruugr (dreyruugr@gmail.com)
Website: http://wiki.wowace.com/index.php/Vector-2.0
Documentation: http://wiki.wowace.com/index.php/Vector-2.0_API_Documentation
SVN: http://svn.wowace.com/root/trunk/VectorLib/Vector-2.0
Description: A simple set of vector libraries
Dependencies: AceLibrary, AceOO-2.0
]]

local MAJOR_VERSION = "Vector-2.0"
local MINOR_VERSION = "$Revision: 13373 $"
local VECTOR2D_MAJOR_VERSION = "Vector2D-2.0"
local VECTOR3D_MAJOR_VERSION = "Vector3D-2.0"

if not AceLibrary then error( MAJOR_VERSION .. " requires AceLibrary." ) end
if not AceLibrary:IsNewVersion( MAJOR_VERSION, MINOR_VERSION ) then return end

if not AceLibrary:HasInstance("AceOO-2.0") then error( MAJOR_VERSION.." requires AceOO-2.0.") end
local AceOO = AceLibrary( "AceOO-2.0" )

AceLibrary:Register( {}, MAJOR_VERSION, MINOR_VERSION )

local Vector2D = AceOO.Class()

function Vector2D.prototype:init( x, y )
	AceLibrary(VECTOR2D_MAJOR_VERSION).super.prototype.init(self) -- very important. Will fail without this.
	self.x = x;
	self.y = y;
	self.length = nil;
end

function Vector2D.prototype:Set( x, y )
	self.x = x;
	self.y = y;
	self.length = nil;
end

function Vector2D.prototype:Add( otherVec )
	return AceLibrary(VECTOR2D_MAJOR_VERSION):new( self.x + otherVec.x, self.y + otherVec.y );
end

function Vector2D.prototype:Subtract( otherVec )
	return AceLibrary(VECTOR2D_MAJOR_VERSION):new( self.x - otherVec.x, self.y - otherVec.y );
end

function Vector2D.prototype:Multiply( otherVec )
	return AceLibrary(VECTOR2D_MAJOR_VERSION):new( self.x * otherVec.x, self.y * otherVec.y );
end

function Vector2D.prototype:OffsetFrom( otherVec )
	distVec = self - otherVec;
	return distVec:GetLength();
end

function Vector2D.prototype:GetLength()
	if ( self.length == nil ) then
		self.length = sqrt( (self.x * self.x) + (self.y * self.y) );
	end
	return self.length;
end

function Vector2D.prototype:Dot( otherVec )
	return (self.x * self.x) + (otherVec.y * otherVec.y);
end

function Vector2D.prototype:Normalize()
	if ( self:GetLength() == 0 ) then
		self.x = 0
		self.y = 0
		self.length = 0
		return
	end
	
	self.x = self.x / self:GetLength()
	self.y = self.y / self:GetLength()
	self.length = 1;
end

function Vector2D.prototype:GetAngle()
	local angle = atan2( self.y, self.x );
	if ( angle < 0 ) then
		angle = 360 + angle;
	end
	return angle;
end

function Vector2D.prototype:ToString() 
	return string.format( "<%s instance>", tostring(self.class) )
end

AceLibrary:Register( Vector2D, VECTOR2D_MAJOR_VERSION, MINOR_VERSION )
Vector2D = nil
