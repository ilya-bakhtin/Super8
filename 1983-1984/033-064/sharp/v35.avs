LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v35 = LSMASHVideoSource(dst_dir + "v35rc.mp4")

v35 = v35.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v35 = v35.convertToYV12(interlaced=false)

v35 = v35.deScratch
v35 = v35.removeDirt

v35 = v35.UnsharpMask(strength=400, radius=5, threshold=1)
v35 = v35.adjustBorders

va = BlankClip(v35, audio_rate = 48000, channels = 2).killVideo
v35 = v35.audioDub(va)

return v35.Prefetch

