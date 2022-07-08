LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v103 = LWLibavVideoSource(source_dir + "v103rc.avi", cache=false)
v103 = v103.convertToYV24(interlaced=false)

v103 = v103.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v103 = v103.removeDirt
v103 = v103.convertToYV12
v103 = v103.UnsharpMask(strength=400, radius=7, threshold=1)
v103 = v103.adjustBorders
#v103 = v103.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v103 = v103.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v103.Prefetch(12)

