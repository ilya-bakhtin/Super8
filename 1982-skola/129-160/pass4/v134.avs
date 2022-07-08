LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v134 = LWLibavVideoSource(source_dir + "v134rc.avi", cache=false)
v134 = v134.convertToYV24(interlaced=false)

v134 = v134.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v134 = v134.removeDirt
v134 = v134.convertToYV12
v134 = v134.UnsharpMask(strength=400, radius=7, threshold=1)
v134 = v134.adjustBorders
#v134 = v134.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v134 = v134.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v134.Prefetch(12)

