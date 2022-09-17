LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v106 = LSMASHVideoSource(dst_dir + "v106rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v106f.mp4")
v106 = ImageSource(file = dst_dir + "v106-png\v106-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v106 = v106.convertToY.adjustSize

#v106 = v106.extractY.convertToYV12(interlaced=false)
#v106 = v106.deScratch.extractY

v106 = v106.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v106 = v106.convertBits(8).convertToYV12(interlaced=false)

v106 = v106.deScratch.extractY
v106 = v106.removeDirt
v106 = v106.convertToYV12(interlaced=false)
v106 = v106.UnsharpMask(strength=400, radius=5, threshold=1)
v106 = v106.adjustBorders
#v106 = v106.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v106 = v106.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v106, audio_rate = 48000, channels = 2).killVideo
v106 = v106.audioDub(va)

return v106.Prefetch

