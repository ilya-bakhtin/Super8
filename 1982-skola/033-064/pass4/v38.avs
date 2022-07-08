LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v38 = LWLibavVideoSource(source_dir + "v38rc.avi", cache=false)
v38 = v38.convertToYV24(interlaced=false)

v38 = v38.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v38 = v38.removeDirt
v38 = v38.convertToYV12
v38 = v38.UnsharpMask(strength=400, radius=7, threshold=1)
v38 = v38.adjustBorders
#v38 = v38.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v38 = v38.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v38.Prefetch(12)

