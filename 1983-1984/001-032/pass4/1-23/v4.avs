LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v4 = LSMASHVideoSource(dst_dir + "v4f.mp4")

v4 = v4.convertToY.adjustSize

v4 = v4.autolevels(gamma=0.7)

v4 = v4.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v4 = v4.convertBits(8).convertToYV12(interlaced=false)

v4 = v4.deScratch.extractY
v4 = v4.removeDirt

v4 = v4.convertToYV12(interlaced=false)

v4 = v4.UnsharpMask(strength=400, radius=5, threshold=1)
v4 = v4.adjustBorders

va = BlankClip(v4, audio_rate = 48000, channels = 2).killVideo
v4 = v4.audioDub(va)

return v4.Prefetch

