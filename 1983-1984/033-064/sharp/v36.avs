LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.avs")
v36 = LSMASHVideoSource(dst_dir + "v36rc.mp4")

v36 = v36.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v36 = v36.convertToYV12(interlaced=false)

v36 = v36.deScratch
v36 = v36.removeDirt

v36 = v36.UnsharpMask(strength=400, radius=5, threshold=1)
v36 = v36.adjustBorders

va = BlankClip(v36, audio_rate = 48000, channels = 2).killVideo
v36 = v36.audioDub(va)

return v36.Prefetch

