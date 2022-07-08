LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v75 = LWLibavVideoSource(source_dir + "v75rc.avi", cache=false)
v75 = v75.convertToYV24(interlaced=false)

v75 = v75.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v75 = v75.removeDirt
v75 = v75.convertToYV12
v75 = v75.UnsharpMask(strength=400, radius=7, threshold=1)
v75 = v75.adjustBorders
#v75 = v75.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v75 = v75.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v75.Prefetch(12)

