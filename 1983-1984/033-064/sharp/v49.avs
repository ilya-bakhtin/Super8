LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v49 = LSMASHVideoSource(dst_dir + "v49rc.mp4")

v49 = v49.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v49 = v49.convertToYV12(interlaced=false)

v49 = v49.deScratch
v49 = v49.removeDirt

v49 = v49.UnsharpMask(strength=400, radius=5, threshold=1)
v49 = v49.adjustBorders

va = BlankClip(v49, audio_rate = 48000, channels = 2).killVideo
v49 = v49.audioDub(va)

return v49.Prefetch

