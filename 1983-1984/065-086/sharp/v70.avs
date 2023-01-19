LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v70 = LSMASHVideoSource(dst_dir + "v70rc.mp4")

v70 = v70.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v70 = v70.convertToYV12(interlaced=false)

v70 = v70.deScratch
v70 = v70.removeDirt

v70 = v70.UnsharpMask(strength=400, radius=5, threshold=1)
v70 = v70.adjustBorders

va = BlankClip(v70, audio_rate = 48000, channels = 2).killVideo
v70 = v70.audioDub(va)

return v70.Prefetch

