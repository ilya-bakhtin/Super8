LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v59 = LSMASHVideoSource(dst_dir + "v59rc.mp4")

v59 = v59.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v59 = v59.convertToYV12(interlaced=false)

v59 = v59.deScratch
v59 = v59.removeDirt

v59 = v59.UnsharpMask(strength=400, radius=5, threshold=1)
v59 = v59.adjustBorders

va = BlankClip(v59, audio_rate = 48000, channels = 2).killVideo
v59 = v59.audioDub(va)

return v59.Prefetch

