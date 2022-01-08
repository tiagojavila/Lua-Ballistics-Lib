-------------------------------------------------------------------------------
--
-- Lua Ballistics Library Examples
--
-------------------------------------------------------------------------------


local ballistics = require( "ballistics" )


-- Default values
local mps = 123.4
local grains = 40
local range_yards = 55
local bullet_drop_inches = -2.1
local scope_click_moa = 1/4
local fps
local grams
local bullet_drop_yards
local moa

print( "\nBegin" )

-- #01
fps = ballistics.MPS_to_FPS( mps )
print( "\n #01: "..mps.." mps = "..fps.." fps" )

-- #02
mps = ballistics.FPS_to_MPS( fps )
print( "\n #02: "..fps.." fps = "..mps.." mps" )

-- #03
grams = ballistics.GR_to_G( grains )
print( "\n #03: "..grains.." gr = "..grams.." g" )

-- #04
grains = ballistics.G_to_GR( grams )
print( "\n #04: "..grams.." g = "..grains.." gr" )

-- #05
print( "\n #05: "..ballistics.Joule_MetricSystem( mps, grams ).." joule ("..mps.." mps; "..grams.." g)" )

-- #06
print( "\n #06: "..ballistics.Joule_ImperialSystem( fps, grains ).." joule ("..fps.." fps; "..grains.." gr)" )

-- #07
print( "\n #07: "..ballistics.FtLb_MetricSystem( mps, grams ).." ft.lb ("..mps.." mps; "..grams.." g)" )

-- #08
print( "\n #08: "..ballistics.FtLb_ImperialSystem( fps, grains ).." ft.lb ("..fps.." fps; "..grains.." gr)" )

-- #09
bullet_drop_yards = ballistics.In_to_Yd(bullet_drop_inches)
ballistics.SetDecimalPrecision( 2 )
moa = ballistics.MOAcorrection( range_yards, bullet_drop_yards )
print(  "\n #09: "..moa.." MOA correction (range: "..range_yards.." yd; drop: "..bullet_drop_inches.."\")" )

-- #10
print( "\n #10: "..ballistics.ClicksForCorrection( moa, scope_click_moa ).." clicks for correction (scope: "..scope_click_moa.." MOA per click)" )


print( "\nEnd" )
--
return 1