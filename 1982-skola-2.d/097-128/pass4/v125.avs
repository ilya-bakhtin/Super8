LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v125 = LSMASHVideoSource(dst_dir + "v125rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v125f.mp4")
v125 = ImageSource(file = dst_dir + "v125-png\v125-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v125 = v125.convertToY.adjustSize

#v125 = v125.extractY.convertToYV12(interlaced=false)
#v125 = v125.deScratch.extractY

v125 = v125.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v125 = v125.convertBits(8).convertToYV12(interlaced=false)

v125 = v125.deScratch.extractY
v125 = v125.removeDirt
v125 = v125.convertToYV12(interlaced=false)
v125 = v125.UnsharpMask(strength=400, radius=5, threshold=1)
v125 = v125.adjustBorders
#v125 = v125.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v125 = v125.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v125, audio_rate = 48000, channels = 2).killVideo
v125 = v125.audioDub(va)

return v125.Prefetch

