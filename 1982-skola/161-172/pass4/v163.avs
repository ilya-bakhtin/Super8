LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v163 = LWLibavVideoSource(source_dir + "v163rc.avi", cache=false)
v163 = v163.convertToYV24(interlaced=false)

v163 = v163.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v163 = v163.removeDirt
v163 = v163.convertToYV12
v163 = v163.UnsharpMask(strength=400, radius=7, threshold=1)
v163 = v163.adjustBorders
#v163 = v163.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v163 = v163.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v163.Prefetch(12)

