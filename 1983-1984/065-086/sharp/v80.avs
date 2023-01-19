LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v80 = LSMASHVideoSource(dst_dir + "v80rc.mp4")

v80 = v80.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v80 = v80.convertToYV12(interlaced=false)

v80 = v80.deScratch
v80 = v80.removeDirt

v80 = v80.UnsharpMask(strength=400, radius=5, threshold=1)
v80 = v80.adjustBorders

va = BlankClip(v80, audio_rate = 48000, channels = 2).killVideo
v80 = v80.audioDub(va)

return v80.Prefetch

