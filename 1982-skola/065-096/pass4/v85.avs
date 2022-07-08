LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v85 = LWLibavVideoSource(source_dir + "v85rc.avi", cache=false)
v85 = v85.convertToYV24(interlaced=false)

v85 = v85.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v85 = v85.removeDirt
v85 = v85.convertToYV12
v85 = v85.UnsharpMask(strength=400, radius=7, threshold=1)
v85 = v85.adjustBorders
#v85 = v85.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v85 = v85.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v85.Prefetch(12)

