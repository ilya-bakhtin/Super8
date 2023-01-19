LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v72 = LSMASHVideoSource(dst_dir + "v72rc.mp4")

v72 = v72.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v72 = v72.convertToYV12(interlaced=false)

v72 = v72.deScratch
v72 = v72.removeDirt

v72 = v72.UnsharpMask(strength=400, radius=5, threshold=1)
v72 = v72.adjustBorders

va = BlankClip(v72, audio_rate = 48000, channels = 2).killVideo
v72 = v72.audioDub(va)

return v72.Prefetch

