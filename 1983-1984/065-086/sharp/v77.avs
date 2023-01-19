LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v77 = LSMASHVideoSource(dst_dir + "v77rc.mp4")

v77 = v77.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v77 = v77.convertToYV12(interlaced=false)

v77 = v77.deScratch
v77 = v77.removeDirt

v77 = v77.UnsharpMask(strength=400, radius=5, threshold=1)
v77 = v77.adjustBorders

va = BlankClip(v77, audio_rate = 48000, channels = 2).killVideo
v77 = v77.audioDub(va)

return v77.Prefetch

