LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v66 = LWLibavVideoSource(source_dir + "v66rc.avi", cache=false)
v66 = v66.convertToYV24(interlaced=false)

v66 = v66.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v66 = v66.removeDirt
v66 = v66.convertToYV12
v66 = v66.UnsharpMask(strength=400, radius=7, threshold=1)
v66 = v66.adjustBorders
#v66 = v66.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v66 = v66.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v66.Prefetch(12)

