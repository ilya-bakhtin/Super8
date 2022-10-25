LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v7 = LSMASHVideoSource(dst_dir + "v7f.mp4")

v7 = v7.convertToY.adjustSize

v7 = v7.autolevels(gamma=0.7)

v7 = v7.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v7 = v7.convertBits(8).convertToYV12(interlaced=false)

v7 = v7.deScratch.extractY
v7 = v7.removeDirt

v7 = v7.convertToYV12(interlaced=false)

v7 = v7.UnsharpMask(strength=400, radius=5, threshold=1)
v7 = v7.adjustBorders

va = BlankClip(v7, audio_rate = 48000, channels = 2).killVideo
v7 = v7.audioDub(va)

return v7.Prefetch

