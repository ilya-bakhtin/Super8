LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v61 = LSMASHVideoSource(dst_dir + "v61rc.mp4")

v61 = v61.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v61 = v61.convertToYV12(interlaced=false)

v61 = v61.deScratch
v61 = v61.removeDirt

v61 = v61.UnsharpMask(strength=400, radius=5, threshold=1)
v61 = v61.adjustBorders

va = BlankClip(v61, audio_rate = 48000, channels = 2).killVideo
v61 = v61.audioDub(va)

return v61.Prefetch

