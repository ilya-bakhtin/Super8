LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v11 = LSMASHVideoSource(dst_dir + "v11f.mp4")

v11 = v11.convertToY.adjustSize

v11 = v11.autolevels(gamma=0.7)

v11 = v11.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v11 = v11.convertBits(8).convertToYV12(interlaced=false)

v11 = v11.deScratch.extractY
v11 = v11.removeDirt

v11 = v11.convertToYV12(interlaced=false)

v11 = v11.UnsharpMask(strength=400, radius=5, threshold=1)
v11 = v11.adjustBorders

va = BlankClip(v11, audio_rate = 48000, channels = 2).killVideo
v11 = v11.audioDub(va)

return v11.Prefetch

