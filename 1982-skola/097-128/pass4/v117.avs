LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v117 = LWLibavVideoSource(source_dir + "v117rc.avi", cache=false)
v117 = v117.convertToYV24(interlaced=false)

v117 = v117.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v117 = v117.removeDirt
v117 = v117.convertToYV12
v117 = v117.UnsharpMask(strength=400, radius=7, threshold=1)
v117 = v117.adjustBorders
#v117 = v117.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v117 = v117.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v117.Prefetch(12)

