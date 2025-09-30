#LoadPlugin("C:\Program Files (x86)\AviSynth+\plugins64\rife\RIFE.dll")
LoadPlugin("d:\Program Files (x86)\AviSynth+\plugins64\rife\RIFE.dll")

dir = "\\seiki5\n\Media\video\Super8\wrk\1977-1979\"

v001 = LSMASHVideoSource(dir + "v1r.mp4").assumeFPS(18)

#################
v0 = LSMASHVideoSource("\\seiki5\n\Media\Video\1- готовые_фильмы\1977-1990\1977-1979\11214 Bakhtin 02 S8.720p.mov-00-04.avi.mp4") +\
     LSMASHVideoSource("\\seiki5\n\Media\Video\1- готовые_фильмы\1977-1990\1977-1979\11214 Bakhtin 02 S8.720p.mov-05-10.avi.mp4") +\
     LSMASHVideoSource("\\seiki5\n\Media\Video\1- готовые_фильмы\1977-1990\1977-1979\11214 Bakhtin 02 S8.720p.mov-11-13.avi.mp4")
v0 = v0.spline64Resize(1920, 1080)
dl = (v0.width - v001.width)/2
dr = (v0.width - v001.width) - dl
v0 = v0.crop(dl, 0, -dr, 0)
#v0 = v0.assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16)
#return v0.info
v0 = v0.trim(0, 8694).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16) +\
     v0.trim(8695, 8761).assumeFps(18) +\
     v0.trim(8762, 8937).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(8938, 9062).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16) +\
     v0.trim(9063, 9343).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(9344, 9516).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(9517, 9830).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(9831, 9951).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(9952, 10147).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10148, 10212).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10213, 10246).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10247, 10283).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10284, 10371).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10372, 10444).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10445, 10509).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16) +\
     v0.trim(10510, 10541).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10542, 10594).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10595, 10787).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16) +\
     v0.trim(10788, 10900).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10901, 10920).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(10921, 11080).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11081, 11309).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11310, 11350).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11351, 11385).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11386, 11459).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16) +\
     v0.trim(11460, 11497).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11498, 11544).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11545, 11647).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16) +\
     v0.trim(11648, 11710).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11711, 11719).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11720, 11730).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11731, 11759).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=12, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11760, 11778).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(11779, 12711).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16) +\
     v0.trim(12712, 12797).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=16, NewDen=1, blksize=16).assumeFPS(18) +\
     v0.trim(12798, 0).assumeFps(24).convertToYV12.FrameRateConverter(Output="Flow", Preset="Slow", NewNum=18, NewDen=1, blksize=16)
#11760, 11778

v0 = v0.trim(3, 27) + v001.trim(25, 30) + v0.trim(28, 0)
v0o = v0
v0o = v0o.info
/*
#v001 - v032
v0 = v0o.trim(0, 255) + v0o.trim(255, 317) + v0o.trim(317, 338) + v0o.trim(338, 402) + v0o.trim(402, 683) + v0o.trim(683, 995) +\
     v0o.trim(995, 1237) + v0o.trim(1237, 1386) + v0o.trim(1386, 1471) + v0o.trim(1471, 1683) + v0o.trim(1683, 1795) +\
     v0o.trim(1795, 2014) + v0o.trim(2014, 2159) + v0o.trim(2159, 2277) + v0o.trim(2277, 2312) + v0o.trim(2312, 2367) +\
     v0o.trim(2367, 0)
# here will be trim(2367, 2532)

# start from v033
v0 = v0o.trim(2368, 2532) + v0o.trim(2532, 2627) + v0o.trim(2627, 2739) + v0o.trim(2739, 2767) + v0o.trim(2767, 2835) +\
     v0o.trim(2835, 2926) + v0o.trim(2926, 2951) + v0o.trim(2951, 3095) + v0o.trim(3095, 3296) + v0o.trim(3296, 3304) +\
     v0o.trim(3304, 3330) + v0o.trim(3330, 3368) + v0o.trim(3368, 3510) + v0o.trim(3513, 3528) + v0o.trim(3528, 3846) +\
     v0o.trim(3846, 0)
# here will be trim(3846, 4182)

# start from 4173
v0 = v0o.trim(4173, 4182) + v0o.trim(4182, 4200) + v0o.trim(4200, 4331) + v0o.trim(4331, 4722) + v0o.trim(4722, 4755) +\
     v0o.trim(4755, 4821) + v0o.trim(4821, 4847) + v0o.trim(4847, 4865) + v0o.trim(4865, 4895) + v0o.trim(4895, 4914) +\
     v0o.trim(4914, 4971) + v0o.trim(4971, 5031) + v0o.trim(5031, 5054) + v0o.trim(5054, 5073) + v0o.trim(5073, 0)
# at the end will be trim(5073, 5096)

# start from 5074
v0 = v0o.trim(5074, 5096) + v0o.trim(5096, 5303) + v0o.trim(5303, 5345) + v0o.trim(5345, 5409) + v0o.trim(5409, 5432) +\
     v0o.trim(5432, 5470) + v0o.trim(5470, 5621) + v0o.trim(5621, 5699) + v0o.trim(5699, 5753) + v0o.trim(5753, 5829) +\
     v0o.trim(5829, 5877) + v0o.trim(5877, 5903) + v0o.trim(5903, 6219) + v0o.trim(6219, 6283) + v0o.trim(6283, 6309) +\
     v0o.trim(6309, 6397)
# at the end will be trim(6309, 6456)

v0 = v0o.trim(6398, 6456) + v0o.trim(6456, 6488) + v0o.trim(6488, 6592) + v0o.trim(6592, 6707) + v0o.trim(6707, 7238) +\
     v0o.trim(7238, 7473) + v0o.trim(7473, 7699) + v0o.trim(7699, 7734) + v0o.trim(7734, 7949) + v0o.trim(7949, 8198) +\
     v0o.trim(8198, 8263) + v0o.trim(8263, 8271) + v0o.trim(8271, -1)
*/
v0 = v0o.trim(8272, 8348) + v0o.trim(8348, 8380) + v0o.trim(8380, 8397) + v0o.trim(8397, 8560) + v0o.trim(8560, 8646) +\
     v0o.trim(8646, 8755) + v0o.trim(8755, 8824) + v0o.trim(8824, 8885) + v0o.trim(8885, 9059) + v0o.trim(9059, 9122) +\
     v0o.trim(9122, 0)
#################
#return v0.info
/*
v002 = LSMASHVideoSource(dir + "v2r.mp4").assumeFPS(18)
v003 = LSMASHVideoSource(dir + "v3r.mp4").assumeFPS(18)
v004 = LSMASHVideoSource(dir + "v4r.mp4").assumeFPS(18).trim(1, 0)
v005 = LSMASHVideoSource(dir + "v5r.mp4").assumeFPS(18)
v006 = LSMASHVideoSource(dir + "v6r.mp4").assumeFPS(18)
v007 = LSMASHVideoSource(dir + "v7r.mp4").assumeFPS(18)
v008 = LSMASHVideoSource(dir + "v8r.mp4").assumeFPS(18)
v009 = LSMASHVideoSource(dir + "v9r.mp4").assumeFPS(18)
v010 = LSMASHVideoSource(dir + "v10r.mp4").assumeFPS(18)
v011 = LSMASHVideoSource(dir + "v11r.mp4").assumeFPS(18)
v011 = v011.trim(0, v011.frameCount - 2)
v012 = LSMASHVideoSource(dir + "v12r.mp4").assumeFPS(18)
v013 = LSMASHVideoSource(dir + "v13r.mp4").assumeFPS(18)
v013 = v013.trim(0, v013.frameCount - 2)
v014 = LSMASHVideoSource(dir + "v14r.mp4").assumeFPS(18)
v015 = LSMASHVideoSource(dir + "v15r.mp4").assumeFPS(18)
v016 = LSMASHVideoSource(dir + "v16r.mp4").assumeFPS(18)
v017 = LSMASHVideoSource(dir + "v17r.mp4").assumeFPS(18)
v018 = LSMASHVideoSource(dir + "v18r.mp4").assumeFPS(18)
v019 = LSMASHVideoSource(dir + "v19r.mp4").assumeFPS(18)
v020 = LSMASHVideoSource(dir + "v20r.mp4").assumeFPS(18)
v021 = LSMASHVideoSource(dir + "v21r.mp4").assumeFPS(18)
v022 = LSMASHVideoSource(dir + "v22r.mp4").assumeFPS(18)
v023 = LSMASHVideoSource(dir + "v23r.mp4").assumeFPS(18)
v024 = LSMASHVideoSource(dir + "v24r.mp4").assumeFPS(18)
v025 = LSMASHVideoSource(dir + "v25r.mp4").assumeFPS(18)
v026 = LSMASHVideoSource(dir + "v26r.mp4").assumeFPS(18)
v027 = LSMASHVideoSource(dir + "v27r.mp4").assumeFPS(18)
v028 = LSMASHVideoSource(dir + "v28r.mp4").assumeFPS(18)
v029 = LSMASHVideoSource(dir + "v29r.mp4").assumeFPS(18)
v030 = LSMASHVideoSource(dir + "v30r.mp4").assumeFPS(18)
v031 = LSMASHVideoSource(dir + "v31r.mp4").assumeFPS(18)
v032 = LSMASHVideoSource(dir + "v32r.mp4").assumeFPS(18)

v033 = LSMASHVideoSource(dir + "v33r.mp4").assumeFPS(18)
v034 = LSMASHVideoSource(dir + "v34r.mp4").assumeFPS(18)
v035 = LSMASHVideoSource(dir + "v35r.mp4").assumeFPS(18)
v036 = LSMASHVideoSource(dir + "v36r.mp4").assumeFPS(18)
v037 = LSMASHVideoSource(dir + "v37r.mp4").assumeFPS(18)
v038 = LSMASHVideoSource(dir + "v38r.mp4").assumeFPS(18)
v039 = LSMASHVideoSource(dir + "v39r.mp4").assumeFPS(18)
v040 = LSMASHVideoSource(dir + "v40r.mp4").assumeFPS(18)
v041 = LSMASHVideoSource(dir + "v41r.mp4").assumeFPS(18)
v042 = LSMASHVideoSource(dir + "v42r.mp4").assumeFPS(18)
v043 = LSMASHVideoSource(dir + "v43r.mp4").assumeFPS(18)
v044 = LSMASHVideoSource(dir + "v44r.mp4").assumeFPS(18)
v045 = LSMASHVideoSource(dir + "v45r.mp4").assumeFPS(18)
v046 = LSMASHVideoSource(dir + "v46r.mp4").assumeFPS(18)
v047 = LSMASHVideoSource(dir + "v47r.mp4").assumeFPS(18)
v048 = LSMASHVideoSource(dir + "v48r.mp4").assumeFPS(18)
v048 = v048.trim(0, v048.frameCount - 2)
v049 = LSMASHVideoSource(dir + "v49r.mp4").assumeFPS(18).trim(1, 0)
v050 = LSMASHVideoSource(dir + "v50r.mp4").assumeFPS(18)
v051 = LSMASHVideoSource(dir + "v51r.mp4").assumeFPS(18)
v052 = LSMASHVideoSource(dir + "v52r.mp4").assumeFPS(18)
v053 = LSMASHVideoSource(dir + "v53r.mp4").assumeFPS(18)
v054 = LSMASHVideoSource(dir + "v54r.mp4").assumeFPS(18)
v055 = LSMASHVideoSource(dir + "v55r.mp4").assumeFPS(18)
v056 = LSMASHVideoSource(dir + "v56r.mp4").assumeFPS(18)
v057 = LSMASHVideoSource(dir + "v57r.mp4").assumeFPS(18)
v058 = LSMASHVideoSource(dir + "v58r.mp4").assumeFPS(18)
#v059 = LSMASHVideoSource(dir + "v59r.mp4").assumeFPS(18)
v060 = LSMASHVideoSource(dir + "v60r.mp4").assumeFPS(18)
v061 = LSMASHVideoSource(dir + "v61r.mp4").assumeFPS(18)
v062 = LSMASHVideoSource(dir + "v62r.mp4").assumeFPS(18)
v063 = LSMASHVideoSource(dir + "v63r.mp4").assumeFPS(18)
v064 = LSMASHVideoSource(dir + "v64r.mp4").assumeFPS(18)

v065 = LSMASHVideoSource(dir + "v65r.mp4").assumeFPS(18)
v066 = LSMASHVideoSource(dir + "v66r.mp4").assumeFPS(18)
v067 = LSMASHVideoSource(dir + "v67r.mp4").assumeFPS(18)
v068 = LSMASHVideoSource(dir + "v68r.mp4").assumeFPS(18)
v069 = LSMASHVideoSource(dir + "v69r.mp4").assumeFPS(18)
v069 = v069.trim(0, v069.frameCount - 3)
v070 = LSMASHVideoSource(dir + "v70r.mp4").assumeFPS(18)
v071 = LSMASHVideoSource(dir + "v71r.mp4").assumeFPS(18)
v072 = LSMASHVideoSource(dir + "v72r.mp4").assumeFPS(18)
v073 = LSMASHVideoSource(dir + "v73r.mp4").assumeFPS(18)
v073 = v073.trim(0, v073.frameCount - 2)
v074 = LSMASHVideoSource(dir + "v74r.mp4").assumeFPS(18)
v075 = LSMASHVideoSource(dir + "v75r.mp4").assumeFPS(18)
v076 = LSMASHVideoSource(dir + "v76r.mp4").assumeFPS(18)
v077 = LSMASHVideoSource(dir + "v77r.mp4").assumeFPS(18)
v078 = LSMASHVideoSource(dir + "v78r.mp4").assumeFPS(18)
v079 = LSMASHVideoSource(dir + "v79r.mp4").assumeFPS(18)
v080 = LSMASHVideoSource(dir + "v80r.mp4").assumeFPS(18)
v081 = LSMASHVideoSource(dir + "v81r.mp4").assumeFPS(18)
v082 = LSMASHVideoSource(dir + "v82r.mp4").assumeFPS(18)
v083 = LSMASHVideoSource(dir + "v83r.mp4").assumeFPS(18)
v084 = LSMASHVideoSource(dir + "v84r.mp4").assumeFPS(18)
v085 = LSMASHVideoSource(dir + "v85r.mp4").assumeFPS(18)
v086 = LSMASHVideoSource(dir + "v86r.mp4").assumeFPS(18)
v087 = LSMASHVideoSource(dir + "v87r.mp4").assumeFPS(18)
v088 = LSMASHVideoSource(dir + "v88r.mp4").assumeFPS(18)
v089 = LSMASHVideoSource(dir + "v89r.mp4").assumeFPS(18)
v090 = LSMASHVideoSource(dir + "v90r.mp4").assumeFPS(18).trim(2, 0)
v091 = LSMASHVideoSource(dir + "v91r.mp4").assumeFPS(18)
v092 = LSMASHVideoSource(dir + "v92r.mp4").assumeFPS(18)
v093 = LSMASHVideoSource(dir + "v93r.mp4").assumeFPS(18)
v094 = LSMASHVideoSource(dir + "v94r.mp4").assumeFPS(18)
v095 = LSMASHVideoSource(dir + "v95r.mp4").assumeFPS(18)
v096 = LSMASHVideoSource(dir + "v96r.mp4").assumeFPS(18)

v097 = LSMASHVideoSource(dir + "v97r.mp4").assumeFPS(18)
v098 = LSMASHVideoSource(dir + "v98r.mp4").assumeFPS(18)
v099 = LSMASHVideoSource(dir + "v99r.mp4").assumeFPS(18)
v100 = LSMASHVideoSource(dir + "v100r.mp4").assumeFPS(18)
v101 = LSMASHVideoSource(dir + "v101r.mp4").assumeFPS(18)
v102 = LSMASHVideoSource(dir + "v102r.mp4").assumeFPS(18)
v103 = LSMASHVideoSource(dir + "v103r.mp4").assumeFPS(18)
v104 = LSMASHVideoSource(dir + "v104r.mp4").assumeFPS(18)
v105 = LSMASHVideoSource(dir + "v105r.mp4").assumeFPS(18)
v106 = LSMASHVideoSource(dir + "v106r.mp4").assumeFPS(18)
v107 = LSMASHVideoSource(dir + "v107r.mp4").assumeFPS(18)
v108 = LSMASHVideoSource(dir + "v108r.mp4").assumeFPS(18)
v109 = LSMASHVideoSource(dir + "v109r.mp4").assumeFPS(18)
v110 = LSMASHVideoSource(dir + "v110r.mp4").assumeFPS(18)
v111 = LSMASHVideoSource(dir + "v111r.mp4").assumeFPS(18)
v112 = LSMASHVideoSource(dir + "v112r.mp4").assumeFPS(18)
v113 = LSMASHVideoSource(dir + "v113r.mp4").assumeFPS(18)
v114 = LSMASHVideoSource(dir + "v114r.mp4").assumeFPS(18)
v115 = LSMASHVideoSource(dir + "v115r.mp4").assumeFPS(18)
v116 = LSMASHVideoSource(dir + "v116r.mp4").assumeFPS(18)
#v117 = LSMASHVideoSource(dir + "v117r.mp4").assumeFPS(18)
v118 = LSMASHVideoSource(dir + "v118r.mp4").assumeFPS(18)
v119 = LSMASHVideoSource(dir + "v119r.mp4").assumeFPS(18)
v120 = LSMASHVideoSource(dir + "v120r.mp4").assumeFPS(18)
v121 = LSMASHVideoSource(dir + "v121r.mp4").assumeFPS(18)
v122 = LSMASHVideoSource(dir + "v122r.mp4").assumeFPS(18)
v123 = LSMASHVideoSource(dir + "v123r.mp4").assumeFPS(18)
v124 = LSMASHVideoSource(dir + "v124r.mp4").assumeFPS(18)
v125 = LSMASHVideoSource(dir + "v125r.mp4").assumeFPS(18)
v126 = LSMASHVideoSource(dir + "v126r.mp4").assumeFPS(18)
v127 = LSMASHVideoSource(dir + "v127r.mp4").assumeFPS(18)
v128 = LSMASHVideoSource(dir + "v128r.mp4").assumeFPS(18)

v129 = LSMASHVideoSource(dir + "v129r.mp4").assumeFPS(18)
v130 = LSMASHVideoSource(dir + "v130r.mp4").assumeFPS(18)
v131 = LSMASHVideoSource(dir + "v131r.mp4").assumeFPS(18)
v132 = LSMASHVideoSource(dir + "v132r.mp4").assumeFPS(18)
v133 = LSMASHVideoSource(dir + "v133r.mp4").assumeFPS(18)
v134 = LSMASHVideoSource(dir + "v134r.mp4").assumeFPS(18)
v135 = LSMASHVideoSource(dir + "v135r.mp4").assumeFPS(18)
v136 = LSMASHVideoSource(dir + "v136r.mp4").assumeFPS(18)
v137 = LSMASHVideoSource(dir + "v137r.mp4").assumeFPS(18)
v138 = LSMASHVideoSource(dir + "v138r.mp4").assumeFPS(18)
v139 = LSMASHVideoSource(dir + "v139r.mp4").assumeFPS(18)
v140 = LSMASHVideoSource(dir + "v140r.mp4").assumeFPS(18)
v141 = LSMASHVideoSource(dir + "v141r.mp4").assumeFPS(18)
v142 = LSMASHVideoSource(dir + "v142r.mp4").assumeFPS(18)
v143 = LSMASHVideoSource(dir + "v143r.mp4").assumeFPS(18)
v144 = LSMASHVideoSource(dir + "v144r.mp4").assumeFPS(18)
v145 = LSMASHVideoSource(dir + "v145r.mp4").assumeFPS(18)
v146 = LSMASHVideoSource(dir + "v146r.mp4").assumeFPS(18)
v147 = LSMASHVideoSource(dir + "v147r.mp4").assumeFPS(18)
v148 = LSMASHVideoSource(dir + "v148r.mp4").assumeFPS(18)
v148 = v148.trim(0, v148.frameCount - 3)
v149 = LSMASHVideoSource(dir + "v149r.mp4").assumeFPS(18)
v150 = LSMASHVideoSource(dir + "v150r.mp4").assumeFPS(18)
v151 = LSMASHVideoSource(dir + "v151r.mp4").assumeFPS(18)
v152 = LSMASHVideoSource(dir + "v152r.mp4").assumeFPS(18)
#v153 = LSMASHVideoSource(dir + "v153r.mp4").assumeFPS(18)
#v154 = LSMASHVideoSource(dir + "v154r.mp4").assumeFPS(18)
#v155 = LSMASHVideoSource(dir + "v155r.mp4").assumeFPS(18)
v156 = LSMASHVideoSource(dir + "v156r.mp4").assumeFPS(18)
v157 = LSMASHVideoSource(dir + "v157r.mp4").assumeFPS(18)
v158 = LSMASHVideoSource(dir + "v158r.mp4").assumeFPS(18)
v159 = LSMASHVideoSource(dir + "v159r.mp4").assumeFPS(18)
v160 = LSMASHVideoSource(dir + "v160r.mp4").assumeFPS(18)
*/
v161 = LSMASHVideoSource(dir + "v161r.mp4").assumeFPS(18)
v161 = v161.trim(0, v161.frameCount - 2)
v162 = LSMASHVideoSource(dir + "v162r.mp4").assumeFPS(18)
v163 = LSMASHVideoSource(dir + "v163r.mp4").assumeFPS(18)
v164 = LSMASHVideoSource(dir + "v164r.mp4").assumeFPS(18)
v165 = LSMASHVideoSource(dir + "v165r.mp4").assumeFPS(18)
v166 = LSMASHVideoSource(dir + "v166r.mp4").assumeFPS(18)
v167 = LSMASHVideoSource(dir + "v167r.mp4").assumeFPS(18)
v168 = LSMASHVideoSource(dir + "v168r.mp4").assumeFPS(18)
v169 = LSMASHVideoSource(dir + "v169r.mp4").assumeFPS(18)
v170 = LSMASHVideoSource(dir + "v170r.mp4").assumeFPS(18)
v171 = LSMASHVideoSource(dir + "v171r.mp4").assumeFPS(18)
v172 = LSMASHVideoSource(dir + "v172r.mp4").assumeFPS(18)
v173 = LSMASHVideoSource(dir + "v173r.mp4").assumeFPS(18)
v174 = LSMASHVideoSource(dir + "v174r.mp4").assumeFPS(18)
v175 = LSMASHVideoSource(dir + "v175r.mp4").assumeFPS(18)
v176 = LSMASHVideoSource(dir + "v176r.mp4").assumeFPS(18)
v177 = LSMASHVideoSource(dir + "v177r.mp4").assumeFPS(18)
v177 = v177.trim(0, v177.frameCount - 2)
v178 = LSMASHVideoSource(dir + "v178r.mp4").assumeFPS(18)
v179 = LSMASHVideoSource(dir + "v179r.mp4").assumeFPS(18)
v180 = LSMASHVideoSource(dir + "v180r.mp4").assumeFPS(18)
v181 = LSMASHVideoSource(dir + "v181r.mp4").assumeFPS(18)
v182 = LSMASHVideoSource(dir + "v182r.mp4").assumeFPS(18)
v183 = LSMASHVideoSource(dir + "v183r.mp4").assumeFPS(18)
v184 = LSMASHVideoSource(dir + "v184r.mp4").assumeFPS(18)
v185 = LSMASHVideoSource(dir + "v185r.mp4").assumeFPS(18)
v186 = LSMASHVideoSource(dir + "v186r.mp4").assumeFPS(18)
v187 = LSMASHVideoSource(dir + "v187r.mp4").assumeFPS(18)
v188 = LSMASHVideoSource(dir + "v188r.mp4").assumeFPS(18)
v189 = LSMASHVideoSource(dir + "v189r.mp4").assumeFPS(18)
v190 = LSMASHVideoSource(dir + "v190r.mp4").assumeFPS(18)
v191 = LSMASHVideoSource(dir + "v191r.mp4").assumeFPS(18)
v192 = LSMASHVideoSource(dir + "v192r.mp4").assumeFPS(18)
#return v138
#+79000550430
#v1 = v001 + v002 + v003 + v004 + v005 + v006 + v007 + v008 + v009 + v010 + v011 + v012 + v013 + v014 + v015 + v016 +\
#     v017 + v018 + v019 + v020 + v021 + v022 + v023 + v024 + v025 + v026 + v027 + v028 + v029 + v030 + v031 + v032 +\
#v1 = v033 + v034 + v035 + v036 + v037 + v038 + v039 + v040 + v041 + v042 + v043 + v044 + v045 + v046 + v047 + v048 +\
#     v049 + v050 + v051 + v052 + v053 + v054 + v055 + v056 + v057 + v058/*+ v059*/+ v060 + v061 + v062 + v063 + v064
#v1 = v065 + v066 + v067 + v068 + v069 + v070 + v071 + v072 + v073 + v074 + v075 + v076 + v077 + v078 + v079 + v080 +\
#     v081 + v082 + v083 + v084 + v085 + v086 + v087 + v088 + v089 + v090 + v091 + v092 + v093 + v094 + v095 + v096
#v1 = v097 + v098 + v099 + v100 + v101 + v102 + v103 + v104 + v105 + v106 + v107 + v108 + v109 + v110 + v111 + v112 +\
#     v113 + v114 + v115 + v116/*+ v117*/+ v118 + v119 + v120 + v121 + v122 + v123 + v124 + v125 + v126 + v127 + v128
#v1 = v129 + v130 + v131 + v132 + v133 + v134 + v135 + v136 + v137 + v138 + v139 + v140 + v141 + v142 + v143 + v144 +\
#     v145 + v146 + v147 + v148 + v149 + v150 + v151 + v152/*+ v153 + v154 + v155*/+ v156 + v157 + v158 + v159 + v160
 v1 = v161 + v162 + v163 + v164 + v165 + v166 + v167 + v168 + v169 + v170 + v171 + v172 + v173 + v174 + v175 + v176 +\
      v177 + v178 + v179 + v180 + v181 + v182 + v183 + v184 + v185 + v186 + v187 + v188 + v189 + v190 + v191 + v192
return v0.interleave(v1)
/*

v193 = LSMASHVideoSource(dir + "v193r.mp4").trim(1, 0)
v194 = LSMASHVideoSource("M:\Media\video\Super8\wrk\1982-1983\v194r.mp4").trim(7, 0)
v195 = LSMASHVideoSource("M:\Media\video\Super8\wrk\1982-1983\v195r.mp4").trim(5, 0)
*/
/*
function FR(clip c, string "preset_p", string "output_p", int "blksize_p", int "fps")
{
    c = c.assumeFPS(18)
#return c
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
    fps = Default(fps, 60)
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=fps, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
    return c.assumeFPS(fps)
}
*/
function FR_MVT(clip c, string "preset_p", string "output_p", int "blksize_p", int "fps")
{
    c = c.assumeFPS(18)
#return c
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
    fps = Default(fps, 60)
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=fps, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
    return c.assumeFPS(fps)
}

function FR_RIFE(clip c, int "fps", int "model")
{
    last = c.frameCount - 1
    rem = last - last/3*3
    rem = rem == 0 ? 0 : 3 - rem
    c = c.loop(rem + 1, last, last)
    c = c.assumeFPS(18)
    rate = c.FrameRate
#return c
    model = Default(model, 12)
    fps = Default(fps, 60)

    c = c.ConvertToPlanarRGB().ConvertBits(32)
    c = c.RIFE(gpu_thread = 2, sc_threshold = 1, factor_num = fps, factor_den = int(rate), model = model)
    c = c.ConvertBits(8, dither=1)
    c = c.ConvertToYV12()

    c = c.trim(0, last * fps / int(rate))

    return c.assumeFPS(fps)
}

function FR(clip c, int "model")
{
#return c.assumeFPS(18)
    model = Default(model, 44)
    r = c.FR_RIFE(model = model)
    return r

#    return r.trim(0, r.frameCount - 4)
#    return r.trim(0, r.frameCount - 4) +\
#           c.FR_MVT.trim(r.frameCount - 1, -1)
}
#return v006.FR_MVT()#(model=48)
v001_032 =        v001.FR + v002.FR + v003.FR + v004.FR + v005.FR + v006.FR_MVT + v007.FR + v008.FR + v009.FR +\
        v010.FR + v011.FR + v012.FR + v013.FR + v014.FR + v015.FR + v016.FR + v017.FR + v018.FR + v019.FR +\
        v020.FR + v021.FR + v022.FR + v023.FR + v024.FR + v025.FR + v026.FR + v027.FR + v028.FR + v029.FR +\
        v030.FR + v031.FR + v032.FR
/*
v033_064 =                            v033.FR + v034.FR + v035.FR + v036.FR + v037.FR + v038.FR + v039.FR +\
        v040.FR + v041.FR + v042.FR + v043.FR + v044.FR + v045.FR + v046.FR + v047.FR + v048.FR + v049.FR +\
        v050.FR + v051.FR + v052.FR + v053.FR + v054.FR + v055.FR + v056.FR + v057.FR + v058.FR + v059.FR +\
        v060.FR + v061.FR + v062.FR + v063.FR + v064.FR

v065_096 =                                                v065.FR + v066.FR + v067.FR + v068.FR + v069.FR +\
        v070.FR + v071.FR + v072.FR + v073.FR + v074.FR + v075.FR + v076.FR + v077.FR + v078.FR + v079.FR +\
        v080.FR + v081.FR + v082.FR + v083.FR + v084.FR + v085.FR + v086.FR + v087.FR + v088.FR + v089.FR +\
        v090.FR + v091.FR + v092.FR + v093.FR + v094.FR + v095.FR + v096.FR
v097_128 =                                                                    v097.FR + v098.FR + v099.FR +\
        v100.FR + v101.FR + v102.FR + v103.FR + v104.FR + v105.FR + v106.FR + v107.FR + v108.FR + v109.FR +\
        v110.FR + v111.FR + v112.FR + v113.FR + v114.FR + v115.FR + v116.FR + v117.FR + v118.FR + v119.FR +\
        v120.FR + v121.FR + v122.FR + v123.FR + v124.FR + v125.FR + v126.FR + v127.FR + v128.FR

v129_160 =                                                                                        v129.FR +\
        v130.FR + v131.FR + v132.FR + v133.FR + v134.FR + v135.FR + v136.FR + v137.FR + v138.FR + v139.FR +\
        v140.FR + v141.FR + v142.FR + v143.FR + v144.FR + v145.FR + v146.FR + v147.FR + v148.FR + v149.FR +\
        v150.FR + v151.FR + v152.FR + v153.FR + v154.FR + v155.FR + v156.FR + v157.FR + v158.FR + v159.FR +\
        v160.FR

v161_192 =        v161.FR + v162.FR + v163.FR + v164.FR + v165.FR + v166.FR + v167.FR + v168.FR + v169.FR +\
         v170.FR #+ v171.FR + v172.FR + v173.FR + v174.FR + v175.FR + v176.FR + v177.FR + v178.FR + v179.FR +\
#        v180.FR + v181.FR + v182.FR + v183.FR + v184.FR + v185.FR + v186.FR + v187.FR + v188.FR + v189.FR +\
#        v190.FR + v191.FR + v192.FR
*/
last = v001_032# + v033_064 + v065_096 + v097_128 + v129_160 + v161_192 + v193_195

va = BlankClip(last, audio_rate = 48000, channels = 2).killVideo
last = last.audioDub(va)

return last
prefetch(2)
