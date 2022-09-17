LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v98 = LSMASHVideoSource(dst_dir + "v98rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v98f.mp4")
v98 = ImageSource(file = dst_dir + "v98-png\v98-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v98 = v98.convertToY.adjustSize

#v98 = v98.extractY.convertToYV12(interlaced=false)
#v98 = v98.deScratch.extractY

v98 = v98.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v98 = v98.convertBits(8).convertToYV12(interlaced=false)

v98 = v98.deScratch.extractY
v98 = v98.removeDirt
v98 = v98.convertToYV12(interlaced=false)
v98 = v98.UnsharpMask(strength=400, radius=5, threshold=1)
v98 = v98.adjustBorders
#v98 = v98.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v98 = v98.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v98, audio_rate = 48000, channels = 2).killVideo
v98 = v98.audioDub(va)

return v98.Prefetch

