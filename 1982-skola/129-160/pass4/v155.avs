LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v155 = LWLibavVideoSource(source_dir + "v155rc.avi", cache=false)
v155 = v155.convertToYV24(interlaced=false)

v155 = v155.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v155 = v155.removeDirt
v155 = v155.convertToYV12
v155 = v155.UnsharpMask(strength=400, radius=7, threshold=1)
v155 = v155.adjustBorders
#v155 = v155.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v155 = v155.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v155.Prefetch(12)

