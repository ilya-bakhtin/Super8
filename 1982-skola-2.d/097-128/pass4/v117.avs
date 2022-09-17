LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v117 = LSMASHVideoSource(dst_dir + "v117rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v117f.mp4")
v117 = ImageSource(file = dst_dir + "v117-png\v117-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v117 = v117.convertToY.adjustSize

#v117 = v117.extractY.convertToYV12(interlaced=false)
#v117 = v117.deScratch.extractY

v117 = v117.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v117 = v117.convertBits(8).convertToYV12(interlaced=false)

v117 = v117.deScratch.extractY
v117 = v117.removeDirt
v117 = v117.convertToYV12(interlaced=false)
v117 = v117.UnsharpMask(strength=400, radius=5, threshold=1)
v117 = v117.adjustBorders
#v117 = v117.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v117 = v117.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v117, audio_rate = 48000, channels = 2).killVideo
v117 = v117.audioDub(va)

return v117.Prefetch

