LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v80 = LSMASHVideoSource(dst_dir + "v80rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v80f.mp4")
v80 = ImageSource(file = dst_dir + "v80-png\v80-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v80 = v80.convertToY.adjustSize

#v80 = v80.extractY.convertToYV12(interlaced=false)
#v80 = v80.deScratch.extractY

v80 = v80.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v80 = v80.convertBits(8).convertToYV12(interlaced=false)

v80 = v80.deScratch.extractY
v80 = v80.removeDirt
v80 = v80.convertToYV12(interlaced=false)
v80 = v80.UnsharpMask(strength=400, radius=5, threshold=1)
v80 = v80.adjustBorders
#v80 = v80.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v80 = v80.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v80, audio_rate = 48000, channels = 2).killVideo
v80 = v80.audioDub(va)

return v80.Prefetch

