LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v109 = LWLibavVideoSource(source_dir + "v109rc.avi", cache=false)
v109 = v109.convertToYV24(interlaced=false)

v109 = v109.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v109 = v109.removeDirt
v109 = v109.convertToYV12
v109 = v109.UnsharpMask(strength=400, radius=7, threshold=1)
v109 = v109.adjustBorders
#v109 = v109.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v109 = v109.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v109.Prefetch(12)

