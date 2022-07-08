LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v111 = LWLibavVideoSource(source_dir + "v111rc.avi", cache=false)
v111 = v111.convertToYV24(interlaced=false)

v111 = v111.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v111 = v111.removeDirt
v111 = v111.convertToYV12
v111 = v111.UnsharpMask(strength=400, radius=7, threshold=1)
v111 = v111.adjustBorders
#v111 = v111.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v111 = v111.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v111.Prefetch(12)

