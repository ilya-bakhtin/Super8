LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v3 = LSMASHVideoSource(dst_dir + "v3f.mp4")

v3 = v3.convertToY.adjustSize

v3 = v3.autolevels(gamma=0.7)

v3 = v3.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v3 = v3.convertBits(8).convertToYV12(interlaced=false)

v3 = v3.deScratch.extractY
v3 = v3.removeDirt

v3 = v3.convertToYV12(interlaced=false)

v3 = v3.UnsharpMask(strength=400, radius=5, threshold=1)
v3 = v3.adjustBorders

va = BlankClip(v3, audio_rate = 48000, channels = 2).killVideo
v3 = v3.audioDub(va)

return v3.Prefetch

