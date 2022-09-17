LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v164 = LSMASHVideoSource(dst_dir + "v164rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v164f.mp4")
v164 = ImageSource(file = dst_dir + "v164-png\v164-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v164 = v164.convertToY.adjustSize

#v164 = v164.extractY.convertToYV12(interlaced=false)
#v164 = v164.deScratch.extractY

v164 = v164.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v164 = v164.convertBits(8).convertToYV12(interlaced=false)

v164 = v164.deScratch.extractY
v164 = v164.removeDirt
v164 = v164.convertToYV12(interlaced=false)
v164 = v164.UnsharpMask(strength=400, radius=5, threshold=1)
v164 = v164.adjustBorders
#v164 = v164.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v164 = v164.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v164, audio_rate = 48000, channels = 2).killVideo
v164 = v164.audioDub(va)

return v164.Prefetch

