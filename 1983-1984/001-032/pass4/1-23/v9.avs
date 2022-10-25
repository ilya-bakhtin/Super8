LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v9 = LSMASHVideoSource(dst_dir + "v9f.mp4")

v9 = v9.convertToY.adjustSize

v9 = v9.autolevels(gamma=0.7)

v9 = v9.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v9 = v9.convertBits(8).convertToYV12(interlaced=false)

v9 = v9.deScratch.extractY
v9 = v9.removeDirt

v9 = v9.convertToYV12(interlaced=false)

v9 = v9.UnsharpMask(strength=400, radius=5, threshold=1)
v9 = v9.adjustBorders

va = BlankClip(v9, audio_rate = 48000, channels = 2).killVideo
v9 = v9.audioDub(va)

return v9.Prefetch

