LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v169 = LSMASHVideoSource(dst_dir + "v169rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v169f.mp4")
v169 = ImageSource(file = dst_dir + "v169-png\v169-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v169 = v169.convertToY.adjustSize

#v169 = v169.extractY.convertToYV12(interlaced=false)
#v169 = v169.deScratch.extractY

v169 = v169.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v169 = v169.convertBits(8).convertToYV12(interlaced=false)

v169 = v169.deScratch.extractY
v169 = v169.removeDirt
v169 = v169.convertToYV12(interlaced=false)
v169 = v169.UnsharpMask(strength=400, radius=5, threshold=1)
v169 = v169.adjustBorders
#v169 = v169.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v169 = v169.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v169, audio_rate = 48000, channels = 2).killVideo
v169 = v169.audioDub(va)

return v169.Prefetch

