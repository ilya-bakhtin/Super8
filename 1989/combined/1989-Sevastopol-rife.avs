LoadPlugin("C:\Program Files (x86)\AviSynth+\plugins64\rife\RIFE.dll")

dir = "M:\Media\video\Super8\wrk\1989\"
/*
v001 = LSMASHVideoSource(dir + "v1r.mp4")
v002 = LSMASHVideoSource(dir + "v2r.mp4")
v003 = LSMASHVideoSource(dir + "v3r.mp4").trim(1, 0)
v004 = LSMASHVideoSource(dir + "v4r.mp4").trim(1, 0)
v005 = LSMASHVideoSource(dir + "v5r.mp4").trim(1, 0)
v006 = LSMASHVideoSource(dir + "v6r.mp4").trim(1, 0)
v007 = LSMASHVideoSource(dir + "v7r.mp4").trim(1, 0)
v008 = LSMASHVideoSource(dir + "v8r.mp4").trim(1, 0)
v009 = LSMASHVideoSource(dir + "v9r.mp4").trim(1, 0)
*/
v010 = LSMASHVideoSource(dir + "v10r.mp4").trim(1, 0)
v011 = LSMASHVideoSource(dir + "v11r.mp4").trim(1, 0)
/*
v012 = LSMASHVideoSource(dir + "v12r.mp4").trim(1, 0)
v013 = LSMASHVideoSource(dir + "v13r.mp4").trim(1, 0)
v014 = LSMASHVideoSource(dir + "v14r.mp4").trim(1, 0)
v015 = LSMASHVideoSource(dir + "v15r.mp4")
v015 = v015.trim(1, v015.frameCount - 2)
v016 = LSMASHVideoSource(dir + "v16r.mp4").trim(1, 0)
v017 = LSMASHVideoSource(dir + "v17r.mp4")
v018 = LSMASHVideoSource(dir + "v18r.mp4").trim(1, 0)
v019 = LSMASHVideoSource(dir + "v19r.mp4").trim(1, 0)
v020 = LSMASHVideoSource(dir + "v20r.mp4")
v021 = LSMASHVideoSource(dir + "v21r.mp4")
v022 = LSMASHVideoSource(dir + "v22r.mp4")
v023 = LSMASHVideoSource(dir + "v23r.mp4")
v023 = v023.trim(0, v023.frameCount - 2)
v024 = LSMASHVideoSource(dir + "v24r.mp4")
v024 = v024.trim(1, v024.frameCount - 3)
v025 = LSMASHVideoSource(dir + "v25r.mp4").trim(1, 0)
v026 = LSMASHVideoSource(dir + "v26r.mp4").trim(1, 0)
v027 = LSMASHVideoSource(dir + "v27r.mp4").trim(1, 0)
v028 = LSMASHVideoSource(dir + "v28r.mp4").trim(1, 0)
v029 = LSMASHVideoSource(dir + "v29r.mp4").trim(1, 0)
v030 = LSMASHVideoSource(dir + "v30r.mp4").trim(1, 0)
v031 = LSMASHVideoSource(dir + "v31r.mp4")
v031 = v031.trim(1, v031.frameCount - 2)
v032 = LSMASHVideoSource(dir + "v32r.mp4").trim(1, 0)

v033 = LSMASHVideoSource(dir + "v33r.mp4")
v034 = LSMASHVideoSource(dir + "v34r.mp4").trim(1, 0)
v035 = LSMASHVideoSource(dir + "v35r.mp4").trim(1, 0)
v036 = LSMASHVideoSource(dir + "v36r.mp4").trim(1, 0)
v037 = LSMASHVideoSource(dir + "v37r.mp4")
v037 = v037.trim(0, v037.frameCount - 2)
v038 = LSMASHVideoSource(dir + "v38r.mp4").trim(1, 0)
v039 = LSMASHVideoSource(dir + "v39r.mp4").trim(1, 0)
v040 = LSMASHVideoSource(dir + "v40r.mp4")

v041 = LSMASHVideoSource(dir + "v41r.mp4")
v042 = LSMASHVideoSource(dir + "v42r.mp4").trim(1, 0)
v043 = LSMASHVideoSource(dir + "v43r.mp4").trim(1, 0)
v044 = LSMASHVideoSource(dir + "v44r.mp4")
v045 = LSMASHVideoSource(dir + "v45r.mp4")
v046 = LSMASHVideoSource(dir + "v46r.mp4")
v046 = v046.trim(1, v046.frameCount - 2)
v047 = LSMASHVideoSource(dir + "v47r.mp4").trim(1, 0)
v048 = LSMASHVideoSource(dir + "v48r.mp4")
v049 = LSMASHVideoSource(dir + "v49r.mp4").trim(1, 0)
v050 = LSMASHVideoSource(dir + "v50r.mp4")
v051 = LSMASHVideoSource(dir + "v51r.mp4")
v052 = LSMASHVideoSource(dir + "v52r.mp4").trim(1, 0)
#v053 = LSMASHVideoSource(dir + "v53r.mp4")#.trim(1, 0)
v054 = LSMASHVideoSource(dir + "v54r.mp4")
v055 = LSMASHVideoSource(dir + "v55r.mp4").trim(1, 0)
v056 = LSMASHVideoSource(dir + "v56r.mp4")
#v057 = LSMASHVideoSource(dir + "v57r.mp4")#.trim(3, 0)
v058 = LSMASHVideoSource(dir + "v58r.mp4")
v059 = LSMASHVideoSource(dir + "v59r.mp4").trim(1, 0)
*/
/*
v060 = LSMASHVideoSource(dir + "v60r.mp4").trim(1, 0)
return v060.assumeFPS(18)
v061 = LSMASHVideoSource(dir + "v61r.mp4")
v061 = v061.trim(0, v061.frameCount - 3)
v062 = LSMASHVideoSource(dir + "v62r.mp4").trim(1, 0)
v063 = LSMASHVideoSource(dir + "v63r.mp4").trim(1, 0)
v064 = LSMASHVideoSource(dir + "v64r.mp4").trim(1, 0)

v065 = LSMASHVideoSource(dir + "v65r.mp4").trim(1, 0)
v066 = LSMASHVideoSource(dir + "v66r.mp4").trim(2, 0)
v067 = LSMASHVideoSource(dir + "v67r.mp4")
v068 = LSMASHVideoSource(dir + "v68r.mp4").trim(1, 0)
v069 = LSMASHVideoSource(dir + "v69r.mp4").trim(1, 0)
v070 = LSMASHVideoSource(dir + "v70r.mp4").trim(2, 0)
v071 = LSMASHVideoSource(dir + "v71r.mp4").trim(1, 0)
v072 = LSMASHVideoSource(dir + "v72r.mp4").trim(1, 0)
v073 = LSMASHVideoSource(dir + "v73r.mp4")
v073 = v073.trim(1, v073.frameCount - 2)
v074 = LSMASHVideoSource(dir + "v74r.mp4").trim(1, 0)
#v075 = LSMASHVideoSource(dir + "v75r.mp4").trim(1, 0)
v076 = LSMASHVideoSource(dir + "v76r.mp4")
v076 = v076.trim(1, v076.frameCount - 2)
v077 = LSMASHVideoSource(dir + "v77r.mp4").trim(1, 0)
v078 = LSMASHVideoSource(dir + "v78r.mp4").trim(1, 0)
v079 = LSMASHVideoSource(dir + "v79r.mp4").trim(1, 0)
v080 = LSMASHVideoSource(dir + "v80r.mp4").trim(1, 0)
v081 = LSMASHVideoSource(dir + "v81r.mp4").trim(1, 0)
v082 = LSMASHVideoSource(dir + "v82r.mp4").trim(1, 0)
v083 = LSMASHVideoSource(dir + "v83r.mp4").trim(1, 0)

v084 = LSMASHVideoSource(dir + "v84r.mp4").trim(1, 0)
v085 = LSMASHVideoSource(dir + "v85r.mp4").trim(1, 0)
v086 = LSMASHVideoSource(dir + "v86r.mp4").trim(1, 0)
v087 = LSMASHVideoSource(dir + "v87r.mp4")
v088 = LSMASHVideoSource(dir + "v88r.mp4").trim(1, 0)
v089 = LSMASHVideoSource(dir + "v89r.mp4").trim(1, 0)
v090 = LSMASHVideoSource(dir + "v90r.mp4").trim(1, 0)
v091 = LSMASHVideoSource(dir + "v91r.mp4")
v091 = v091.trim(1, v091.frameCount - 3)
v092 = LSMASHVideoSource(dir + "v92r.mp4")
v092 = v092.trim(0, v092.frameCount - 2)
v093 = LSMASHVideoSource(dir + "v93r.mp4")
v094 = LSMASHVideoSource(dir + "v94r.mp4").trim(1, 0)
v095 = LSMASHVideoSource(dir + "v95r.mp4").trim(1, 0)
v096 = LSMASHVideoSource(dir + "v96r.mp4").trim(1, 0)

v097 = LSMASHVideoSource(dir + "v97r.mp4").trim(1, 0)
v098 = LSMASHVideoSource(dir + "v98r.mp4").trim(1, 0)
v099 = LSMASHVideoSource(dir + "v99r.mp4").trim(1, 0)
v100 = LSMASHVideoSource(dir + "v100r.mp4")
v101 = LSMASHVideoSource(dir + "v101r.mp4").trim(1, 0)
v102 = LSMASHVideoSource(dir + "v102r.mp4").trim(1, 0)
v103 = LSMASHVideoSource(dir + "v103r.mp4").trim(1, 0)
v104 = LSMASHVideoSource(dir + "v104r.mp4").trim(1, 0)
v105 = LSMASHVideoSource(dir + "v105r.mp4")
v105 = v105.trim(1, v105.frameCount - 2)
v106 = LSMASHVideoSource(dir + "v106r.mp4").trim(3, 49)
#v107 = LSMASHVideoSource(dir + "v107r.mp4").trim(1, 0)
#v108 = LSMASHVideoSource(dir + "v108r.mp4").trim(1, 0)
#v109 = LSMASHVideoSource(dir + "v109r.mp4").trim(1, 0)
v110 = LSMASHVideoSource(dir + "v110r.mp4").trim(1, 28)
v111 = LSMASHVideoSource(dir + "v111r.mp4").trim(1, 20)
v112 = LSMASHVideoSource(dir + "v112r.mp4").trim(1, 0)
v113 = LSMASHVideoSource(dir + "v113r.mp4").trim(1, 0)
v114 = LSMASHVideoSource(dir + "v114r.mp4").trim(1, 0)
v115 = LSMASHVideoSource(dir + "v115r.mp4").trim(1, 0)
v116 = LSMASHVideoSource(dir + "v116r.mp4").trim(1, 0)
v117 = LSMASHVideoSource(dir + "v117r.mp4").trim(1, 0)
v118 = LSMASHVideoSource(dir + "v118r.mp4").trim(1, 0)
v119 = LSMASHVideoSource(dir + "v119r.mp4").trim(1, 0)
v120 = LSMASHVideoSource(dir + "v120r.mp4")
v120 = v120.trim(1, v120.frameCount - 2)
v121 = LSMASHVideoSource(dir + "v121r.mp4").trim(1, 0)
v122 = LSMASHVideoSource(dir + "v122r.mp4").trim(1, 0)
v123 = LSMASHVideoSource(dir + "v123r.mp4").trim(1, 0)
v124 = LSMASHVideoSource(dir + "v124r.mp4")
v125 = LSMASHVideoSource(dir + "v125r.mp4")
v125 = v125.trim(1, v125.frameCount - 2)
v126 = LSMASHVideoSource(dir + "v126r.mp4").trim(1, 0)
v127 = LSMASHVideoSource(dir + "v127r.mp4").trim(1, 0)
v128 = LSMASHVideoSource(dir + "v128r.mp4").trim(2, 0)

v129 = LSMASHVideoSource(dir + "v129r.mp4")
v129 = v129.trim(1, v129.frameCount - 2)
v130 = LSMASHVideoSource(dir + "v130r.mp4").trim(2, 0)
v131 = LSMASHVideoSource(dir + "v131r.mp4")
v131 = v131.trim(2, v131.frameCount - 2)
v132 = LSMASHVideoSource(dir + "v132r.mp4")
v133 = LSMASHVideoSource(dir + "v133r.mp4").trim(1, 0)
v134 = LSMASHVideoSource(dir + "v134r.mp4")
v134 = v134.trim(1, v134.frameCount - 2)
v135 = LSMASHVideoSource(dir + "v135r.mp4")
v135 = v135.trim(1, v135.frameCount - 2)
v136 = LSMASHVideoSource(dir + "v136r.mp4")
v136 = v136.trim(1, v136.frameCount - 15)
v137 = LSMASHVideoSource(dir + "v137r.mp4").trim(1, 0)
v138 = LSMASHVideoSource(dir + "v138r.mp4").trim(1, 0)
v139 = LSMASHVideoSource(dir + "v139r.mp4").trim(1, 0)
v140 = LSMASHVideoSource(dir + "v140r.mp4").trim(1, 0)
v141 = LSMASHVideoSource(dir + "v141r.mp4")#.trim(1, 0)
v141 = v141.trim(2, v141.frameCount - 2)
v142 = LSMASHVideoSource(dir + "v142r.mp4")
v143 = LSMASHVideoSource(dir + "v143r.mp4")

v144 = LSMASHVideoSource(dir + "v144r.mp4").trim(1, 0)
v145 = LSMASHVideoSource(dir + "v145r.mp4").trim(1, 0)
v146 = LSMASHVideoSource(dir + "v146r.mp4")
v146 = v146.trim(1, v146.frameCount - 2)
v147 = LSMASHVideoSource(dir + "v147r.mp4").trim(1, 0)
v148 = LSMASHVideoSource(dir + "v148r.mp4").trim(1, 0)
v149 = LSMASHVideoSource(dir + "v149r.mp4").trim(1, 0)
v150 = LSMASHVideoSource(dir + "v150r.mp4").trim(1, 0)
v151 = LSMASHVideoSource(dir + "v151r.mp4").trim(1, 0)
v152 = LSMASHVideoSource(dir + "v152r.mp4")
v152 = v152.trim(1, v152.frameCount - 2)
v153 = LSMASHVideoSource(dir + "v153r.mp4")
v153 = v153.trim(1, v153.frameCount - 2)
v154 = LSMASHVideoSource(dir + "v154r.mp4").trim(1, 0)
v155 = LSMASHVideoSource(dir + "v155r.mp4")
v155 = v155.trim(1, v155.frameCount - 2)
v156 = LSMASHVideoSource(dir + "v156r.mp4").trim(1, 0)
v157 = LSMASHVideoSource(dir + "v157r.mp4").trim(1, 0)
v158 = LSMASHVideoSource(dir + "v158r.mp4")
v158 = v158.trim(1, v158.frameCount - 2)
v159 = LSMASHVideoSource(dir + "v159r.mp4").trim(1, 0)
v160 = LSMASHVideoSource(dir + "v160r.mp4")
v160 = v160.trim(1, v160.frameCount - 2)

v161 = LSMASHVideoSource(dir + "v161r.mp4")
v161 = v161.trim(1, v161.frameCount - 2)
v162 = LSMASHVideoSource(dir + "v162r.mp4")
v162 = v162.trim(1, v162.frameCount - 2)
v163 = LSMASHVideoSource(dir + "v163r.mp4")
v163 = v163.trim(1, v163.frameCount - 2)
v164 = LSMASHVideoSource(dir + "v164r.mp4").trim(1, 0)
v165 = LSMASHVideoSource(dir + "v165r.mp4")
v165 = v165.trim(1, v165.frameCount - 2)
v166 = LSMASHVideoSource(dir + "v166r.mp4")
v166 = v166.trim(1, v166.frameCount - 2)
v167 = LSMASHVideoSource(dir + "v167r.mp4")
v167 = v167.trim(1, v167.frameCount - 2)
v168 = LSMASHVideoSource(dir + "v168r.mp4")
v168 = v168.trim(1, v168.frameCount - 5)
v169 = LSMASHVideoSource(dir + "v169r.mp4").trim(1, 0)
v170 = LSMASHVideoSource(dir + "v170r.mp4")
v170 = v170.trim(2, v170.frameCount - 5)
v171 = LSMASHVideoSource(dir + "v171r.mp4")
v171 = v171.trim(3, v171.frameCount - 9)
v172 = LSMASHVideoSource(dir + "v172r.mp4")
v172 = v172.trim(1, v172.frameCount - 2)
v173 = LSMASHVideoSource(dir + "v173r.mp4").trim(1, 0)
v174 = LSMASHVideoSource(dir + "v174r.mp4")
v174 = v174.trim(1, v174.frameCount - 5)
v175 = LSMASHVideoSource(dir + "v175r.mp4")
v175 = v175.trim(1, v175.frameCount - 5)
v176 = LSMASHVideoSource(dir + "v176r.mp4")
v176 = v176.trim(1, v176.frameCount - 2)
v177 = LSMASHVideoSource(dir + "v177r.mp4")
v177 = v177.trim(1, v177.frameCount - 3)
v178 = LSMASHVideoSource(dir + "v178r.mp4").trim(1, 0)
v179 = LSMASHVideoSource(dir + "v179r.mp4")
v179 = v179.trim(1, v179.frameCount - 2)
v180 = LSMASHVideoSource(dir + "v180r.mp4")
v180 = v180.trim(1, v180.frameCount - 2)
v181 = LSMASHVideoSource(dir + "v181r.mp4")
v181 = v181.trim(1, v181.frameCount - 2)
v182 = LSMASHVideoSource(dir + "v182r.mp4")
v182 = v182.trim(1, v182.frameCount - 2)
v183 = LSMASHVideoSource(dir + "v183r.mp4").trim(1, 0)
v184 = LSMASHVideoSource(dir + "v184r.mp4").trim(5, 0)
v185 = LSMASHVideoSource(dir + "v185r.mp4").trim(1, 0)
v186 = LSMASHVideoSource(dir + "v186r.mp4").trim(1, 0)
v187 = LSMASHVideoSource(dir + "v187r.mp4")
v187 = v187.trim(1, v187.frameCount - 2)
v188 = LSMASHVideoSource(dir + "v188r.mp4")
v188 = v188.trim(1, v188.frameCount - 3)
v189 = LSMASHVideoSource(dir + "v189r.mp4").trim(1, 0)
v190 = LSMASHVideoSource(dir + "v190r.mp4").trim(6, 0)
v191 = LSMASHVideoSource(dir + "v191r.mp4")
v191 = v191.trim(2, v191.frameCount - 3)
v192 = LSMASHVideoSource(dir + "v192r.mp4").trim(1, 0)

v193 = LSMASHVideoSource(dir + "v193r.mp4").trim(1, 0)
v194 = LSMASHVideoSource("M:\Media\video\Super8\wrk\1982-1983\v194r.mp4").trim(7, 0)
v195 = LSMASHVideoSource("M:\Media\video\Super8\wrk\1982-1983\v195r.mp4").trim(5, 0)
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

    return c#.info#.assumeFPS(fps)
}

function FR(clip c, int "model")
{
    r = c.FR_RIFE(model = model)
    return r

#    return r.trim(0, r.frameCount - 4).info
#    return r.trim(0, r.frameCount - 4) +\
#           c.FR_MVT.trim(r.frameCount - 1, -1)
}

#return v011.FR_RIFE.prefetch
#return v011.FR_MVT.info.interleave(v011.FR(model = 44).info).prefetch

v001_032 = /*       v001.FR + v002.FR + v003.FR + v004.FR + v005.FR + v006.FR + v007.FR + v008.FR + v009.FR + */\
        v010.FR + v011.FR + v012.FR + v013.FR + v014.FR + v015.FR + v016.FR + v017.FR + v018.FR + v019.FR +\
        v020.FR + v021.FR + v022.FR + v023.FR + v024.FR + v025.FR + v026.FR + v027.FR + v028.FR + v029.FR +\
        v030.FR + v031.FR + v032.FR

v033_064 =                            v033.FR + v034.FR + v035.FR + v036.FR + v037.FR + v038.FR + v039.FR +\
        v040.FR + v041.FR + v042.FR + v043.FR + v044.FR + v045.FR + v046.FR + v047.FR + v048.FR + v049.FR +\
        v050.FR + v051.FR + v052.FR + /*v053.FR +*/ v054.FR + v055.FR + v056.FR + /*v057.FR +*/ v058.FR + v059.FR #+\
#        v060.FR + v061.FR + v062.FR + v063.FR + v064.FR
/*
v065_096 =                                                v065.FR + v066.FR + v067.FR + v068.FR + v069.FR +\
        v070.FR + v071.FR + v072.FR + v073.FR + v074.FR + v075.FR + v076.FR + v077.FR + v078.FR + v079.FR +\
        v080.FR + v081.FR + v082.FR + v083.FR #+ v084.FR + v085.FR + v086.FR + v087.FR + v088.FR + v089.FR +\
#        v090.FR + v091.FR + v092.FR + v093.FR + v094.FR + v095.FR + v096.FR
v097_128 =                                                                    v097.FR + v098.FR + v099.FR +\
        v100.FR + v101.FR + v102.FR + v103.FR + v104.FR + v105.FR + v106.FR + v107.FR + v108.FR + v109.FR +\
        v110.FR + v111.FR + v112.FR + v113.FR + v114.FR + v115.FR + v116.FR + v117.FR + v118.FR + v119.FR +\
        v120.FR + v121.FR + v122.FR + v123.FR + v124.FR + v125.FR + v126.FR + v127.FR + v128.FR

v129_160 =                                                                                        v129.FR +\
        v130.FR + v131.FR + v132.FR + v133.FR + v134.FR + v135.FR + v136.FR + v137.FR + v138.FR + v139.FR +\
        v140.FR + v141.FR + v142.FR + v143.FR# + v144.FR + v145.FR + v146.FR + v147.FR + v148.FR + v149.FR +\
#        v150.FR + v151.FR + v152.FR + v153.FR + v154.FR + v155.FR + v156.FR + v157.FR + v158.FR + v159.FR +\
#        v160.FR
*/
last = v001_032 + v033_064 #+ v065_096 + v097_128 + v129_160# + v161_192 + v193_195

va = BlankClip(last, audio_rate = 48000, channels = 2).killVideo
last = last.audioDub(va)

return last.info
#prefetch