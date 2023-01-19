LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v69 = LSMASHVideoSource(dst_dir + "v69rc.mp4")

v69 = v69.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v69 = v69.convertToYV12(interlaced=false)

v69 = v69.deScratch
v69 = v69.removeDirt

v69 = v69.UnsharpMask(strength=400, radius=5, threshold=1)
v69 = v69.adjustBorders

va = BlankClip(v69, audio_rate = 48000, channels = 2).killVideo
v69 = v69.audioDub(va)

return v69.Prefetch

