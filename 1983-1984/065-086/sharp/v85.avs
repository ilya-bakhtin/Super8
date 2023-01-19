LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v85 = LSMASHVideoSource(dst_dir + "v85rc.mp4")

v85 = v85.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v85 = v85.convertToYV12(interlaced=false)

v85 = v85.deScratch
v85 = v85.removeDirt

v85 = v85.UnsharpMask(strength=400, radius=5, threshold=1)
v85 = v85.adjustBorders

va = BlankClip(v85, audio_rate = 48000, channels = 2).killVideo
v85 = v85.audioDub(va)

return v85.Prefetch

