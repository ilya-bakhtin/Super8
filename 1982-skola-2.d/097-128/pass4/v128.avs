LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v128 = LSMASHVideoSource(dst_dir + "v128rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v128f.mp4")
v128 = ImageSource(file = dst_dir + "v128-png\v128-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v128 = v128.convertToY.adjustSize

#v128 = v128.extractY.convertToYV12(interlaced=false)
#v128 = v128.deScratch.extractY

v128 = v128.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v128 = v128.convertBits(8).convertToYV12(interlaced=false)

v128 = v128.deScratch.extractY
v128 = v128.removeDirt
v128 = v128.convertToYV12(interlaced=false)
v128 = v128.UnsharpMask(strength=400, radius=5, threshold=1)
v128 = v128.adjustBorders
#v128 = v128.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v128 = v128.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v128, audio_rate = 48000, channels = 2).killVideo
v128 = v128.audioDub(va)

return v128.Prefetch

