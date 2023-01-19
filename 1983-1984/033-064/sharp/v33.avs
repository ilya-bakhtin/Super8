LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v33 = LSMASHVideoSource(dst_dir + "v33rc.mp4")

v33 = v33.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v33 = v33.convertToYV12(interlaced=false)

v33 = v33.deScratch
v33 = v33.removeDirt

v33 = v33.UnsharpMask(strength=400, radius=5, threshold=1)
v33 = v33.adjustBorders

va = BlankClip(v33, audio_rate = 48000, channels = 2).killVideo
v33 = v33.audioDub(va)

return v33.Prefetch

