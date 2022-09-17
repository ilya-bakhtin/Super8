LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v75 = LSMASHVideoSource(dst_dir + "v75rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v75f.mp4")
v75 = ImageSource(file = dst_dir + "v75-png\v75-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v75 = v75.convertToY.adjustSize

#v75 = v75.extractY.convertToYV12(interlaced=false)
#v75 = v75.deScratch.extractY

v75 = v75.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v75 = v75.convertBits(8).convertToYV12(interlaced=false)

v75 = v75.deScratch.extractY
v75 = v75.removeDirt
v75 = v75.convertToYV12(interlaced=false)
v75 = v75.UnsharpMask(strength=400, radius=5, threshold=1)
v75 = v75.adjustBorders
#v75 = v75.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v75 = v75.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v75, audio_rate = 48000, channels = 2).killVideo
v75 = v75.audioDub(va)

return v75.Prefetch

