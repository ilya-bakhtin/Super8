LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v109 = LSMASHVideoSource(dst_dir + "v109rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v109f.mp4")
v109 = ImageSource(file = dst_dir + "v109-png\v109-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v109 = v109.convertToY.adjustSize

#v109 = v109.extractY.convertToYV12(interlaced=false)
#v109 = v109.deScratch.extractY

v109 = v109.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v109 = v109.convertBits(8).convertToYV12(interlaced=false)

v109 = v109.deScratch.extractY
v109 = v109.removeDirt
v109 = v109.convertToYV12(interlaced=false)
v109 = v109.UnsharpMask(strength=400, radius=5, threshold=1)
v109 = v109.adjustBorders
#v109 = v109.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v109 = v109.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v109, audio_rate = 48000, channels = 2).killVideo
v109 = v109.audioDub(va)

return v109.Prefetch

