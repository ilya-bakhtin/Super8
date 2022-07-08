LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v113 = LWLibavVideoSource(source_dir + "v113rc.avi", cache=false)
v113 = v113.convertToYV24(interlaced=false)

v113 = v113.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v113 = v113.removeDirt
v113 = v113.convertToYV12
v113 = v113.UnsharpMask(strength=400, radius=7, threshold=1)
v113 = v113.adjustBorders
#v113 = v113.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v113 = v113.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v113.Prefetch(12)

