LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v116 = LSMASHVideoSource(dst_dir + "v116rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v116f.mp4")
v116 = ImageSource(file = dst_dir + "v116-png\v116-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v116 = v116.convertToY.adjustSize

#v116 = v116.extractY.convertToYV12(interlaced=false)
#v116 = v116.deScratch.extractY

v116 = v116.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v116 = v116.convertBits(8).convertToYV12(interlaced=false)

v116 = v116.deScratch.extractY
v116 = v116.removeDirt
v116 = v116.convertToYV12(interlaced=false)
v116 = v116.UnsharpMask(strength=400, radius=5, threshold=1)
v116 = v116.adjustBorders
#v116 = v116.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v116 = v116.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v116, audio_rate = 48000, channels = 2).killVideo
v116 = v116.audioDub(va)

return v116.Prefetch

