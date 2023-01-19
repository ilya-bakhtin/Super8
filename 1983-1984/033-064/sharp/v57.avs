LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v57 = LSMASHVideoSource(dst_dir + "v57rc.mp4")

v57 = v57.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v57 = v57.convertToYV12(interlaced=false)

v57 = v57.deScratch
v57 = v57.removeDirt

v57 = v57.UnsharpMask(strength=400, radius=5, threshold=1)
v57 = v57.adjustBorders

va = BlankClip(v57, audio_rate = 48000, channels = 2).killVideo
v57 = v57.audioDub(va)

return v57.Prefetch

