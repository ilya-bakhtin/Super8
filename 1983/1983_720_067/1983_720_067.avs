LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov")
assumefps(18)

trim(1, 21373)

crop(240, 0, -240, 0)

Spline64resize(960, 720)
src = last

#return last

# 59, 214, 251, 291, 389, 484, 571, 623, 668, 777, 985, 1139, 1189, 1236, 1459, 1538, 1781, 2018, 2075, 2311, 2361, 2476,
# 2751, 2803, 2882, 3086, 3191, 3227, 3362, 3447, 3702, 3736, 3920, 4143, 4195, 4381, 4623, 4701, 4738, 5017, 5075, 5284,
# 5378, 5586, 5722, 5846, 6151, 6320, 6501, 6582, 6703, 6797, 6806, 6910, 6992, 7165, 7378, 7556, 7673, 7818, 8043, 8186,
# 8364, 8482, 8646, 8841, 9019, 9217, 9419, 9663, 9988, 10219, 10408, 10606, 10614, 10814, 10886, 11185, 11354, 11423,
# 11674, 11750, 11843, 11965, 12197, 12282, 12511, 12691, 12751, 12894, 13008, 13157, 13349, 13528, 13622, 13683, 13801, 14126,
# 14360, 14448, 14511, 14626, 14789, 14959, 15100, 15381, 15523, 15641, 15925, 16109, 16294, 16598, 16765, 16777, 16795,
# 16920, 17110, 17214, 17307, 17393, 17483, 17616, 17689, 17829, 17939, 18162, 18169, 18450, 18471, 18698, 18769, 18850,
#

#v066 = src.trim(9664, 9987).autolevels(ignore=0.0003, filterRadius = 0)
v067 = src.trim(9989, 10218).autolevels(ignore=0.0003, filterRadius = 0)
v068 = src.trim(10220, 10407).autolevels(ignore=0.0003, filterRadius = 0)
v069 = src.trim(10408, 10605).autolevels(ignore=0.0003, filterRadius = 0)
#v070 = src.trim(10606, 10613).autolevels(ignore=0.0003, filterRadius = 0)
v070 = src.trim(10615, 10813).autolevels(ignore=0.0003, filterRadius = 0)
v071 = src.trim(10816, 10885).autolevels(ignore=0.0003, filterRadius = 0)
v072 = src.trim(10887, 11182).autolevels(ignore=0.0003, filterRadius = 0)
v073 = src.trim(11186, 11353).autolevels(ignore=0.0003, filterRadius = 0)
v074 = src.trim(11354, 11422).autolevels(ignore=0.0003, filterRadius = 0)
v075 = src.trim(11425, 11673).autolevels(ignore=0.0003, filterRadius = 0)
v076 = src.trim(11675, 11749).autolevels(ignore=0.0003, filterRadius = 0)
v077 = src.trim(11750, 11842).autolevels(ignore=0.0003, filterRadius = 0)
v078 = src.trim(11844, 11963).autolevels(ignore=0.0003, filterRadius = 0)
v079 = src.trim(11966, 12196).autolevels(ignore=0.00003, filterRadius = 0)
v080 = src.trim(12198, 12280).autolevels(ignore=0.00003, filterRadius = 0)
v081 = src.trim(12283, 12509).autolevels(ignore=0.00003, filterRadius = 0)
v082 = src.trim(12511, 12690).autolevels(ignore=0.00003, filterRadius = 0)
v083 = src.trim(12692, 12749).autolevels(ignore=0.0003, filterRadius = 0)
v084 = src.trim(12781, 12893).autolevels(ignore=0.0003, filterRadius = 0)
v085 = src.trim(12895, 13007).autolevels(ignore=0.0003, filterRadius = 0)
v086 = src.trim(13009, 13154).autolevels(ignore=0.0003, filterRadius = 0)
v087 = src.trim(13158, 13347).autolevels(ignore=0.0003, filterRadius = 0)
v088 = src.trim(13349, 13527).autolevels(ignore=0.0003, filterRadius = 0)
v089 = src.trim(13529, 13621).autolevels(ignore=0.0003, filterRadius = 0)
v090 = src.trim(13623, 13681).autolevels(ignore=0.0003, filterRadius = 0)
v091 = src.trim(13684, 13800).autolevels(ignore=0.0003, filterRadius = 0)
v092 = src.trim(13802, 14125).autolevels(ignore=0.0003, filterRadius = 0)
v093 = src.trim(14127, 14359).autolevels(ignore=0.0003, filterRadius = 0)
v094 = src.trim(14361, 14447).autolevels(ignore=0.0003, filterRadius = 0)
v095 = src.trim(14448, 14510).autolevels(ignore=0.0003, filterRadius = 0)
v096 = src.trim(14511, 14625).autolevels(ignore=0.0003, filterRadius = 0)
v097 = src.trim(14627, 14787).autolevels(ignore=0.0003, filterRadius = 0)
v098 = src.trim(14789, 14958).autolevels(ignore=0.0003, filterRadius = 0)
v099 = src.trim(14960, 15099).autolevels(ignore=0.0003, filterRadius = 0)
#return v099.histogram("levels")

/*
v067 = v067.Filter
v068 = v068.Filter
v069 = v069.Filter
v070 = v070.Filter
v071 = v071.Filter
v072 = v072.Filter
v073 = v073.Filter
v074 = v074.Filter
v075 = v075.Filter
v076 = v076.Filter

v077 = v077.Filter
v078 = v078.Filter

v079 = v079.Filter
v080 = v080.Filter
v081 = v081.Filter

v082 = v082.Filter

v083 = v083.Filter
v084 = v084.Filter(th_SAD = 2000, th_SADC=2000)
v085 = v085.Filter(th_SAD = 1200, th_SADC=1200)
v086 = v086.Filter
v087 = v087.Filter

v088 = v088.Filter
v089 = v089.Filter
v090 = v090.Filter

v091 = v091.Filter
v092 = v092.Filter(th_SAD = 1200, th_SADC=1200)
v093 = v093.Filter
v094 = v094.Filter
v095 = v095.Filter
v096 = v096.Filter(th_SAD = 1200, th_SADC=1200)
v097 = v097.Filter
v098 = v098.Filter
v099 = v099.Filter(th_SAD = 1200, th_SADC=1200)
*/
#return v099.prefetch(6)

v067 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_003_067.avi").ConvertToYV24()
v068 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_068.avi").ConvertToYV24()
v069 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_069.avi").ConvertToYV24()
v070 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_070.avi").ConvertToYV24()
v071 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_071.avi").ConvertToYV24()
v072 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_072.avi").ConvertToYV24()
v073 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_073.avi").ConvertToYV24()
v074 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_074.avi").ConvertToYV24()
v074 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_074.avi").ConvertToYV24()
v074 = v074.trim(1, 0)
v075 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_075.avi").ConvertToYV24()
v076 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_076.avi").ConvertToYV24()
#v077 as is
#v078 as is
v079 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_079.avi").ConvertToYV24()
v080 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_080.avi").ConvertToYV24()
v081 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_081.avi").ConvertToYV24()
#v082 as is
v083 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_083.avi").ConvertToYV24()
v084 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_084.avi").ConvertToYV24()
v085 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_085.avi").ConvertToYV24()
v086 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_086.avi").ConvertToYV24()
v087 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_087.avi").ConvertToYV24()
#v088 as is
#v089 as is
#v090 as is
v091 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_091.avi").ConvertToYV24()
v092 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_092.avi").ConvertToYV24()
v093 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_093.avi").ConvertToYV24()
v094 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_094.avi").ConvertToYV24()
v095 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_095.avi").ConvertToYV24()
v096 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_096.avi").ConvertToYV24()
v097 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_097.avi").ConvertToYV24()
v098 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_098.avi").ConvertToYV24()
v099 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_067\1983_720_099.avi").ConvertToYV24()

v067 = v067.AdjustColor(ou=25, ov=-15, lo_th=0.05, hi_th=0.1, lock_chan=0, x=400, red=0.95, blu=0.86).tweak(sat=2, coring=false)
v067 = v067.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")
/*
v068 = v068.AdjustColor(ou=25, ov=-15, lo_th=0.0, hi_th=0.1, lock_chan=0, x=400, red=0.95, blu=0.9).tweak(sat=2, coring=false)
v068 = v068.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v069 = v069.AdjustColor(ou=25, ov=-15, lo_th=0.0, hi_th=0.1, lock_chan=0, x=400, red=0.95, blu=0.9).tweak(sat=2, coring=false)
v069 = v069.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v070 = v070.AdjustColor(ou=25, ov=-15, lo_th=0.0, hi_th=0.1, lock_chan=0, x=400, red=0.95, blu=0.9).tweak(sat=2, coring=false)
v070 = v070.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v071 = v071.AdjustColor(ou=15, ov=-5, lo_th=0.0, hi_th=0.1, lock_chan=0, x=10, red=0.9, blu=0.9).tweak(sat=2, coring=false)
v071 = v071.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v072 = v072.AdjustColor(ou=15, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=0.9, blu=0.86).tweak(sat=2, coring=false)
v072 = v072.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v073 = v073.AdjustColor(ou=15, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=0.9, blu=0.86).tweak(sat=2, coring=false)
v073 = v073.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v074 = v074.AdjustColor(ou=15, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=0.95, blu=0.86).tweak(sat=2, coring=false)
v074 = v074.RemoveDirt.autogamma(ignore_low=0.002).assumefps(18).AdjustFrameRate(preset_p = "slowest")

v075 = v075.AdjustColor(ou=19, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=200, red=0.9, blu=0.86).tweak(sat=2, coring=false)
v075 = v075.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v076 = v076.AdjustColor(ou=24, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=0.92, blu=0.86).tweak(sat=2, coring=false)
v076 = v076.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v077 = v077.AdjustColor(ou=24, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=0.92, blu=0.86).tweak(sat=2, coring=false)
v077 = v077.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v078 = v078.AdjustColor(ou=27, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=0.92, blu=0.86).tweak(sat=2, coring=false)
v078 = v078.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v079 = v079.AdjustColor(ou=17, ov=-12, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=1, blu=0.86).tweak(sat=2, coring=false)
v079 = v079.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v080 = v080.AdjustColor(ou=21, ov=-14, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=0.86, blu=0.86).tweak(sat=2, coring=false)
v080 = v080.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v081 = v081.AdjustColor(ou=21, ov=-14, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, blu=0.86).tweak(sat=2, coring=false)
v081 = v081.RemoveDirt.autogamma(ignore_low=0.002).assumefps(18).AdjustFrameRate(preset_p = "slowest")

v082 = v082.AdjustColor(ou=12, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=0.9, blu=0.86).tweak(sat=2, coring=false)
v082 = v082.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v083 = v083.AdjustColor(ou=17, ov=-21, lo_th=0.0, hi_th=0.1, lock_chan=0, x=10, red=1, blu=0.9).tweak(sat=2, coring=false)
v083 = v083.RemoveDirt.assumefps(18).autolevels(ignore_low=0.002, gamma=2).AdjustFrameRate(preset_p = "slowest")

v084 = v084.AdjustColor(ou=12, ov=-15, lo_th=0.01, hi_th=0.1, lock_chan=0, x=300, red=1, blu=1).tweak(sat=2, coring=false)
v084 = v084.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v085 = v085.AdjustColor(ou=12, ov=-15, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=1, grn=0.93, blu=1).tweak(sat=2, coring=false)
v085 = v085.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v086 = v086.AdjustColor(ou=10, ov=-12, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=1, grn=0.93, blu=0.93).tweak(sat=2, coring=false)
v086 = v086.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v087 = v087.AdjustColor(ou=15, ov=-12, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=0.95, grn=1, blu=1).tweak(sat=2, coring=false)
v087 = v087.RemoveDirt.autogamma(ignore_low=0.002).assumefps(18).AdjustFrameRate(preset_p = "slowest")

v088 = v088.AdjustColor(ou=10, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=1).tweak(sat=2, coring=false)
v088 = v088.RemoveDirt.assumefps(18).autogamma(ignore_low=0.002).AdjustFrameRate(preset_p = "slowest")

v089 = v089.AdjustColor(ou=10, ov=-12, lo_th=0.01, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=1, gam_mac=false).tweak(sat=2, coring=false)
v089 = v089.RemoveDirt.assumefps(18).autogamma(ignore_low=0.002).AdjustFrameRate(preset_p = "slowest")

v090 = v090.AdjustColor(ou=10, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v090 = v090.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v091 = v091.AdjustColor(ou=10, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1.01, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v091 = v091.RemoveDirt.assumefps(18).autolevels(ignore_low=0.0002, gamma=1.2).AdjustFrameRate(preset_p = "slowest")

v092 = v092.AdjustColor(ou=10, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=200, red=0.98, grn=1.01, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v092 = v092.RemoveDirt.assumefps(18).autolevels(ignore_low=0.0002, gamma=1.2).AdjustFrameRate(preset_p = "slowest")

v093 = v093.AdjustColor(ou=10, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=0.97, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v093 = v093.RemoveDirt.assumefps(18).autolevels(ignore_low=0.0002, gamma=1.3).AdjustFrameRate(preset_p = "slowest")

v094 = v094.AdjustColor(ou=10, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v094 = v094.RemoveDirt.assumefps(18).autolevels(ignore_low=0.0002, gamma=1.3).AdjustFrameRate(preset_p = "slowest")

v095 = v095.AdjustColor(ou=10, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=1, gam_mac=false).tweak(sat=1.5, coring=false)
v095 = v095.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v096 = v096.AdjustColor(ou=10, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v096 = v096.RemoveDirt.assumefps(18).autolevels(ignore_low=0.0002).AdjustFrameRate(preset_p = "slowest")

v097 = v097.AdjustColor(ou=12, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=0.95, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v097 = v097.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v098 = v098.AdjustColor(ou=10, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=0.95, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v098 = v098.RemoveDirt.assumefps(18).autogamma(ignore_low=0.002).AdjustFrameRate(preset_p = "slowest")

v099 = v099.AdjustColor(ou=7, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v099 = v099.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")
*/
last = v067
#last = v067+v068+v069+v070+v071+v072+v073+v074+v075+v076+v077+v078+v079+v080+v081+v082+v083#+\
#last = v084+v085+v086+v087+v088+v089+v090+v091+v092#+\
#last = v093+v094+v095+v096+v097+v098+v099

histogram("levels")
ConvertToYV12
Prefetch(6)

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "lock_chan", bool "gam_mac")
{
    ou = Default(ou, 0)
    ov = Default(ov, 0)
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)
    x = Default(x, 20)
    y = Default(y, 20)
    w = Default(w, -20)
    h = Default(h, -20)
    lo_th = Default(lo_th, 0)
    hi_th = Default(hi_th, 0.1)
    gam_mac = Default(gam_mac, true)
    lock_chan = Default(lock_chan, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=2, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       ConvertToYV24() : c

#    c = c.AdjustDiv2(1, 2)

    return c
}

function Filter(clip c, int "th_SAD", int "th_SADC", float "sigma_y", float "sigma_c")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)

    c = c.SMDegrain(tr=9, thSAD=th_SAD, thSADC=th_SADC, RefineMotion=true, prefilter=2)
    c = c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6).\
          fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

    return c
}

function AdjustDiv2(clip c, int level, int "max_level", float "red", float "grn", float "blu")
{
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)

    max_level = Default(max_level, 4)

    left = c.crop(0, 0, -c.width/2, 0)
    right = c.crop(c.width - c.width/2, 0, 0, 0)

    level = level + 1

    left = level < max_level ? left.AdjustDiv2(level, max_level, red, grn, blu) :\
    left.ConvertToRGB().\
    GamMac(LockChan=1, Scale=2, loTh=0, hiTh=0.1, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=0, w=0).\
    ConvertToYV24()

    right =  level < max_level ? right.AdjustDiv2(level, max_level, red, grn, blu) :\
    right.ConvertToRGB().\
    GamMac(LockChan=1, Scale=2, loTh=0, hiTh=0.1, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=0, w=0).\
    ConvertToYV24()

    return left.stackhorizontal(right)
}

function AdjustFrameRate(clip c, string "preset_p", string "output_p", int "blksize_p")
{
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
#    c = c.Histogram("levels").info
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
    return c
}

function RemoveDirt(clip input, bool "_grey", int "repmode") 
{
    _grey=default(_grey, false)
	repmode=default(repmode, 16)
	clmode=17
	clensed=Clense(input, grey=_grey, cache=4)
	sbegin = ForwardClense(input, grey=_grey, cache=-1)
	send = BackwardClense(input, grey=_grey, cache=-1)
	alt=Repair(SCSelect(input, sbegin, send, clensed, debug=true), input, mode=repmode, modeU = _grey ? -1 : repmode ) 
	restore=Repair(clensed, input, mode=repmode, modeU = _grey ? -1 : repmode)
	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, debug=false, noise=10, noisy=12, grey=_grey)
    return corrected
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode )
}
