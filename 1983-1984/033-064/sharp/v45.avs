LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v45 = LSMASHVideoSource(dst_dir + "v45rc.mp4")

v45 = v45.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v45 = v45.convertToYV12(interlaced=false)

v45 = v45.deScratch
v45 = v45.removeDirt

v45 = v45.UnsharpMask(strength=400, radius=5, threshold=1)
v45 = v45.adjustBorders

va = BlankClip(v45, audio_rate = 48000, channels = 2).killVideo
v45 = v45.audioDub(va)

return v45.Prefetch

