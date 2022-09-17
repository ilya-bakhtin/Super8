LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v120 = LSMASHVideoSource(dst_dir + "v120rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v120f.mp4")
v120 = ImageSource(file = dst_dir + "v120-png\v120-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v120 = v120.convertToY.adjustSize

#v120 = v120.extractY.convertToYV12(interlaced=false)
#v120 = v120.deScratch.extractY

v120 = v120.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v120 = v120.convertBits(8).convertToYV12(interlaced=false)

v120 = v120.deScratch.extractY
v120 = v120.removeDirt
v120 = v120.convertToYV12(interlaced=false)
v120 = v120.UnsharpMask(strength=400, radius=5, threshold=1)
v120 = v120.adjustBorders
#v120 = v120.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v120 = v120.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v120, audio_rate = 48000, channels = 2).killVideo
v120 = v120.audioDub(va)

return v120.Prefetch

