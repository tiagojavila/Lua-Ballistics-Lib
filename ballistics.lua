-------------------------------------------------------------------------------
--
-- Lua Ballistics Library
-- By Tiago Jose Avila
-- Public domain http://www.unlicense.org/
--
-------------------------------------------------------------------------------

local ballistics = {}

local DefaultDecimalPrecision = 5

----------------------------------------------------
--- Set decimal precision for ballistics library ---
----------------------------------------------------
function ballistics.SetDecimalPrecision( decimalPrecision )
	DefaultDecimalPrecision = decimalPrecision
	return DefaultDecimalPrecision
end

------------------------------------------------------
--- Round a number to a specific decimal precision ---
------------------------------------------------------
function ballistics.Round( number, decimalPrecision )
	local power = 10^decimalPrecision
	return math.floor( number * power  + 0.5 ) / power
end

----------------------------
--- Linear interpolation ---
----------------------------
function ballistics.LinearInterpolation(x, x0, x1, y0, y1)
	local y = y0 + (x - x0) * ((y1 - y0) / (x1 - x0))
	return y
end

----------------------------------
--- Unit Converter: MPS to FPS ---
----------------------------------
function ballistics.MPS_to_FPS( mps )
	local fps = mps * 3.280839895
	return ballistics.Round( fps, DefaultDecimalPrecision )
end

----------------------------------
--- Unit Converter: FPS to MPS ---
----------------------------------
function ballistics.FPS_to_MPS( fps )
	local fps = fps * 0.3048
	return ballistics.Round( fps, DefaultDecimalPrecision )
end

----------------------------------
--- Unit Converter: MPH to MPS ---
----------------------------------
function ballistics.MPH_to_MPS( mph )
	local mps = mph * 0.44704
	return ballistics.Round( mps, DefaultDecimalPrecision )
end

----------------------------------
--- Unit Converter: MPS to MPH ---
----------------------------------
function ballistics.MPS_to_MPH( mps )
	local mph = mps * 2.2369362921
	return ballistics.Round( mph, DefaultDecimalPrecision )
end

----------------------------------
--- Unit Converter: MPS to KPH ---
----------------------------------
function ballistics.MPS_to_KPH( mps )
	local kph = mps * 3.6
	return ballistics.Round( kph, DefaultDecimalPrecision )
end

----------------------------------
--- Unit Converter: KPH to MPS ---
----------------------------------
function ballistics.KPH_to_MPS( kph )
	local mps = kph / 3.6
	return ballistics.Round( mps, DefaultDecimalPrecision )
end

-------------------------------------
--- Unit Converter: MPS to Ft/Min ---
-------------------------------------
function ballistics.MPS_to_FtMin( mps )
	local FtMin = mps * 196.8503937
	return ballistics.Round( FtMin, DefaultDecimalPrecision )
end

--------------------------------------
--- Unit Converter: Meters to Feet ---
--------------------------------------
function ballistics.M_to_Ft( meters )
	local feet = meters * 3.280839895
	return ballistics.Round( feet, DefaultDecimalPrecision )
end

--------------------------------------
--- Unit Converter: Feet to Meters ---
--------------------------------------
function ballistics.Ft_to_M( feet )
	local meters = feet * 0.3048
	return ballistics.Round( meters, DefaultDecimalPrecision )
end

---------------------------------------
--- Unit Converter: Meters to Yards ---
---------------------------------------
function ballistics.M_to_Yd( meters )
	local yards =  meters * 1.0936132983
	return ballistics.Round( yards, DefaultDecimalPrecision )
end

---------------------------------------
--- Unit Converter: Yards to Meters ---
---------------------------------------
function ballistics.Yd_to_M( yards )
	local meters = yards * 0.9144
	return ballistics.Round( meters, DefaultDecimalPrecision )
end

---------------------------------------
--- Unit Converter: Yards to Inches ---
---------------------------------------
function ballistics.Yd_to_In( yards )
	local inches = yards * 36
	return ballistics.Round( inches, DefaultDecimalPrecision )
end

---------------------------------------
--- Unit Converter: Inches to Yards ---
---------------------------------------
function ballistics.In_to_Yd( inches )
	local yards = inches / 36
	return ballistics.Round( yards, DefaultDecimalPrecision )
end

----------------------------------------
--- Unit Converter: Inches to Meters ---
----------------------------------------
function ballistics.In_to_M( inches )
	local meters = inches * 0.0254
	return ballistics.Round( meters, DefaultDecimalPrecision )
end

----------------------------------------
--- Unit Converter: Meters to Inches ---
----------------------------------------
function ballistics.M_to_In( meters )
	local inches = meters / 0.0254
	return ballistics.Round( inches, DefaultDecimalPrecision )
end

---------------------------------------------
--- Unit Converter: Meters to Centimeters ---
---------------------------------------------
function ballistics.M_to_Cm( meters )
	local centimeters = meters * 100
	return ballistics.Round( centimeters, DefaultDecimalPrecision )
end

---------------------------------------------
--- Unit Converter: Centimeters to Inches ---
---------------------------------------------
function ballistics.Cm_to_In( centimeters )
	local inches = centimeters / 2.54
	return ballistics.Round( inches, DefaultDecimalPrecision )
end

---------------------------------------------
--- Unit Converter: Inches to Centimeters ---
---------------------------------------------
function ballistics.In_to_Cm( inches )
	local centimeters = inches * 2.54
	return ballistics.Round( centimeters, DefaultDecimalPrecision )
end

------------------------------------
--- Unit Converter: KG to GRAINS ---
------------------------------------
function ballistics.KG_to_GRAINS( kg )
	local grains = kg * 15432.3583529
	return ballistics.Round( grains, DefaultDecimalPrecision )
end

------------------------------------
--- Unit Converter: GRAINS to KG ---
------------------------------------
function ballistics.GRAINS_to_KG( grains )
	local kg = grains * 0.00006479891
	return ballistics.Round( kg, DefaultDecimalPrecision )
end

---------------------------------------
--- Unit Converter: GRAMS to GRAINS ---
---------------------------------------
function ballistics.G_to_GR( g )
	local gr = g * 15.4323583529
	return ballistics.Round( gr, DefaultDecimalPrecision )
end

---------------------------------------
--- Unit Converter: GRAINS to GRAMS ---
---------------------------------------
function ballistics.GR_to_G( gr )
	local g = gr * 0.06479891
	return ballistics.Round( g, DefaultDecimalPrecision )
end

--------------------------------
--- Unit Converter: ºC to ºF ---
--------------------------------
function ballistics.C_to_F( c )
	local f = ((c * 9) / 5) + 32
	return ballistics.Round( f, DefaultDecimalPrecision )
end

--------------------------------
--- Unit Converter: ºF to ºC ---
--------------------------------
function ballistics.F_to_C( f )
	local c = (f - 32) * 5/9
	return ballistics.Round( c, DefaultDecimalPrecision )
end

-------------------------------------
--- Unit Converter: Joule to FtLb ---
-------------------------------------
function ballistics.Joule_to_FtLb( joule )
	local ftlb = joule * 0.7375621492773
	return ballistics.Round( ftlb, DefaultDecimalPrecision )
end

-------------------------------------
--- Unit Converter: FtLb to Joule ---
-------------------------------------
function ballistics.FtLb_to_Joule( ftlb )
	local joule = ftlb * 1.3558179483314
	return ballistics.Round( joule, DefaultDecimalPrecision )
end

------------------------------------------------------------------
--- MOA correction (range and bullet_drop must have same unit) ---
------------------------------------------------------------------
function ballistics.MOAcorrection( range, bullet_drop )
	if range == 0 then
		return 0
	end
	local moa = -bullet_drop / (0.000290888 * range)
	return ballistics.Round( moa, DefaultDecimalPrecision )
end

-------------------------------------------------------------------
--- MRAD correction (range and bullet_drop must have same unit) ---
-------------------------------------------------------------------
function ballistics.MRADcorrection( range, bullet_drop )
	if range == 0 then
		return 0
	end
	local mrad = -bullet_drop / (0.001 * range )
	return ballistics.Round( mrad, DefaultDecimalPrecision )
end

----------------------------------------------------------------------------
--- 1 inch @100yd correction (range and bullet_drop must have same unit) ---
----------------------------------------------------------------------------
function ballistics.IN100YDcorrection( range, bullet_drop )
	if range == 0 then
		return 0
	end
	local in100yd = -bullet_drop / (0.000277778 * range )
	return ballistics.Round( in100yd, DefaultDecimalPrecision )
end

---------------------------------------------
--- Clicks for correction (Up>0 / Down<0) ---
---------------------------------------------
function ballistics.ClicksForCorrection( moa_mrad_in100yd, scope_click_value )
	local click = moa_mrad_in100yd / scope_click_value
	return ballistics.Round( click, 0 )
end

-----------------------------
--- Joule (metric system) ---
-----------------------------
function ballistics.Joule_MetricSystem( mps, grams )
	local joule = mps * mps * grams/2000
	return ballistics.Round( joule, DefaultDecimalPrecision )
end

-------------------------------
--- Joule (imperial system) ---
-------------------------------
function ballistics.Joule_ImperialSystem( fps, grains )
	local mps = ballistics.FPS_to_MPS( fps )
	local grams = ballistics.GR_to_G( grains )
	return ballistics.Joule_MetricSystem( mps, grams )
end

----------------------------
--- FtLb (metric system) ---
----------------------------
function ballistics.FtLb_MetricSystem( mps, grams )
	local joule = ballistics.Joule_MetricSystem( mps, grams )
	local ftlb = ballistics.Joule_to_FtLb( joule )
	return ballistics.Round( ftlb, DefaultDecimalPrecision )
end

------------------------------
--- FtLb (imperial system) ---
------------------------------
function ballistics.FtLb_ImperialSystem( fps, grains )
	local joule = ballistics.Joule_ImperialSystem( fps, grains )
	local ftlb = ballistics.Joule_to_FtLb( joule )
	return ballistics.Round( ftlb, DefaultDecimalPrecision )
end


---
return ballistics