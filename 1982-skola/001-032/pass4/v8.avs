LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v8 = LWLibavVideoSource(source_dir + "v8rc.avi", cache=false)
v8 = v8.convertToYV24(interlaced=false)

v8 = v8.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v8 = v8.removeDirt
v8 = v8.convertToYV12
v8 = v8.UnsharpMask(strength=400, radius=7, threshold=1)
v8 = v8.adjustBorders
#v8 = v8.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v8 = v8.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v8.Prefetch(12)

