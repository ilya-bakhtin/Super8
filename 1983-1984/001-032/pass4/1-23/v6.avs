LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v6 = LSMASHVideoSource(dst_dir + "v6f.mp4")

v6 = v6.convertToY.adjustSize

v6 = v6.autolevels(gamma=0.7)

v6 = v6.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v6 = v6.convertBits(8).convertToYV12(interlaced=false)

v6 = v6.deScratch.extractY
v6 = v6.removeDirt

v6 = v6.convertToYV12(interlaced=false)

v6 = v6.UnsharpMask(strength=400, radius=5, threshold=1)
v6 = v6.adjustBorders

va = BlankClip(v6, audio_rate = 48000, channels = 2).killVideo
v6 = v6.audioDub(va)

return v6.Prefetch

