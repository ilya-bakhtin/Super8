LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v2 = LSMASHVideoSource(dst_dir + "v2f.mp4")

v2 = v2.convertToY.adjustSize

v2 = v2.autolevels(gamma=0.7)

v2 = v2.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v2 = v2.convertBits(8).convertToYV12(interlaced=false)

v2 = v2.deScratch.extractY
v2 = v2.removeDirt

v2 = v2.convertToYV12(interlaced=false)

v2 = v2.UnsharpMask(strength=400, radius=5, threshold=1)
v2 = v2.adjustBorders

va = BlankClip(v2, audio_rate = 48000, channels = 2).killVideo
v2 = v2.audioDub(va)

return v2.Prefetch

