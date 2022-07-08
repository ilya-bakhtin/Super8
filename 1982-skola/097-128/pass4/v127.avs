LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v127 = LWLibavVideoSource(source_dir + "v127rc.avi", cache=false)
v127 = v127.convertToYV24(interlaced=false)

v127 = v127.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v127 = v127.removeDirt
v127 = v127.convertToYV12
v127 = v127.UnsharpMask(strength=400, radius=7, threshold=1)
v127 = v127.adjustBorders
#v127 = v127.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v127 = v127.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v127.Prefetch(12)

