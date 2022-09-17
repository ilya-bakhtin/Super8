LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v68 = LSMASHVideoSource(dst_dir + "v68rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v68f.mp4")
v68 = ImageSource(file = dst_dir + "v68-png\v68-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v68 = v68.convertToY.adjustSize

#v68 = v68.extractY.convertToYV12(interlaced=false)
#v68 = v68.deScratch.extractY

v68 = v68.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v68 = v68.convertBits(8).convertToYV12(interlaced=false)

v68 = v68.deScratch.extractY
v68 = v68.removeDirt
v68 = v68.convertToYV12(interlaced=false)
v68 = v68.UnsharpMask(strength=400, radius=5, threshold=1)
v68 = v68.adjustBorders
#v68 = v68.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v68 = v68.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v68, audio_rate = 48000, channels = 2).killVideo
v68 = v68.audioDub(va)

return v68.Prefetch

