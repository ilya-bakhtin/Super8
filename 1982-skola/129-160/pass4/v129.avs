LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v129 = LWLibavVideoSource(source_dir + "v129rc.avi", cache=false)
v129 = v129.convertToYV24(interlaced=false)

v129 = v129.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v129 = v129.removeDirt
v129 = v129.convertToYV12
v129 = v129.UnsharpMask(strength=400, radius=7, threshold=1)
v129 = v129.adjustBorders
#v129 = v129.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v129 = v129.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v129.Prefetch(12)

