LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v84 = LWLibavVideoSource(source_dir + "v84rc.avi", cache=false)
v84 = v84.convertToYV24(interlaced=false)

v84 = v84.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v84 = v84.removeDirt
v84 = v84.convertToYV12
v84 = v84.UnsharpMask(strength=400, radius=7, threshold=1)
v84 = v84.adjustBorders
#v84 = v84.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v84 = v84.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v84.Prefetch(12)

