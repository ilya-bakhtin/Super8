LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v95 = LSMASHVideoSource(dst_dir + "v95rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v95f.mp4")
v95 = ImageSource(file = dst_dir + "v95-png\v95-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v95 = v95.convertToY.adjustSize

#v95 = v95.extractY.convertToYV12(interlaced=false)
#v95 = v95.deScratch.extractY

v95 = v95.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v95 = v95.convertBits(8).convertToYV12(interlaced=false)

v95 = v95.deScratch.extractY
v95 = v95.removeDirt
v95 = v95.convertToYV12(interlaced=false)
v95 = v95.UnsharpMask(strength=400, radius=5, threshold=1)
v95 = v95.adjustBorders
#v95 = v95.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v95 = v95.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v95, audio_rate = 48000, channels = 2).killVideo
v95 = v95.audioDub(va)

return v95.Prefetch

