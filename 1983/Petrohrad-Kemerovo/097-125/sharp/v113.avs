import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v113 = LSMASHVideoSource(dst_dir + "v113rc.mp4")

v113 = v113.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v113 = v113.convertToYV12(interlaced=false)

v113 = v113.UnsharpMask(strength=500, radius=5, threshold=1)
v113 = v113.adjustBorders

va = BlankClip(v113, audio_rate = 48000, channels = 2).killVideo
v113 = v113.audioDub(va)

return v113.Prefetch

