LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v78 = LSMASHVideoSource(dst_dir + "v78rc.mp4")

v78 = v78.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v78 = v78.convertToYV12(interlaced=false)

v78 = v78.deScratch
v78 = v78.removeDirt

v78 = v78.UnsharpMask(strength=400, radius=5, threshold=1)
v78 = v78.adjustBorders

va = BlankClip(v78, audio_rate = 48000, channels = 2).killVideo
v78 = v78.audioDub(va)

return v78.Prefetch

