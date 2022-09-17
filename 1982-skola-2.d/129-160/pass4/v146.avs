LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v146 = LSMASHVideoSource(dst_dir + "v146rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v146f.mp4")
v146 = ImageSource(file = dst_dir + "v146-png\v146-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v146 = v146.convertToY.adjustSize

#v146 = v146.extractY.convertToYV12(interlaced=false)
#v146 = v146.deScratch.extractY

v146 = v146.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v146 = v146.convertBits(8).convertToYV12(interlaced=false)

v146 = v146.deScratch.extractY
v146 = v146.removeDirt
v146 = v146.convertToYV12(interlaced=false)
v146 = v146.UnsharpMask(strength=400, radius=5, threshold=1)
v146 = v146.adjustBorders
#v146 = v146.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v146 = v146.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v146, audio_rate = 48000, channels = 2).killVideo
v146 = v146.audioDub(va)

return v146.Prefetch

