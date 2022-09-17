LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v150 = LSMASHVideoSource(dst_dir + "v150rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v150f.mp4")
v150 = ImageSource(file = dst_dir + "v150-png\v150-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v150 = v150.convertToY.adjustSize

#v150 = v150.extractY.convertToYV12(interlaced=false)
#v150 = v150.deScratch.extractY

v150 = v150.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v150 = v150.convertBits(8).convertToYV12(interlaced=false)

v150 = v150.deScratch.extractY
v150 = v150.removeDirt
v150 = v150.convertToYV12(interlaced=false)
v150 = v150.UnsharpMask(strength=400, radius=5, threshold=1)
v150 = v150.adjustBorders
#v150 = v150.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v150 = v150.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v150, audio_rate = 48000, channels = 2).killVideo
v150 = v150.audioDub(va)

return v150.Prefetch

