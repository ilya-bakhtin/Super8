LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v80 = LWLibavVideoSource(source_dir + "v80rc.avi", cache=false)
v80 = v80.convertToYV24(interlaced=false)

v80 = v80.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v80 = v80.removeDirt
v80 = v80.convertToYV12
v80 = v80.UnsharpMask(strength=400, radius=7, threshold=1)
v80 = v80.adjustBorders
#v80 = v80.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v80 = v80.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v80.Prefetch(12)

