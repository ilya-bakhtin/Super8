LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v54 = LSMASHVideoSource(dst_dir + "v54rc.mp4")

v54 = v54.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v54 = v54.convertToYV12(interlaced=false)

v54 = v54.deScratch
v54 = v54.removeDirt

v54 = v54.UnsharpMask(strength=400, radius=5, threshold=1)
v54 = v54.adjustBorders

va = BlankClip(v54, audio_rate = 48000, channels = 2).killVideo
v54 = v54.audioDub(va)

return v54.Prefetch

