LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v86 = LSMASHVideoSource(dst_dir + "v86rc.mp4")

v86 = v86.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v86 = v86.convertToYV12(interlaced=false)

v86 = v86.deScratch
v86 = v86.removeDirt

v86 = v86.UnsharpMask(strength=400, radius=5, threshold=1)
v86 = v86.adjustBorders

va = BlankClip(v86, audio_rate = 48000, channels = 2).killVideo
v86 = v86.audioDub(va)

return v86.Prefetch

