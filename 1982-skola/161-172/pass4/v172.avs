LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v172 = LWLibavVideoSource(source_dir + "v172rc.avi", cache=false)
v172 = v172.convertToYV24(interlaced=false)

v172 = v172.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v172 = v172.removeDirt
v172 = v172.convertToYV12
v172 = v172.UnsharpMask(strength=400, radius=7, threshold=1)
v172 = v172.adjustBorders
#v172 = v172.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v172 = v172.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v172.Prefetch(12)

