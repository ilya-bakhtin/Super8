LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v5 = LWLibavVideoSource(source_dir + "v5rc.avi", cache=false)
v5 = v5.convertToYV24(interlaced=false)

v5 = v5.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v5 = v5.removeDirt
v5 = v5.convertToYV12
v5 = v5.UnsharpMask(strength=400, radius=7, threshold=1)
v5 = v5.adjustBorders
#v5 = v5.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v5 = v5.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v5.Prefetch(12)

