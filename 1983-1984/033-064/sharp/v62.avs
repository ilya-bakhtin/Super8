LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v62 = LSMASHVideoSource(dst_dir + "v62rc.mp4")

v62 = v62.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v62 = v62.convertToYV12(interlaced=false)

v62 = v62.deScratch
v62 = v62.removeDirt

v62 = v62.UnsharpMask(strength=400, radius=5, threshold=1)
v62 = v62.adjustBorders

va = BlankClip(v62, audio_rate = 48000, channels = 2).killVideo
v62 = v62.audioDub(va)

return v62.Prefetch

