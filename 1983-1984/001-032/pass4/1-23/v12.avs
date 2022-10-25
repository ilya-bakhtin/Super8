LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v12 = LSMASHVideoSource(dst_dir + "v12f.mp4")

v12 = v12.convertToY.adjustSize

v12 = v12.autolevels(gamma=0.7)

v12 = v12.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v12 = v12.convertBits(8).convertToYV12(interlaced=false)

v12 = v12.deScratch.extractY
v12 = v12.removeDirt

v12 = v12.convertToYV12(interlaced=false)

v12 = v12.UnsharpMask(strength=400, radius=5, threshold=1)
v12 = v12.adjustBorders

va = BlankClip(v12, audio_rate = 48000, channels = 2).killVideo
v12 = v12.audioDub(va)

return v12.Prefetch

