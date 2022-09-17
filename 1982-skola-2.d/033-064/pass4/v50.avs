LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v50 = LSMASHVideoSource(dst_dir + "v50rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v50f.mp4")
v50 = ImageSource(file = dst_dir + "v50-png\v50-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v50 = v50.convertToY.adjustSize

#v50 = v50.extractY.convertToYV12(interlaced=false)
#v50 = v50.deScratch.extractY

v50 = v50.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v50 = v50.convertBits(8).convertToYV12(interlaced=false)

v50 = v50.deScratch.extractY
v50 = v50.removeDirt
v50 = v50.convertToYV12(interlaced=false)
v50 = v50.UnsharpMask(strength=400, radius=5, threshold=1)
v50 = v50.adjustBorders
#v50 = v50.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v50 = v50.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v50, audio_rate = 48000, channels = 2).killVideo
v50 = v50.audioDub(va)

return v50.Prefetch

