LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v58 = LSMASHVideoSource(dst_dir + "v58rc.mp4")

v58 = v58.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v58 = v58.convertToYV12(interlaced=false)

v58 = v58.deScratch
v58 = v58.removeDirt

v58 = v58.UnsharpMask(strength=400, radius=5, threshold=1)
v58 = v58.adjustBorders

va = BlankClip(v58, audio_rate = 48000, channels = 2).killVideo
v58 = v58.audioDub(va)

return v58.Prefetch

