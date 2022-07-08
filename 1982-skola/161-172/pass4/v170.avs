LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v170 = LWLibavVideoSource(source_dir + "v170rc.avi", cache=false)
v170 = v170.convertToYV24(interlaced=false)

v170 = v170.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v170 = v170.removeDirt
v170 = v170.convertToYV12
v170 = v170.UnsharpMask(strength=400, radius=7, threshold=1)
v170 = v170.adjustBorders
#v170 = v170.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v170 = v170.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v170.Prefetch(12)

