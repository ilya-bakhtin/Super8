LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v56 = LSMASHVideoSource(dst_dir + "v56rc.mp4")

v56 = v56.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v56 = v56.convertToYV12(interlaced=false)

v56 = v56.deScratch
v56 = v56.removeDirt

v56 = v56.UnsharpMask(strength=400, radius=5, threshold=1)
v56 = v56.adjustBorders

va = BlankClip(v56, audio_rate = 48000, channels = 2).killVideo
v56 = v56.audioDub(va)

return v56.Prefetch

