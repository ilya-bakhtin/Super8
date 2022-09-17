LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v72 = LSMASHVideoSource(dst_dir + "v72rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v72f.mp4")
v72 = ImageSource(file = dst_dir + "v72-png\v72-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v72 = v72.convertToY.adjustSize

#v72 = v72.extractY.convertToYV12(interlaced=false)
#v72 = v72.deScratch.extractY

v72 = v72.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v72 = v72.convertBits(8).convertToYV12(interlaced=false)

v72 = v72.deScratch.extractY
v72 = v72.removeDirt
v72 = v72.convertToYV12(interlaced=false)
v72 = v72.UnsharpMask(strength=400, radius=5, threshold=1)
v72 = v72.adjustBorders
#v72 = v72.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v72 = v72.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v72, audio_rate = 48000, channels = 2).killVideo
v72 = v72.audioDub(va)

return v72.Prefetch

