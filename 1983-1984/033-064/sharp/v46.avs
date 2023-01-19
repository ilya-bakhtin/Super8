LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v46 = LSMASHVideoSource(dst_dir + "v46rc.mp4")

v46 = v46.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v46 = v46.convertToYV12(interlaced=false)

v46 = v46.deScratch
v46 = v46.removeDirt

v46 = v46.UnsharpMask(strength=400, radius=5, threshold=1)
v46 = v46.adjustBorders

va = BlankClip(v46, audio_rate = 48000, channels = 2).killVideo
v46 = v46.audioDub(va)

return v46.Prefetch

