LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
v10 = LSMASHVideoSource(dst_dir + "v10f.mp4")

v10 = v10.convertToY.adjustSize

v10 = v10.autolevels(gamma=0.7)

v10 = v10.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v10 = v10.convertBits(8).convertToYV12(interlaced=false)

v10 = v10.deScratch.extractY
v10 = v10.removeDirt

v10 = v10.convertToYV12(interlaced=false)

v10 = v10.UnsharpMask(strength=400, radius=5, threshold=1)
v10 = v10.adjustBorders

va = BlankClip(v10, audio_rate = 48000, channels = 2).killVideo
v10 = v10.audioDub(va)

return v10.Prefetch

