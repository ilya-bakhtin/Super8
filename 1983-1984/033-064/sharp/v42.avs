LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v42 = LSMASHVideoSource(dst_dir + "v42rc.mp4")

v42 = v42.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v42 = v42.convertToYV12(interlaced=false)

v42 = v42.deScratch
v42 = v42.removeDirt

v42 = v42.UnsharpMask(strength=400, radius=5, threshold=1)
v42 = v42.adjustBorders

va = BlankClip(v42, audio_rate = 48000, channels = 2).killVideo
v42 = v42.audioDub(va)

return v42.Prefetch

