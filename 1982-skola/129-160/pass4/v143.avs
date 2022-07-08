LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v143 = LWLibavVideoSource(source_dir + "v143rc.avi", cache=false)
v143 = v143.convertToYV24(interlaced=false)

v143 = v143.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v143 = v143.removeDirt
v143 = v143.convertToYV12
v143 = v143.UnsharpMask(strength=400, radius=7, threshold=1)
v143 = v143.adjustBorders
#v143 = v143.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v143 = v143.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v143.Prefetch(12)

