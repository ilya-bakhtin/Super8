LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v88 = LSMASHVideoSource(dst_dir + "v88rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v88f.mp4")
v88 = ImageSource(file = dst_dir + "v88-png\v88-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v88 = v88.convertToY.adjustSize

#v88 = v88.extractY.convertToYV12(interlaced=false)
#v88 = v88.deScratch.extractY

v88 = v88.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v88 = v88.convertBits(8).convertToYV12(interlaced=false)

v88 = v88.deScratch.extractY
v88 = v88.removeDirt
v88 = v88.convertToYV12(interlaced=false)
v88 = v88.UnsharpMask(strength=400, radius=5, threshold=1)
v88 = v88.adjustBorders
#v88 = v88.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v88 = v88.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v88, audio_rate = 48000, channels = 2).killVideo
v88 = v88.audioDub(va)

return v88.Prefetch

