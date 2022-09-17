LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v71 = LSMASHVideoSource(dst_dir + "v71rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v71f.mp4")
v71 = ImageSource(file = dst_dir + "v71-png\v71-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v71 = v71.convertToY.adjustSize

#v71 = v71.extractY.convertToYV12(interlaced=false)
#v71 = v71.deScratch.extractY

v71 = v71.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v71 = v71.convertBits(8).convertToYV12(interlaced=false)

v71 = v71.deScratch.extractY
v71 = v71.removeDirt
v71 = v71.convertToYV12(interlaced=false)
v71 = v71.UnsharpMask(strength=400, radius=5, threshold=1)
v71 = v71.adjustBorders
#v71 = v71.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v71 = v71.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v71, audio_rate = 48000, channels = 2).killVideo
v71 = v71.audioDub(va)

return v71.Prefetch

