LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v188 = LSMASHVideoSource(dst_dir + "v188rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v188f.mp4")
v188 = ImageSource(file = dst_dir + "v188-png\v188-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v188 = v188.convertToY.adjustSize

#v188 = v188.extractY.convertToYV12(interlaced=false)
#v188 = v188.deScratch.extractY

v188 = v188.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v188 = v188.convertBits(8).convertToYV12(interlaced=false)

v188 = v188.deScratch.extractY
v188 = v188.removeDirt
v188 = v188.convertToYV12(interlaced=false)
v188 = v188.UnsharpMask(strength=400, radius=5, threshold=1)
v188 = v188.adjustBorders
#v188 = v188.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v188 = v188.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v188, audio_rate = 48000, channels = 2).killVideo
v188 = v188.audioDub(va)

return v188.Prefetch

