LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v31 = LSMASHVideoSource(dst_dir + "v31rc.mp4")

v31 = v31.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v31 = v31.convertToYV12(interlaced=false)

v31 = v31.deScratch
v31 = v31.removeDirt

v31 = v31.UnsharpMask(strength=400, radius=5, threshold=1)
v31 = v31.adjustBorders

va = BlankClip(v31, audio_rate = 48000, channels = 2).killVideo
v31 = v31.audioDub(va)

return v31.Prefetch

