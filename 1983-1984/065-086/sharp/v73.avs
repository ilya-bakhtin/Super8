LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v73 = LSMASHVideoSource(dst_dir + "v73rc.mp4")

v73 = v73.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v73 = v73.convertToYV12(interlaced=false)

v73 = v73.deScratch
v73 = v73.removeDirt

v73 = v73.UnsharpMask(strength=400, radius=5, threshold=1)
v73 = v73.adjustBorders

va = BlankClip(v73, audio_rate = 48000, channels = 2).killVideo
v73 = v73.audioDub(va)

return v73.Prefetch

