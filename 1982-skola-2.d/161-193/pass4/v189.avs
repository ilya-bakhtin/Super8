LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v189 = LSMASHVideoSource(dst_dir + "v189rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v189f.mp4")
v189 = ImageSource(file = dst_dir + "v189-png\v189-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v189 = v189.convertToY.adjustSize

#v189 = v189.extractY.convertToYV12(interlaced=false)
#v189 = v189.deScratch.extractY

v189 = v189.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v189 = v189.convertBits(8).convertToYV12(interlaced=false)

v189 = v189.deScratch.extractY
v189 = v189.removeDirt
v189 = v189.convertToYV12(interlaced=false)
v189 = v189.UnsharpMask(strength=400, radius=5, threshold=1)
v189 = v189.adjustBorders
#v189 = v189.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v189 = v189.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v189, audio_rate = 48000, channels = 2).killVideo
v189 = v189.audioDub(va)

return v189.Prefetch

