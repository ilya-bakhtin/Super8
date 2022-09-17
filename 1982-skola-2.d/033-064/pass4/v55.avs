LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v55 = LSMASHVideoSource(dst_dir + "v55rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v55f.mp4")
v55 = ImageSource(file = dst_dir + "v55-png\v55-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v55 = v55.convertToY.adjustSize

#v55 = v55.extractY.convertToYV12(interlaced=false)
#v55 = v55.deScratch.extractY

v55 = v55.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v55 = v55.convertBits(8).convertToYV12(interlaced=false)

v55 = v55.deScratch.extractY
v55 = v55.removeDirt
v55 = v55.convertToYV12(interlaced=false)
v55 = v55.UnsharpMask(strength=500, radius=7, threshold=1)
v55 = v55.adjustBorders
#v55 = v55.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v55 = v55.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v55, audio_rate = 48000, channels = 2).killVideo
v55 = v55.audioDub(va)

return v55.Prefetch

