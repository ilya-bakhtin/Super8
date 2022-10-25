LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v8 = LSMASHVideoSource(dst_dir + "v8f.mp4")

v8 = v8.convertToY.adjustSize

v8 = v8.autolevels(gamma=0.7)

v8 = v8.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v8 = v8.convertBits(8).convertToYV12(interlaced=false)

v8 = v8.deScratch.extractY
v8 = v8.removeDirt

v8 = v8.convertToYV12(interlaced=false)

v8 = v8.UnsharpMask(strength=400, radius=5, threshold=1)
v8 = v8.adjustBorders

va = BlankClip(v8, audio_rate = 48000, channels = 2).killVideo
v8 = v8.audioDub(va)

return v8.Prefetch

