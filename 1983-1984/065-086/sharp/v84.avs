LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v84 = LSMASHVideoSource(dst_dir + "v84rc.mp4")

v84 = v84.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v84 = v84.convertToYV12(interlaced=false)

v84 = v84.deScratch
v84 = v84.removeDirt

v84 = v84.UnsharpMask(strength=400, radius=5, threshold=1)
v84 = v84.adjustBorders

va = BlankClip(v84, audio_rate = 48000, channels = 2).killVideo
v84 = v84.audioDub(va)

return v84.Prefetch

