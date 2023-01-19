LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v64 = LSMASHVideoSource(dst_dir + "v64rc.mp4")

v64 = v64.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v64 = v64.convertToYV12(interlaced=false)

v64 = v64.deScratch
v64 = v64.removeDirt

v64 = v64.UnsharpMask(strength=400, radius=5, threshold=1)
v64 = v64.adjustBorders

va = BlankClip(v64, audio_rate = 48000, channels = 2).killVideo
v64 = v64.audioDub(va)

return v64.Prefetch

