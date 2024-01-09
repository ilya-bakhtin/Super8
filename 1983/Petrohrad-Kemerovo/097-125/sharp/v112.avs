import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v112 = LSMASHVideoSource(dst_dir + "v112rc.mp4")

v112 = v112.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v112 = v112.convertToYV12(interlaced=false)

v112 = v112.UnsharpMask(strength=500, radius=5, threshold=1)
v112 = v112.adjustBorders

va = BlankClip(v112, audio_rate = 48000, channels = 2).killVideo
v112 = v112.audioDub(va)

return v112.Prefetch

