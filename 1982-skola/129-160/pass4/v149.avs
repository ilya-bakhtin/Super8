LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v149 = LWLibavVideoSource(source_dir + "v149rc.avi", cache=false)
v149 = v149.convertToYV24(interlaced=false)

v149 = v149.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v149 = v149.removeDirt
v149 = v149.convertToYV12
v149 = v149.UnsharpMask(strength=400, radius=7, threshold=1)
v149 = v149.adjustBorders
#v149 = v149.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v149 = v149.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v149.Prefetch(12)

