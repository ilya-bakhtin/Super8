LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v176 = LSMASHVideoSource(dst_dir + "v176rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v176f.mp4")
v176 = ImageSource(file = dst_dir + "v176-png\v176-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v176 = v176.convertToY.adjustSize

#v176 = v176.extractY.convertToYV12(interlaced=false)
#v176 = v176.deScratch.extractY

v176 = v176.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v176 = v176.convertBits(8).convertToYV12(interlaced=false)

v176 = v176.deScratch.extractY
v176 = v176.removeDirt
v176 = v176.convertToYV12(interlaced=false)
v176 = v176.UnsharpMask(strength=400, radius=5, threshold=1)
v176 = v176.adjustBorders
#v176 = v176.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v176 = v176.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v176, audio_rate = 48000, channels = 2).killVideo
v176 = v176.audioDub(va)

return v176.Prefetch

