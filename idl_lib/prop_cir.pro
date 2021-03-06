;==================================================================
;Copyright 2011, 2012  David Pérez-Suárez (TCD-HELIO)
;===================GNU license====================================
;This file is part of SHEBA.
;
;    SHEBA is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    SHEBA is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with SHEBA.  If not, see <http://www.gnu.org/licenses/>.
;==================================================================
pro prop_cir,planets_str=planets_str, spacecraft_str=spacecraft_str,t0=t0,x0=x0,vel=vel,e_vel=e_vel,PATH_OUT=PATH_OUT
if ~keyword_set(path_out) then path_out='/tmp/cir_'+string(strcompress(t0,/remove_all))
if ~keyword_set(t0) then t0 = anytim(systim(),/ccs) else t0=anytim(t0,/ccs)
if ~keyword_set(x0) then x0=[0]; lon-lat HG
if ~keyword_set(vel) then vel=400 ;km/s
if ~keyword_set(e_vel) then e_vel=0 ;km/s

;===================================================================
;====================  Obtain properties of planets and spacecraft if they are not input.
if data_chk(planets_str,/type) ne 8 then ellip = planet_orbit(t0,3,planet=earth,all_planets=planets_str)
if data_chk(spacecraft_str,/type) ne 8 then spacecraft_str  = spacecraft_path(t0,drange=15)

cir_prop_sp,x0=x0,t0=t0,vel=vel,e_vel=e_vel,planets_str=planets_str,spacecraft_str=spacecraft_str

ploting_prop,planets_str,spacecraft_str,path_out,/plot_cir,model='cir'

writing_prop_out,planets_str,spacecraft_str,path_out,model='cir'

end
