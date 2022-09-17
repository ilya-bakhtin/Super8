LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v64 = LSMASHVideoSource(dst_dir + "v64rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v64f.mp4")
v64 = ImageSource(file = dst_dir + "v64-png\v64-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v64 = v64.convertToY.adjustSize

#v64 = v64.extractY.convertToYV12(interlaced=false)
#v64 = v64.deScratch.extractY

v64 = v64.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v64 = v64.convertBits(8).convertToYV12(interlaced=false)

v64 = v64.deScratch.extractY
v64 = v64.removeDirt
v64 = v64.convertToYV12(interlaced=false)
v64 = v64.UnsharpMask(strength=400, radius=5, threshold=1)
v64 = v64.adjustBorders
#v64 = v64.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v64 = v64.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v64, audio_rate = 48000, channels = 2).killVideo
v64 = v64.audioDub(va)

return v64.Prefetch

