LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v38 = LSMASHVideoSource(dst_dir + "v38rc.mp4")

v38 = v38.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v38 = v38.convertToYV12(interlaced=false)

v38 = v38.deScratch
v38 = v38.removeDirt

v38 = v38.UnsharpMask(strength=400, radius=5, threshold=1)
v38 = v38.adjustBorders

va = BlankClip(v38, audio_rate = 48000, channels = 2).killVideo
v38 = v38.audioDub(va)

return v38.Prefetch

